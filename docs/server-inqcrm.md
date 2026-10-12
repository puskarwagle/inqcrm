# Inqcrm Server Playbook

Trimmed from `serverfull.md` — inqcrm only. For anything else on the server
(other apps, full pm2/port/nginx tables), read `serverfull.md`.

This repo's server copy lives at `/root/projects/inqcrm`, branch `inqcrm-2.2`.

## How to connect

Run: `ssh go`

- Host: `server1.booleantservices.com` (IP `159.198.32.82`)
- User: `root`
- Alias `go` is defined in the local `~/.ssh/config`. Always use `ssh go` — never hardcode the IP.
- **ControlMaster is enabled** on the `go` alias: the first `ssh go` opens a connection that's reused by later calls (persists 10 min), so repeated `ssh go 'cmd'` are fast. To reset it: `rm ~/.ssh/cm-root@159.198.32.82:22`.

## Environment (inqcrm-relevant)

- **OS**: Ubuntu 24.04.4 LTS
- **PHP**: php8.3 (serves port 8000)
- **Node**: v24.18.0 via nvm (`/root/.nvm/versions/node/v24.18.0`); system node is v22.23.1 at `/usr/bin/node`
- **pm2**: `/root/.nvm/versions/node/v24.18.0/bin/pm2`, also wrapped at `/usr/local/bin/pm2` (works everywhere)
- **MySQL 8** (127.0.0.1:3306), db `inqcrm`. Client: `mysql`

## pm2 (inqcrm only)

| pm_id | name        | cwd                   | port | status |
|-------|-------------|-----------------------|------|--------|
| 8     | inqcrm-php  | /root/projects/inqcrm | 8000 | online |
| 9     | inqcrm-vite | /root/projects/inqcrm | 5173 | online |

Always trust `pm2 ls` over this table if they disagree.

## Listening ports (inqcrm only)

| Port | Service          |
|------|------------------|
| 8000 | inqcrm-php       |
| 5173 | inqcrm-vite      |
| 3306 | MySQL (loopback) |

Ports 8000/5173 are bound to 0.0.0.0 + UFW ALLOW — direct-IP access, no nginx vhost. Login at `http://159.198.32.82:8000/admin/login`.

## Project

| Dir    | What it is                                                                 | Git remote                                      | Branch     |
|--------|----------------------------------------------------------------------------|-------------------------------------------------|------------|
| inqcrm | Laravel (PHP) + Vite, MySQL db `inqcrm`; seed login `admin@example.com` / `admin123` | git@github.com-wagle:puskarwagle/inqcrm | inqcrm-2.2 |

## Git setup (inqcrm only)

The server is a **deploy target** — it pulls, it doesn't develop. The inqcrm
remote uses the puskarwagle account:

- Key: `/root/.ssh/id_ed25519` (`server1-deploy`)
- Host alias in `/root/.ssh/config`: `github.com-wagle` → IdentityFile `id_ed25519`
- Remote: `git@github.com-wagle:puskarwagle/inqcrm.git`
- Git identity is global: `server1-deploy <deploy@server1>`

Remote verified working (`ls-remote` succeeds).

## Healthcheck script

`/usr/local/bin/healthcheck` on the server — run it yourself with `ssh go healthcheck` (or just `healthcheck` inside an interactive session). Three layers:

1. **pm2 process health** — every app online, crash-loop warning if restarts ≥ 50
2. **local HTTP checks** — curls each service on its port, validates the status class (2xx/3xx/4xx)
3. **external + infra** — public URLs through nginx, MySQL ping, SSL expiry, disk usage

Exit code: 0 = healthy, 1 = failures, 2 = warnings only.

## Fix log (inqcrm, Oct 12)

inqcrm moved `myui` → `inqcrm-2.2` (upstream 2.2 + NDIS modules re-applied). Deploy sequence: `composer install` → `php artisan migrate --force` → `db:seed --class="Database\Seeders\NDISDemoSeeder"` (8 participants / 8 plans / 14 prefs, idempotent) → `optimize:clear` (+ `config:clear`). NEVER `optimize`/`route:cache` there — NDIS placeholder routes use closures and break route caching. Old `myui` worktree changes (concord.php NDIS-provider removal + rebuilt vite assets) were stashed as `server-local before inqcrm-2.2 2026-10-12T09:06:13Z`, not applied. `admin@example.com` password reset to `admin123`; extra admins `admin2@`/`admin3@example.com` created (passwords live in chat history, not recorded here). Unknown pre-existing admin `rtpentest@rt-lab.net` left untouched — verify ownership, delete if unrecognised. inqcrm-vite was crash-looping (`ENOSPC: file watchers reached`, limit was 45589) → raised `fs.inotify.max_user_watches=524288` via sysctl and persisted in `/etc/sysctl.conf`.

## Useful commands

```bash
ssh go                       # connect (ControlMaster: subsequent calls are fast/reused)
ssh go 'pm2 ls'              # pm2 status (wrapper now works from any shell)
ssh go 'pm2 restart inqcrm-php inqcrm-vite'  # restart inqcrm processes
ssh go 'pm2 save'            # persist process list after changes
ssh go healthcheck           # full server healthcheck
```

Update inqcrm (NEVER artisan optimize/route:cache — closure routes break it):

```bash
ssh go 'git -C /root/projects/inqcrm fetch origin && git -C /root/projects/inqcrm checkout inqcrm-2.2 && git -C /root/projects/inqcrm pull origin inqcrm-2.2 && composer install --working-dir=/root/projects/inqcrm --no-interaction --prefer-dist && php8.3 /root/projects/inqcrm/artisan migrate --force && php8.3 /root/projects/inqcrm/artisan db:seed --class="Database\Seeders\NDISDemoSeeder" && php8.3 /root/projects/inqcrm/artisan optimize:clear'
```

Then verify: `ssh go 'curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/admin/login'` (expect 200).

## Gotchas

- Never expose/commit credentials. UFW is active; MySQL binds loopback only, while inqcrm ports 8000/5173 are intentionally `ALLOW`ed and bound to 0.0.0.0 (direct-IP access, no nginx vhost).
- **NEVER run `artisan optimize` or `route:cache` on the server** — NDIS placeholder routes use closures and break route caching. Use `optimize:clear` only.
- **vite ENOSPC**: if inqcrm-vite crash-loops with `ENOSPC: System limit for number of file watchers reached`, raise `fs.inotify.max_user_watches` (currently 524288, persisted in `/etc/sysctl.conf`) — don't debug app code first.
- After changing pm2 process list (add/delete/repoint), run `pm2 save` so the change survives reboots.
- Non-interactive shells get system node v22 unless you `export PATH=/root/.nvm/versions/node/v24.18.0/bin:$PATH` — the pm2 wrapper already does this for pm2.

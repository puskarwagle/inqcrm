# Krayin CRM: Agent Instructions

This repository ships reusable **agent skills** for developing Krayin CRM. These
instructions apply to all AI coding agents (Claude Code, Codex, Copilot, Cursor,
Kilo Code, etc.).

---

## Framework Context

- **Product:** Krayin CRM (Webkul) — an open-source Laravel CRM.
- **Stack:** Laravel `^12.0`, PHP `^8.3`, Pest `^3.0`, Laravel Pint `^1.18`.
- **Follow Krayin's own conventions** — use the patterns already present in this
  repository's modules; do not import patterns from other Laravel products.
- **Module location:** `packages/Webkul/{ModuleName}/src/`
- **Core modules (reference implementations):** `Lead`, `Contact`, `Activity`,
  `Quote`, `Product`, `User`, `Attribute`, `Core`, `Admin`, `DataGrid`.

---

## Skills

Workspace skills live in `.github/skills/` (canonical source) and are symlinked
into every agent runtime (`.ai`, `.claude`, `.codex`, `.cursor`, `.kilocode`).
See [.github/skills/README.md](.github/skills/README.md) for the standard.

| Skill | Use when |
|-------|----------|
| `crm-package-development` | Creating a new CRM package/module or extending CRM functionality without touching core. |
| `pest-testing` | Writing or debugging unit/feature tests with Pest. |

Read the relevant `SKILL.md` before starting work in its domain. Do not restate
skill content here — keep details in the skills.

---

## Critical Conventions (Never Deviate)

- **Never modify core Krayin files** unless explicitly required. Extend behavior
  through a package under `packages/Webkul/`.
- **All schema changes go through migrations** — never edit the database directly.
- **Follow the existing module layout** (Providers, Models, Contracts,
  Repositories, Http/Controllers, Routes, Database/Migrations, Resources/views,
  Config). The `crm-package-development` skill documents the full structure.
- **Repository pattern:** models are accessed through repositories bound via
  contracts in the service provider — match the surrounding modules.
- **Translations follow the views:** a package gets its own `Resources/lang/`
  **only if** it also has `Resources/views/`. Every view-less package keeps its
  strings in the Admin package under `admin::app.*` — no lang directory, no
  `loadTranslationsFrom()`. See the `crm-package-development` skill.
- **Every fix and feature updates `CHANGELOG.md`** in the same change, under the
  topmost unreleased version heading. Never invent a `#PR` number and never bump
  `KRAYIN_VERSION` outside a release commit. See the `crm-package-development`
  skill for the entry format and tags.
- **Preserve backward compatibility** so the CRM stays upgrade-safe.

---

## Development Cycle

```bash
composer install            # install PHP dependencies
php artisan migrate          # run migrations
php artisan test --compact   # run the Pest test suite
./vendor/bin/pint            # format code (PSR-12 via Laravel Pint)
```

- Add tests for new behavior; follow the `pest-testing` skill.
- Run `./vendor/bin/pint` before committing — CI applies Pint formatting.
- Validate the skills setup with `bash bin/validate-skills.sh`.

---

## Upstream Sync Runbook — inqcrm (whitelabel of krayin/laravel-crm)

Context (learned 2026-10-12): this repo was `git clone`d from Krayin, then
squash-imported as `first commit`. There is **no shared history** with upstream,
local was Laravel 10, upstream `2.2` is Laravel 12. Never `git pull`/`merge`
old branches (`myui`, `main`, `ndis`, `new`, `addfeatures`) directly into
upstream code — 900+ files diverge.

### Remotes (2.2 only, no branch sprawl)

```bash
git remote -v
# origin   https://github.com/puskarwagle/inqcrm.git
# upstream https://github.com/krayin/laravel-crm.git

git config --get-all remote.upstream.fetch
# must be exactly: +refs/heads/2.2:refs/remotes/upstream/2.2

# if wrong, lock it:
git config remote.upstream.fetch "+refs/heads/2.2:refs/remotes/upstream/2.2"
git fetch upstream
```

### Branch map

- `backup-myui-before-2.2-upgrade` — frozen pre-upgrade snapshot. Never commit here.
- `inqcrm-2.2` — clean integration branch, tracks `upstream/2.2` + re-applied
  custom modules. All new work goes here.
- Old `myui`/`main`/`ndis`/`new`/`addfeatures` — reference only.

### Custom surface (what must survive upgrades)

New files (copy verbatim with `git checkout <backup> -- <paths>`):
`packages/Webkul/Participant`, `packages/Webkul/NDISPlan`,
`packages/Webkul/Admin/src/Routes/Admin/ndis-routes.php` (includes AI
Assistant `/ai/*` placeholder routes), `packages/Webkul/Admin/src/Config/ndis-menu.php`,
`packages/Webkul/Admin/src/Resources/views/ndis/`,
`database/factories/NDISPlanFactory.php`, `database/factories/ParticipantFactory.php`,
NDIS `tests/Unit/**`, `docs/NDIS_MODULE_INVENTORY.md`, `docs/dplan.md`.

Wired edits (re-apply by hand, never wholesale checkout):
- `composer.json` psr-4: add `Webkul\Participant\` + `Webkul\NDISPlan\`.
- `config/concord.php`: keep upstream `use … as …` style, append the two
  ModuleServiceProviders.
- `packages/Webkul/Admin/src/Routes/Admin/web.php`: keep upstream
  `help-routes.php` + `rest-routes.php`, append `require 'ndis-routes.php'`.
- `packages/Webkul/Admin/src/Config/menu.php`: insert NDIS block before
  Settings. Watch for duplicate `],` at splice points — `php -l` must pass.
- `packages/Webkul/Admin/src/Resources/lang/en/app.php`: insert NDIS
  `layouts` keys after `'product'`. Do not copy whole file (upstream reflows
  formatting every release).

### Concord gotcha (hit 2026-10-12)

`Class Webkul\X\Models\Y must extend or implement Webkul\X\Contracts\Y` means
a provider declares `protected $models = […]` without a matching Contract.
For placeholder modules with no Contracts: **omit `$models` entirely**.
Keep `extends Webkul\Core\Providers\BaseModuleServiceProvider`,
`loadMigrationsFrom()`, and the repository singleton. Do not set
`$routesPath` to a non-existent file.

### Upgrade / fix cycle

```bash
git checkout inqcrm-2.2
git fetch upstream
git merge upstream/2.2
composer install            # re-runs package:discover; Concord error here = provider bug above
php artisan migrate --force
php artisan route:list --name=participants
php artisan route:list --name=ai.dashboard
php artisan test --compact
./vendor/bin/pint
```

### Local boot

- DB: `DB_CONNECTION=mysql DB_HOST=127.0.0.1 DB_PORT=3306 DB_DATABASE=inqcrm`
  (`php artisan migrate:status` must show 0 Pending; NDIS migrations are
  `2025_11_15_000000_*` / `000001_*`).
- Seed login: `admin@example.com` / `admin123` (Administrator, all).
  Verified with `Hash::check` — reset via tinker if lost.
- Serve: `php artisan serve --host=127.0.0.1 --port=8000` →
  `http://localhost:8000/admin/login`.

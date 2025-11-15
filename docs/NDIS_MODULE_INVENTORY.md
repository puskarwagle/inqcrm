# NDIS Module Inventory (Generated)

Date: 2025-11-15
Branch: addfeatures

This file documents the current state of the NDIS-related menu items, routes, models, views and other artifacts discovered in the repository. It was generated from a quick repository scan and is intended as a short checklist to plan implementation work.

---

## Summary
- Admin menu entries exist for many NDIS/related features in `packages/Webkul/Admin/src/Config/menu.php` (and `ndis-menu.php`).
- Routes exist in `packages/Webkul/Admin/src/Routes/Admin/ndis-routes.php` but they currently render a placeholder view (`admin::ndis.placeholder`).
- Placeholder view: `packages/Webkul/Admin/src/Resources/views/ndis/placeholder.blade.php`.
- Real package implementations present for:
  - Participants: `packages/Webkul/Participant` (model present)
  - NDIS Plans: `packages/Webkul/NDISPlan` (model present)
- Factories exist for Participant and NDISPlan (in `database/factories`).
- Several other modules are only scaffolded in menu/routes/docs and currently lack package/model/controller implementations.

---

## Per-module checklist
(Fields: Menu / Model (path) / Factory (path) / Routes / Controller / Views / Migrations / Notes)

### participants
- Menu: yes (`admin::app.layouts.participants` + subkeys in `packages/Webkul/Admin/src/Config/menu.php`).
- Model / package: yes — `packages/Webkul/Participant/src/Models/Participant.php`.
- Factory: yes — `database/factories/ParticipantFactory.php`.
- Routes: yes — placeholder routes in `packages/Webkul/Admin/src/Routes/Admin/ndis-routes.php` named `admin.participants.*`.
- Controller: none (routes render placeholder view closures).
- Views: placeholder exists at `packages/Webkul/Admin/src/Resources/views/ndis/placeholder.blade.php`.
- Migrations: not found in repository scan (no package migrations discovered).
- Notes: Participant model references serviceRequests (relationship) but `ServiceRequest` model/package is missing.

---

### ndis_plans (NDIS Plans)
- Menu: yes (`admin::app.layouts.ndis-plans`).
- Model / package: yes — `packages/Webkul/NDISPlan/src/Models/NDISPlan.php`.
- Factory: yes — `database/factories/NDISPlanFactory.php`.
- Routes: yes — placeholder routes `admin.ndis.plans.*` in `ndis-routes.php`.
- Controller: none (placeholder closures).
- Views: placeholder view present.
- Migrations: not found.
- Notes: NDISPlan references Billing (Invoice) which appears referenced by factories/tests but Billing package/model not present.

---

### service_requests
- Menu: yes.
- Model / package: missing (`Webkul\ServiceRequest\Models\ServiceRequest` not found).
- Factory: reference found — `database/factories/ServiceRequestFactory.php` (references missing model).
- Routes: yes (placeholder `admin.services.requests.*`).
- Controller: none.
- Views: placeholder view present.
- Migrations: not found.
- Notes: Add a `ServiceRequest` package/model or adjust factories/tests that reference it.

---

### providers
- Menu: yes.
- Model / package: missing (no `packages/Webkul/Provider` folder found).
- Factory: none.
- Routes: yes (placeholder `admin.providers.*`).
- Controller: none.
- Views: placeholder view.
- Migrations: not found.
- Notes: docs mention Provider model in `docs/addFeatures.md`, but code is not present.

---

### bookings
- Menu: yes.
- Model / package: missing.
- Factory: none.
- Routes: yes (placeholder `admin.bookings.*`).
- Controller: none.
- Views: placeholder view.
- Migrations: not found.

---

### billing (invoices, rates)
- Menu: yes.
- Model / package: missing (no `packages/Webkul/Billing` found), though `Invoice` is referenced in factories/tests/docs.
- Factory: `database/factories/InvoiceFactory.php` exists and references `Webkul\Billing\Models\Invoice`.
- Routes: yes (placeholder `admin.billing.*`).
- Controller: none.
- Views: placeholder view.
- Migrations: not found.

---

### documents
- Menu: yes.
- Model / package: missing.
- Factory: none.
- Routes: yes (placeholder `admin.documents.*`).
- Controller: none.
- Views: placeholder view.
- Migrations: not found.

---

### ai_assistant
- Menu: yes.
- Model / package: missing.
- Routes: yes (placeholder `admin.ai.*`).
- Controller: none.
- Views: placeholder view.
- Migrations: not found.

---

### reports
- Menu: yes.
- Model / package: missing (analytics views; no dedicated package found).
- Routes: yes (placeholder `admin.reports.*`).
- Controller: none.
- Views: placeholder view.

---

### ndis integration (api logs, sync)
- Menu: yes.
- Model / package: missing.
- Routes: yes (placeholder `admin.ndis.integration.*`).
- Views: placeholder.

---

### ndis settings
- Menu: yes.
- Model / package: missing.
- Routes: yes (placeholder `admin.settings.ndis.*`).
- Views: placeholder.

---

## General observations
- The admin menu + route wiring is in place for many NDIS features; the routes are intentionally wired to placeholder closures which makes incremental implementation straightforward.
- Two real packages exist and are usable right now: Participant and NDISPlan. They have models and factories and are the best starting points.
- Many other modules are missing backend implementations (models, migrations, controllers, repositories). Some tests/factories/docs reference missing models (ServiceRequest, Billing\Invoice, Provider) — these will fail if executed.
- No package-level migrations were discovered for new NDIS entities. If you intend to persist data, create migrations in the respective package or central migrations folder.

## Recommended next steps (pick one)

- Option A — Fast incremental (recommended):
  1. Implement admin controllers and index pages for `participants` and `ndis plans` first, using the existing models.
  2. Replace placeholder route closures with controller actions that return real views.
  3. Create package migrations for Participant and NDISPlan (if you want DB persistence), then run `php artisan migrate`.
  4. Add simple datagrids / resource controllers and tests for list/show operations.

- Option B — Implement missing packages (broader work):
  1. Create packages for ServiceRequest, Provider, Booking, Billing (Invoice), Documents and AI Assistant. For each: model, migration, repository, factory, provider, and minimal controller.
  2. Wire controllers to existing admin routes (update `ndis-routes.php` or add dedicated route files).

- Option C — Keep placeholders but improve UX:
  1. Replace closure placeholders with small controller actions that return live data where available (e.g., participants index uses Participant model to list items) while leaving others as placeholders.

- Translation/locales:
  - Add placeholder translation files for other locales (ar, es, fa, pt_BR, tr, vi) so UI does not display raw translation keys in non-English locales.

## Quick commands
From repo root for cache/translation refresh:

```bash
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear
# or
php artisan optimize:clear
```

If you add migrations:

```bash
php artisan migrate
php artisan db:seed --class=YourSeeder
```


## Where this data was collected from (examples)
- Menus: `packages/Webkul/Admin/src/Config/menu.php`
- Admin placeholder routes: `packages/Webkul/Admin/src/Routes/Admin/ndis-routes.php`
- Placeholder view: `packages/Webkul/Admin/src/Resources/views/ndis/placeholder.blade.php`
- Participant model: `packages/Webkul/Participant/src/Models/Participant.php`
- NDISPlan model: `packages/Webkul/NDISPlan/src/Models/NDISPlan.php`
- Factories: `database/factories/ParticipantFactory.php`, `database/factories/NDISPlanFactory.php`, `database/factories/InvoiceFactory.php`, `database/factories/ServiceRequestFactory.php`
- Docs references: `docs/addFeatures.md`

---

If you'd like, I can now:
- Generate a tabular CSV file with the exact file paths for each module (good for spreadsheets / trackers).
- Implement a minimal admin controller + index view for `participants` (use existing Participant model) and wire it to the route.
- Create placeholder translation entries for the other locales.

Which of the above would you like me to do next?

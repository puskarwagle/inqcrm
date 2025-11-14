<?php

use Illuminate\Support\Facades\Route;

/**
 * NDIS Routes - Placeholder routes for NDIS features
 * TODO: Replace with actual controllers when implemented
 */

// Participants
Route::prefix('participants')->group(function () {
    Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'Participants']))->name('admin.participants.index');
    Route::get('active', fn() => view('admin::ndis.placeholder', ['title' => 'Active Participants']))->name('admin.participants.active');
    Route::prefix('profiles')->group(function () {
        Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'Participant Profiles']))->name('admin.participants.profiles.index');
    });
});

// NDIS Plans
Route::prefix('ndis/plans')->group(function () {
    Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'NDIS Plans']))->name('admin.ndis.plans.index');
    Route::get('active', fn() => view('admin::ndis.placeholder', ['title' => 'Active Plans']))->name('admin.ndis.plans.active');
    Route::get('expiring', fn() => view('admin::ndis.placeholder', ['title' => 'Expiring Plans']))->name('admin.ndis.plans.expiring');
    Route::get('budget', fn() => view('admin::ndis.placeholder', ['title' => 'Budget Tracking']))->name('admin.ndis.plans.budget');
});

// Service Requests
Route::prefix('services/requests')->group(function () {
    Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'Service Requests']))->name('admin.services.requests.index');
    Route::get('open', fn() => view('admin::ndis.placeholder', ['title' => 'Open Requests']))->name('admin.services.requests.open');
    Route::get('in-progress', fn() => view('admin::ndis.placeholder', ['title' => 'In Progress Requests']))->name('admin.services.requests.in-progress');
    Route::get('scheduled', fn() => view('admin::ndis.placeholder', ['title' => 'Scheduled Requests']))->name('admin.services.requests.scheduled');
    Route::get('completed', fn() => view('admin::ndis.placeholder', ['title' => 'Completed Requests']))->name('admin.services.requests.completed');
});

// Providers
Route::prefix('providers')->group(function () {
    Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'Providers']))->name('admin.providers.index');
    Route::get('ratings', fn() => view('admin::ndis.placeholder', ['title' => 'Provider Ratings']))->name('admin.providers.ratings');
    Route::get('availability', fn() => view('admin::ndis.placeholder', ['title' => 'Provider Availability']))->name('admin.providers.availability');
    Route::prefix('workers')->group(function () {
        Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'Support Workers']))->name('admin.providers.workers.index');
    });
});

// Bookings
Route::prefix('bookings')->group(function () {
    Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'Bookings']))->name('admin.bookings.index');
    Route::get('calendar', fn() => view('admin::ndis.placeholder', ['title' => 'Calendar View']))->name('admin.bookings.calendar');
    Route::get('scheduled', fn() => view('admin::ndis.placeholder', ['title' => 'Scheduled Bookings']))->name('admin.bookings.scheduled');
    Route::get('in-progress', fn() => view('admin::ndis.placeholder', ['title' => 'In Progress Bookings']))->name('admin.bookings.in-progress');
    Route::get('completed', fn() => view('admin::ndis.placeholder', ['title' => 'Completed Bookings']))->name('admin.bookings.completed');
});

// Billing
Route::prefix('billing')->group(function () {
    Route::prefix('invoices')->group(function () {
        Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'Invoices']))->name('admin.billing.invoices.index');
        Route::get('pending', fn() => view('admin::ndis.placeholder', ['title' => 'Pending Invoices']))->name('admin.billing.invoices.pending');
        Route::get('submitted', fn() => view('admin::ndis.placeholder', ['title' => 'Submitted Invoices']))->name('admin.billing.invoices.submitted');
        Route::get('paid', fn() => view('admin::ndis.placeholder', ['title' => 'Paid Invoices']))->name('admin.billing.invoices.paid');
    });
    Route::prefix('rates')->group(function () {
        Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'NDIS Rates']))->name('admin.billing.rates.index');
    });
});

// Documents
Route::prefix('documents')->group(function () {
    Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'Documents']))->name('admin.documents.index');
    Route::get('ndis-plans', fn() => view('admin::ndis.placeholder', ['title' => 'NDIS Plan Documents']))->name('admin.documents.ndis-plans');
    Route::get('reports', fn() => view('admin::ndis.placeholder', ['title' => 'Reports']))->name('admin.documents.reports');
    Route::get('agreements', fn() => view('admin::ndis.placeholder', ['title' => 'Service Agreements']))->name('admin.documents.agreements');
});

// AI Assistant
Route::prefix('ai')->group(function () {
    Route::get('dashboard', fn() => view('admin::ndis.placeholder', ['title' => 'AI Assistant']))->name('admin.ai.dashboard');
    Route::get('matching', fn() => view('admin::ndis.placeholder', ['title' => 'Provider Matching']))->name('admin.ai.matching');
    Route::get('triage', fn() => view('admin::ndis.placeholder', ['title' => 'Request Triage']))->name('admin.ai.triage');
    Route::get('scheduling', fn() => view('admin::ndis.placeholder', ['title' => 'Smart Scheduling']))->name('admin.ai.scheduling');
    Route::get('budget', fn() => view('admin::ndis.placeholder', ['title' => 'Budget Predictions']))->name('admin.ai.budget');
});

// Reports
Route::prefix('reports')->group(function () {
    Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'Reports']))->name('admin.reports.index');
    Route::get('overview', fn() => view('admin::ndis.placeholder', ['title' => 'Overview']))->name('admin.reports.overview');
    Route::get('participants', fn() => view('admin::ndis.placeholder', ['title' => 'Participant Analytics']))->name('admin.reports.participants');
    Route::get('budget', fn() => view('admin::ndis.placeholder', ['title' => 'Budget Utilization']))->name('admin.reports.budget');
    Route::get('services', fn() => view('admin::ndis.placeholder', ['title' => 'Service Delivery']))->name('admin.reports.services');
    Route::get('providers', fn() => view('admin::ndis.placeholder', ['title' => 'Provider Performance']))->name('admin.reports.providers');
});

// NDIS Integration
Route::prefix('ndis/integration')->group(function () {
    Route::get('', fn() => view('admin::ndis.placeholder', ['title' => 'NDIS Integration']))->name('admin.ndis.integration.index');
    Route::get('sync', fn() => view('admin::ndis.placeholder', ['title' => 'Provider Sync']))->name('admin.ndis.integration.sync');
    Route::get('logs', fn() => view('admin::ndis.placeholder', ['title' => 'API Logs']))->name('admin.ndis.integration.logs');
});

// NDIS Settings
Route::prefix('settings/ndis')->group(function () {
    Route::get('categories', fn() => view('admin::ndis.placeholder', ['title' => 'Service Categories']))->name('admin.settings.ndis.categories');
    Route::get('templates', fn() => view('admin::ndis.placeholder', ['title' => 'Agreement Templates']))->name('admin.settings.ndis.templates');
    Route::get('automation', fn() => view('admin::ndis.placeholder', ['title' => 'Automation Rules']))->name('admin.settings.ndis.automation');
    Route::get('tenants', fn() => view('admin::ndis.placeholder', ['title' => 'Tenant Management']))->name('admin.settings.ndis.tenants');
});

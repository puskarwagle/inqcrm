<?php

/**
 * NDIS CRM Menu Configuration
 * Navigation structure for NDIS Support Coordination features
 */

return [
    /**
     * Participants (NDIS Clients)
     */
    [
        'key'        => 'participants',
        'name'       => 'admin::app.layouts.participants',
        'route'      => 'admin.participants.index',
        'sort'       => 10,
        'icon-class' => 'icon-contact',
    ], [
        'key'        => 'participants.all',
        'name'       => 'admin::app.layouts.all-participants',
        'route'      => 'admin.participants.index',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'participants.active',
        'name'       => 'admin::app.layouts.active-participants',
        'route'      => 'admin.participants.active',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'participants.profiles',
        'name'       => 'admin::app.layouts.participant-profiles',
        'route'      => 'admin.participants.profiles.index',
        'sort'       => 3,
        'icon-class' => '',
    ],

    /**
     * NDIS Plans
     */
    [
        'key'        => 'ndis_plans',
        'name'       => 'admin::app.layouts.ndis-plans',
        'route'      => 'admin.ndis.plans.index',
        'sort'       => 11,
        'icon-class' => 'icon-note',
    ], [
        'key'        => 'ndis_plans.active',
        'name'       => 'admin::app.layouts.active-plans',
        'route'      => 'admin.ndis.plans.active',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'ndis_plans.expiring',
        'name'       => 'admin::app.layouts.expiring-plans',
        'route'      => 'admin.ndis.plans.expiring',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'ndis_plans.budget_tracking',
        'name'       => 'admin::app.layouts.budget-tracking',
        'route'      => 'admin.ndis.plans.budget',
        'sort'       => 3,
        'icon-class' => '',
    ],

    /**
     * Service Requests
     */
    [
        'key'        => 'service_requests',
        'name'       => 'admin::app.layouts.service-requests',
        'route'      => 'admin.services.requests.index',
        'sort'       => 12,
        'icon-class' => 'icon-leads',
    ], [
        'key'        => 'service_requests.open',
        'name'       => 'admin::app.layouts.open-requests',
        'route'      => 'admin.services.requests.open',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'service_requests.in_progress',
        'name'       => 'admin::app.layouts.in-progress-requests',
        'route'      => 'admin.services.requests.in-progress',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'service_requests.scheduled',
        'name'       => 'admin::app.layouts.scheduled-requests',
        'route'      => 'admin.services.requests.scheduled',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'service_requests.completed',
        'name'       => 'admin::app.layouts.completed-requests',
        'route'      => 'admin.services.requests.completed',
        'sort'       => 4,
        'icon-class' => '',
    ],

    /**
     * Providers & Support Workers
     */
    [
        'key'        => 'providers',
        'name'       => 'admin::app.layouts.providers',
        'route'      => 'admin.providers.index',
        'sort'       => 13,
        'icon-class' => 'icon-user',
    ], [
        'key'        => 'providers.all',
        'name'       => 'admin::app.layouts.all-providers',
        'route'      => 'admin.providers.index',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'providers.support_workers',
        'name'       => 'admin::app.layouts.support-workers',
        'route'      => 'admin.providers.workers.index',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'providers.ratings',
        'name'       => 'admin::app.layouts.provider-ratings',
        'route'      => 'admin.providers.ratings',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'providers.availability',
        'name'       => 'admin::app.layouts.provider-availability',
        'route'      => 'admin.providers.availability',
        'sort'       => 4,
        'icon-class' => '',
    ],

    /**
     * Bookings & Scheduling
     */
    [
        'key'        => 'bookings',
        'name'       => 'admin::app.layouts.bookings',
        'route'      => 'admin.bookings.index',
        'sort'       => 14,
        'icon-class' => 'icon-calendar',
    ], [
        'key'        => 'bookings.calendar',
        'name'       => 'admin::app.layouts.calendar-view',
        'route'      => 'admin.bookings.calendar',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'bookings.scheduled',
        'name'       => 'admin::app.layouts.scheduled-bookings',
        'route'      => 'admin.bookings.scheduled',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'bookings.in_progress',
        'name'       => 'admin::app.layouts.in-progress-bookings',
        'route'      => 'admin.bookings.in-progress',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'bookings.completed',
        'name'       => 'admin::app.layouts.completed-bookings',
        'route'      => 'admin.bookings.completed',
        'sort'       => 4,
        'icon-class' => '',
    ],

    /**
     * Billing & Invoicing
     */
    [
        'key'        => 'billing',
        'name'       => 'admin::app.layouts.billing',
        'route'      => 'admin.billing.invoices.index',
        'sort'       => 15,
        'icon-class' => 'icon-product',
    ], [
        'key'        => 'billing.invoices',
        'name'       => 'admin::app.layouts.invoices',
        'route'      => 'admin.billing.invoices.index',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'billing.pending',
        'name'       => 'admin::app.layouts.pending-invoices',
        'route'      => 'admin.billing.invoices.pending',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'billing.submitted',
        'name'       => 'admin::app.layouts.submitted-invoices',
        'route'      => 'admin.billing.invoices.submitted',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'billing.paid',
        'name'       => 'admin::app.layouts.paid-invoices',
        'route'      => 'admin.billing.invoices.paid',
        'sort'       => 4,
        'icon-class' => '',
    ], [
        'key'        => 'billing.ndis_rates',
        'name'       => 'admin::app.layouts.ndis-rates',
        'route'      => 'admin.billing.rates.index',
        'sort'       => 5,
        'icon-class' => '',
    ],

    /**
     * Communications
     */
    [
        'key'        => 'communications',
        'name'       => 'admin::app.layouts.communications',
        'route'      => 'admin.communications.index',
        'sort'       => 16,
        'icon-class' => 'icon-mail',
    ], [
        'key'        => 'communications.all',
        'name'       => 'admin::app.layouts.all-communications',
        'route'      => 'admin.communications.index',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'communications.calls',
        'name'       => 'admin::app.layouts.calls',
        'route'      => 'admin.communications.calls',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'communications.emails',
        'name'       => 'admin::app.layouts.emails',
        'route'      => 'admin.communications.emails',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'communications.notes',
        'name'       => 'admin::app.layouts.notes',
        'route'      => 'admin.communications.notes',
        'sort'       => 4,
        'icon-class' => '',
    ],

    /**
     * Documents
     */
    [
        'key'        => 'documents',
        'name'       => 'admin::app.layouts.documents',
        'route'      => 'admin.documents.index',
        'sort'       => 17,
        'icon-class' => 'icon-note',
    ], [
        'key'        => 'documents.all',
        'name'       => 'admin::app.layouts.all-documents',
        'route'      => 'admin.documents.index',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'documents.ndis_plans',
        'name'       => 'admin::app.layouts.ndis-plan-documents',
        'route'      => 'admin.documents.ndis-plans',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'documents.invoices',
        'name'       => 'admin::app.layouts.invoice-documents',
        'route'      => 'admin.documents.invoices',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'documents.reports',
        'name'       => 'admin::app.layouts.reports',
        'route'      => 'admin.documents.reports',
        'sort'       => 4,
        'icon-class' => '',
    ], [
        'key'        => 'documents.agreements',
        'name'       => 'admin::app.layouts.service-agreements',
        'route'      => 'admin.documents.agreements',
        'sort'       => 5,
        'icon-class' => '',
    ],

    /**
     * AI Recommendations
     */
    [
        'key'        => 'ai_assistant',
        'name'       => 'admin::app.layouts.ai-assistant',
        'route'      => 'admin.ai.dashboard',
        'sort'       => 18,
        'icon-class' => 'icon-activity',
    ], [
        'key'        => 'ai_assistant.provider_matching',
        'name'       => 'admin::app.layouts.provider-matching',
        'route'      => 'admin.ai.matching',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'ai_assistant.request_triage',
        'name'       => 'admin::app.layouts.request-triage',
        'route'      => 'admin.ai.triage',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'ai_assistant.scheduling',
        'name'       => 'admin::app.layouts.smart-scheduling',
        'route'      => 'admin.ai.scheduling',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'ai_assistant.budget_predictions',
        'name'       => 'admin::app.layouts.budget-predictions',
        'route'      => 'admin.ai.budget',
        'sort'       => 4,
        'icon-class' => '',
    ], [
        'key'        => 'ai_assistant.logs',
        'name'       => 'admin::app.layouts.ai-logs',
        'route'      => 'admin.ai.logs',
        'sort'       => 5,
        'icon-class' => '',
    ],

    /**
     * Reports & Analytics
     */
    [
        'key'        => 'reports',
        'name'       => 'admin::app.layouts.reports',
        'route'      => 'admin.reports.index',
        'sort'       => 19,
        'icon-class' => 'icon-dashboard',
    ], [
        'key'        => 'reports.overview',
        'name'       => 'admin::app.layouts.overview',
        'route'      => 'admin.reports.overview',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'reports.participant_analytics',
        'name'       => 'admin::app.layouts.participant-analytics',
        'route'      => 'admin.reports.participants',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'reports.budget_utilization',
        'name'       => 'admin::app.layouts.budget-utilization',
        'route'      => 'admin.reports.budget',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'reports.service_delivery',
        'name'       => 'admin::app.layouts.service-delivery',
        'route'      => 'admin.reports.services',
        'sort'       => 4,
        'icon-class' => '',
    ], [
        'key'        => 'reports.provider_performance',
        'name'       => 'admin::app.layouts.provider-performance',
        'route'      => 'admin.reports.providers',
        'sort'       => 5,
        'icon-class' => '',
    ], [
        'key'        => 'reports.financial',
        'name'       => 'admin::app.layouts.financial-reports',
        'route'      => 'admin.reports.financial',
        'sort'       => 6,
        'icon-class' => '',
    ],

    /**
     * NDIS Integration
     */
    [
        'key'        => 'ndis_integration',
        'name'       => 'admin::app.layouts.ndis-integration',
        'route'      => 'admin.ndis.integration.index',
        'sort'       => 20,
        'icon-class' => 'icon-setting',
    ], [
        'key'        => 'ndis_integration.sync',
        'name'       => 'admin::app.layouts.provider-sync',
        'route'      => 'admin.ndis.integration.sync',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'ndis_integration.api_logs',
        'name'       => 'admin::app.layouts.api-logs',
        'route'      => 'admin.ndis.integration.logs',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'ndis_integration.rate_updates',
        'name'       => 'admin::app.layouts.rate-updates',
        'route'      => 'admin.ndis.integration.rates',
        'sort'       => 3,
        'icon-class' => '',
    ],

    /**
     * Notifications
     */
    [
        'key'        => 'notifications',
        'name'       => 'admin::app.layouts.notifications',
        'route'      => 'admin.notifications.index',
        'sort'       => 21,
        'icon-class' => 'icon-activity',
    ], [
        'key'        => 'notifications.all',
        'name'       => 'admin::app.layouts.all-notifications',
        'route'      => 'admin.notifications.index',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'notifications.budget_alerts',
        'name'       => 'admin::app.layouts.budget-alerts',
        'route'      => 'admin.notifications.budget',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'notifications.reminders',
        'name'       => 'admin::app.layouts.reminders',
        'route'      => 'admin.notifications.reminders',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'notifications.system',
        'name'       => 'admin::app.layouts.system-alerts',
        'route'      => 'admin.notifications.system',
        'sort'       => 4,
        'icon-class' => '',
    ],

    /**
     * NDIS Settings
     */
    [
        'key'        => 'ndis_settings',
        'name'       => 'admin::app.layouts.ndis-settings',
        'route'      => 'admin.settings.ndis.index',
        'sort'       => 22,
        'icon-class' => 'icon-configuration',
    ], [
        'key'        => 'ndis_settings.service_categories',
        'name'       => 'admin::app.layouts.service-categories',
        'route'      => 'admin.settings.ndis.categories',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'ndis_settings.agreement_templates',
        'name'       => 'admin::app.layouts.agreement-templates',
        'route'      => 'admin.settings.ndis.templates',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'ndis_settings.automation_rules',
        'name'       => 'admin::app.layouts.automation-rules',
        'route'      => 'admin.settings.ndis.automation',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'ndis_settings.saved_filters',
        'name'       => 'admin::app.layouts.saved-filters',
        'route'      => 'admin.settings.ndis.filters',
        'sort'       => 4,
        'icon-class' => '',
    ], [
        'key'        => 'ndis_settings.tenant_management',
        'name'       => 'admin::app.layouts.tenant-management',
        'route'      => 'admin.settings.ndis.tenants',
        'sort'       => 5,
        'icon-class' => '',
    ],
];

<?php

return [
    /**
     * Dashboard.
     */
    [
        'key'        => 'dashboard',
        'name'       => 'admin::app.layouts.dashboard',
        'route'      => 'admin.dashboard.index',
        'sort'       => 1,
        'icon-class' => 'icon-dashboard',
    ],

    /**
     * Leads.
     */
    [
        'key'        => 'leads',
        'name'       => 'admin::app.layouts.leads',
        'route'      => 'admin.leads.index',
        'sort'       => 2,
        'icon-class' => 'icon-leads',
    ],

    /**
     * Quotes.
     */
    [
        'key'        => 'quotes',
        'name'       => 'admin::app.layouts.quotes',
        'route'      => 'admin.quotes.index',
        'sort'       => 3,
        'icon-class' => 'icon-quote',
    ],

    /**
     * Emails.
     */
    [
        'key'        => 'mail',
        'name'       => 'admin::app.layouts.mail.title',
        'route'      => 'admin.mail.index',
        'params'     => ['route' => 'inbox'],
        'sort'       => 4,
        'icon-class' => 'icon-mail',
    ], [
        'key'        => 'mail.inbox',
        'name'       => 'admin::app.layouts.mail.inbox',
        'route'      => 'admin.mail.index',
        'params'     => ['route' => 'inbox'],
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'mail.draft',
        'name'       => 'admin::app.layouts.mail.draft',
        'route'      => 'admin.mail.index',
        'params'     => ['route' => 'draft'],
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'mail.outbox',
        'name'       => 'admin::app.layouts.mail.outbox',
        'route'      => 'admin.mail.index',
        'params'     => ['route' => 'outbox'],
        'sort'       => 4,
        'icon-class' => '',
    ], [
        'key'        => 'mail.sent',
        'name'       => 'admin::app.layouts.mail.sent',
        'route'      => 'admin.mail.index',
        'params'     => ['route' => 'sent'],
        'sort'       => 4,
        'icon-class' => '',
    ], [
        'key'        => 'mail.trash',
        'name'       => 'admin::app.layouts.mail.trash',
        'route'      => 'admin.mail.index',
        'params'     => ['route' => 'trash'],
        'sort'       => 5,
        'icon-class' => '',
    ],
    // , [
    //     'key'        => 'mail.setting',
    //     'name'       => 'admin::app.layouts.mail.setting',
    //     'route'      => 'admin.mail.index',
    //     'params'     => ['route' => 'setting'],
    //     'sort'       => 5,
    // ]

    /**
     * Activities.
     */
    [
        'key'        => 'activities',
        'name'       => 'admin::app.layouts.activities',
        'route'      => 'admin.activities.index',
        'sort'       => 5,
        'icon-class' => 'icon-activity',
    ],

    /**
     * Contacts.
     */
    [
        'key'        => 'contacts',
        'name'       => 'admin::app.layouts.contacts',
        'route'      => 'admin.contacts.persons.index',
        'sort'       => 6,
        'icon-class' => 'icon-contact',
    ], [
        'key'        => 'contacts.persons',
        'name'       => 'admin::app.layouts.persons',
        'route'      => 'admin.contacts.persons.index',
        'sort'       => 1,
        'icon-class' => '',
    ], [
        'key'        => 'contacts.organizations',
        'name'       => 'admin::app.layouts.organizations',
        'route'      => 'admin.contacts.organizations.index',
        'sort'       => 2,
        'icon-class' => '',
    ],

    /**
     * Products.
     */
    [
        'key'        => 'products',
        'name'       => 'admin::app.layouts.products',
        'route'      => 'admin.products.index',
        'sort'       => 7,
        'icon-class' => 'icon-product',
    ],

    /**
     * NDIS Participants.
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
     * NDIS Plans.
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
     * Service Requests.
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
     * Providers & Support Workers.
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
     * Bookings & Scheduling.
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
     * Billing & Invoicing.
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
     * Documents.
     */
    [
        'key'        => 'documents',
        'name'       => 'admin::app.layouts.documents',
        'route'      => 'admin.documents.index',
        'sort'       => 16,
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
        'key'        => 'documents.reports',
        'name'       => 'admin::app.layouts.reports',
        'route'      => 'admin.documents.reports',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'documents.agreements',
        'name'       => 'admin::app.layouts.service-agreements',
        'route'      => 'admin.documents.agreements',
        'sort'       => 4,
        'icon-class' => '',
    ],

    /**
     * AI Assistant.
     */
    [
        'key'        => 'ai_assistant',
        'name'       => 'admin::app.layouts.ai-assistant',
        'route'      => 'admin.ai.dashboard',
        'sort'       => 17,
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
    ],

    /**
     * Reports & Analytics.
     */
    [
        'key'        => 'reports',
        'name'       => 'admin::app.layouts.reports',
        'route'      => 'admin.reports.index',
        'sort'       => 18,
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
    ],

    /**
     * NDIS Integration.
     */
    [
        'key'        => 'ndis_integration',
        'name'       => 'admin::app.layouts.ndis-integration',
        'route'      => 'admin.ndis.integration.index',
        'sort'       => 19,
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
    ],

    /**
     * Settings.
     */
    [
        'key'        => 'settings',
        'name'       => 'admin::app.layouts.settings',
        'route'      => 'admin.settings.index',
        'sort'       => 8,
        'icon-class' => 'icon-setting',
    ], [
        'key'        => 'settings.user',
        'name'       => 'admin::app.layouts.user',
        'route'      => 'admin.settings.groups.index',
        'info'       => 'admin::app.layouts.user-info',
        'sort'       => 1,
        'icon-class' => 'icon-settings-group',
    ], [
        'key'        => 'settings.user.groups',
        'name'       => 'admin::app.layouts.groups',
        'info'       => 'admin::app.layouts.groups-info',
        'route'      => 'admin.settings.groups.index',
        'sort'       => 1,
        'icon-class' => 'icon-settings-group',
    ], [
        'key'        => 'settings.user.roles',
        'name'       => 'admin::app.layouts.roles',
        'info'       => 'admin::app.layouts.roles-info',
        'route'      => 'admin.settings.roles.index',
        'sort'       => 2,
        'icon-class' => 'icon-role',
    ], [
        'key'        => 'settings.user.users',
        'name'       => 'admin::app.layouts.users',
        'info'       => 'admin::app.layouts.users-info',
        'route'      => 'admin.settings.users.index',
        'sort'       => 3,
        'icon-class' => 'icon-user',
    ], [
        'key'        => 'settings.lead',
        'name'       => 'admin::app.layouts.lead',
        'info'       => 'admin::app.layouts.lead-info',
        'route'      => 'admin.settings.pipelines.index',
        'sort'       => 2,
        'icon-class' => '',
    ], [
        'key'        => 'settings.lead.pipelines',
        'name'       => 'admin::app.layouts.pipelines',
        'info'       => 'admin::app.layouts.pipelines-info',
        'route'      => 'admin.settings.pipelines.index',
        'sort'       => 1,
        'icon-class' => 'icon-settings-pipeline',
    ], [
        'key'        => 'settings.lead.sources',
        'name'       => 'admin::app.layouts.sources',
        'info'       => 'admin::app.layouts.sources-info',
        'route'      => 'admin.settings.sources.index',
        'sort'       => 2,
        'icon-class' => 'icon-settings-sources',
    ], [
        'key'        => 'settings.lead.types',
        'name'       => 'admin::app.layouts.types',
        'info'       => 'admin::app.layouts.types-info',
        'route'      => 'admin.settings.types.index',
        'sort'       => 3,
        'icon-class' => 'icon-settings-type',
    ], [
        'key'        => 'settings.warehouse',
        'name'       => 'admin::app.layouts.warehouse',
        'info'       => 'admin::app.layouts.warehouses-info',
        'route'      => 'admin.settings.pipelines.index',
        'icon-class' => '',
        'sort'       => 2,
    ], [
        'key'        => 'settings.warehouse.warehouses',
        'name'       => 'admin::app.layouts.warehouses',
        'info'       => 'admin::app.layouts.warehouses-info',
        'route'      => 'admin.settings.warehouses.index',
        'sort'       => 1,
        'icon-class' => 'icon-settings-warehouse',
    ], [
        'key'        => 'settings.automation',
        'name'       => 'admin::app.layouts.automation',
        'info'       => 'admin::app.layouts.automation-info',
        'route'      => 'admin.settings.attributes.index',
        'sort'       => 3,
        'icon-class' => '',
    ], [
        'key'        => 'settings.automation.attributes',
        'name'       => 'admin::app.layouts.attributes',
        'info'       => 'admin::app.layouts.attributes-info',
        'route'      => 'admin.settings.attributes.index',
        'sort'       => 1,
        'icon-class' => 'icon-attribute',
    ], [
        'key'        => 'settings.automation.email_templates',
        'name'       => 'admin::app.layouts.email-templates',
        'info'       => 'admin::app.layouts.email-templates-info',
        'route'      => 'admin.settings.email_templates.index',
        'sort'       => 2,
        'icon-class' => 'icon-settings-mail',
    ], [
        'key'        => 'settings.automation.events',
        'name'       => 'admin::app.layouts.events',
        'info'       => 'admin::app.layouts.events-info',
        'route'      => 'admin.settings.marketing.events.index',
        'sort'       => 2,
        'icon-class' => 'icon-calendar',
    ], [
        'key'        => 'settings.automation.campaigns',
        'name'       => 'admin::app.layouts.campaigns',
        'info'       => 'admin::app.layouts.campaigns-info',
        'route'      => 'admin.settings.marketing.campaigns.index',
        'sort'       => 2,
        'icon-class' => 'icon-note',
    ], [
        'key'        => 'settings.automation.webhooks',
        'name'       => 'admin::app.layouts.webhooks',
        'info'       => 'admin::app.layouts.webhooks-info',
        'route'      => 'admin.settings.webhooks.index',
        'sort'       => 2,
        'icon-class' => 'icon-settings-webhooks',
    ], [
        'key'        => 'settings.automation.workflows',
        'name'       => 'admin::app.layouts.workflows',
        'info'       => 'admin::app.layouts.workflows-info',
        'route'      => 'admin.settings.workflows.index',
        'sort'       => 3,
        'icon-class' => 'icon-settings-flow',
    ],
    [
        'key'        => 'settings.automation.data_transfer',
        'name'       => 'admin::app.layouts.data_transfer',
        'info'       => 'admin::app.layouts.data_transfer_info',
        'route'      => 'admin.settings.data_transfer.imports.index',
        'sort'       => 4,
        'icon-class' => 'icon-download',
    ], [
        'key'        => 'settings.other_settings',
        'name'       => 'admin::app.layouts.other-settings',
        'info'       => 'admin::app.layouts.other-settings-info',
        'route'      => 'admin.settings.tags.index',
        'sort'       => 4,
        'icon-class' => 'icon-settings',
    ], [
        'key'        => 'settings.other_settings.tags',
        'name'       => 'admin::app.layouts.tags',
        'info'       => 'admin::app.layouts.tags-info',
        'route'      => 'admin.settings.tags.index',
        'sort'       => 1,
        'icon-class' => 'icon-settings-tag',
    ], [
        'key'        => 'settings.ndis',
        'name'       => 'admin::app.layouts.ndis',
        'info'       => 'admin::app.layouts.ndis-info',
        'route'      => 'admin.settings.ndis.categories',
        'sort'       => 5,
        'icon-class' => '',
    ], [
        'key'        => 'settings.ndis.service_categories',
        'name'       => 'admin::app.layouts.service-categories',
        'info'       => 'admin::app.layouts.service-categories-info',
        'route'      => 'admin.settings.ndis.categories',
        'sort'       => 1,
        'icon-class' => 'icon-settings-type',
    ], [
        'key'        => 'settings.ndis.agreement_templates',
        'name'       => 'admin::app.layouts.agreement-templates',
        'info'       => 'admin::app.layouts.agreement-templates-info',
        'route'      => 'admin.settings.ndis.templates',
        'sort'       => 2,
        'icon-class' => 'icon-note',
    ], [
        'key'        => 'settings.ndis.automation_rules',
        'name'       => 'admin::app.layouts.automation-rules',
        'info'       => 'admin::app.layouts.automation-rules-info',
        'route'      => 'admin.settings.ndis.automation',
        'sort'       => 3,
        'icon-class' => 'icon-settings-flow',
    ], [
        'key'        => 'settings.ndis.tenant_management',
        'name'       => 'admin::app.layouts.tenant-management',
        'info'       => 'admin::app.layouts.tenant-management-info',
        'route'      => 'admin.settings.ndis.tenants',
        'sort'       => 4,
        'icon-class' => 'icon-user',
    ],

    /**
     * Configuration.
     */
    [
        'key'        => 'configuration',
        'name'       => 'admin::app.layouts.configuration',
        'route'      => 'admin.configuration.index',
        'sort'       => 9,
        'icon-class' => 'icon-configuration',
    ],

];

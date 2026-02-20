# NDIS CRM Features & Module Architecture

**Version:** 2.0  
**Framework:** Laravel 10.0 + Eloquent ORM + Konekt Concord  
**Standards:** PSR-12, Pest Testing, Security-First Design  
**Last Updated:** November 14, 2025

---

## Overview

This document outlines proposed features for a comprehensive NDIS support coordination CRM system built on the Krayin Laravel platform. All features are designed to integrate seamlessly with the existing modular architecture.

---

## Architecture Overview

### Proposed New Modules

```
packages/Webkul/
├── NDISPlan/               ← NEW: NDIS plan management
├── Participant/            ← NEW: NDIS participant profiles
├── ServiceRequest/         ← NEW: Service request ticketing
├── Provider/               ← NEW: Support provider management
├── Booking/                ← NEW: Scheduling & bookings
├── Billing/                ← NEW: NDIS billing & invoicing
├── AIAssistant/            ← NEW: AI integration layer
└── NDISIntegration/        ← NEW: NDIS API integration
```

### Module Dependencies

```
Participant → requires: Contact, User, Core
NDISPlan → requires: Participant, Core
ServiceRequest → requires: Participant, Contact, Core
Booking → requires: ServiceRequest, Participant, Core
Billing → requires: Booking, NDISPlan, Core
Provider → requires: Contact, Core
AIAssistant → requires: Core (cross-cutting concern)
NDISIntegration → requires: NDISPlan, Provider, Core
```

---

## Module 1: Participant Module

**Purpose:** Manage NDIS participant profiles and their related information  
**Dependencies:** Contact, User, Core  
**Status:** Priority 1 (Foundation)

### Models

#### Participant Model

```php
<?php

namespace Webkul\Participant\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Participant extends Model
{
    protected $fillable = [
        'contact_id',
        'user_id',
        'ndis_number',
        'date_of_birth',
        'address',
        'emergency_contact',
        'disabilities',
        'preferences',
        'is_active',
    ];

    protected $casts = [
        'date_of_birth' => 'date',
        'disabilities' => 'json',
        'preferences' => 'json',
        'is_active' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the contact associated with this participant.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function contact(): BelongsTo
    {
        return $this->belongsTo(\Webkul\Contact\Models\Contact::class);
    }

    /**
     * Get the user associated with this participant.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(\Webkul\User\Models\User::class);
    }

    /**
     * Get the NDIS plan for this participant.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function ndisPlan(): HasOne
    {
        return $this->hasOne(\Webkul\NDISPlan\Models\NDISPlan::class);
    }

    /**
     * Get all service requests for this participant.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function serviceRequests(): HasMany
    {
        return $this->hasMany(\Webkul\ServiceRequest\Models\ServiceRequest::class);
    }
}
```

#### ParticipantPreference Model

```php
<?php

namespace Webkul\Participant\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ParticipantPreference extends Model
{
    protected $fillable = [
        'participant_id',
        'preference_key',
        'preference_value',
        'category',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the participant this preference belongs to.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function participant(): BelongsTo
    {
        return $this->belongsTo(Participant::class);
    }
}
```

### Database Migrations

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('participants', function (Blueprint $table) {
            $table->id();
            $table->foreignId('contact_id')->constrained()->onDelete('cascade');
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->string('ndis_number')->unique()->index();
            $table->date('date_of_birth')->nullable();
            $table->text('address')->nullable();
            $table->string('emergency_contact')->nullable();
            $table->json('disabilities')->nullable();
            $table->json('preferences')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();

            $table->index(['contact_id', 'user_id']);
            $table->index('created_at');
        });

        Schema::create('participant_preferences', function (Blueprint $table) {
            $table->id();
            $table->foreignId('participant_id')->constrained('participants')->onDelete('cascade');
            $table->string('preference_key');
            $table->text('preference_value');
            $table->string('category')->index();
            $table->timestamps();

            $table->unique(['participant_id', 'preference_key']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('participant_preferences');
        Schema::dropIfExists('participants');
    }
};
```

### Repository

```php
<?php

namespace Webkul\Participant\Repositories;

use Webkul\Participant\Models\Participant;
use Illuminate\Database\Eloquent\Collection;

class ParticipantRepository
{
    public function __construct(
        private Participant $model
    ) {}

    public function query()
    {
        return $this->model->query();
    }

    public function findByNDISNumber(string $ndisNumber): ?Participant
    {
        return $this->query()
            ->where('ndis_number', $ndisNumber)
            ->with(['contact', 'user', 'ndisPlan'])
            ->first();
    }

    public function findActive(int $id): ?Participant
    {
        return $this->query()
            ->where('is_active', true)
            ->find($id);
    }

    public function create(array $data): Participant
    {
        return $this->model->create($data);
    }

    public function update(int $id, array $data): bool
    {
        return $this->query()->find($id)->update($data);
    }

    public function getActiveParticipants(): Collection
    {
        return $this->query()
            ->where('is_active', true)
            ->with(['contact', 'ndisPlan'])
            ->get();
    }
}
```

### Service Provider

```php
<?php

namespace Webkul\Participant\Providers;

use Konekt\Concord\AbstractModuleServiceProvider;
use Webkul\Participant\Repositories\ParticipantRepository;

class ParticipantServiceProvider extends AbstractModuleServiceProvider
{
    protected $routesPath = __DIR__ . '/../Routes/api.php';

    public function register(): void
    {
        parent::register();

        $this->app->singleton(ParticipantRepository::class, function () {
            return new ParticipantRepository(new \Webkul\Participant\Models\Participant());
        });
    }
}
```

---

## Module 2: NDISPlan Module

**Purpose:** Manage NDIS plans, budgets, and plan lifecycle  
**Dependencies:** Participant, Core  
**Status:** Priority 1 (Foundation)

### NDISPlan Model

```php
<?php

namespace Webkul\NDISPlan\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class NDISPlan extends Model
{
    use SoftDeletes;

    protected $table = 'ndis_plans';

    protected $fillable = [
        'participant_id',
        'ndis_number',
        'plan_start_date',
        'plan_end_date',
        'plan_manager',
        'total_budget',
        'used_budget',
        'remaining_budget',
        'support_coordination_budget',
        'support_coordination_used',
        'support_coordination_remaining',
        'plan_document_id',
        'is_active',
    ];

    protected $casts = [
        'plan_start_date' => 'date',
        'plan_end_date' => 'date',
        'total_budget' => 'float',
        'used_budget' => 'float',
        'remaining_budget' => 'float',
        'support_coordination_budget' => 'float',
        'support_coordination_used' => 'float',
        'support_coordination_remaining' => 'float',
        'is_active' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the participant this plan belongs to.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function participant(): BelongsTo
    {
        return $this->belongsTo(\Webkul\Participant\Models\Participant::class);
    }

    /**
     * Get all invoices for this plan.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function invoices(): HasMany
    {
        return $this->hasMany(\Webkul\Billing\Models\Invoice::class);
    }

    /**
     * Calculate remaining budget.
     *
     * @return float
     */
    public function getRemainingBudgetAttribute(): float
    {
        return $this->total_budget - $this->used_budget;
    }

    /**
     * Check if plan is within budget.
     *
     * @return bool
     */
    public function isWithinBudget(): bool
    {
        return $this->remaining_budget >= 0;
    }

    /**
     * Check if plan has expired.
     *
     * @return bool
     */
    public function hasExpired(): bool
    {
        return now()->isAfter($this->plan_end_date);
    }
}
```

### NDISPlan Policies & Authorization

```php
<?php

namespace Webkul\NDISPlan\Policies;

use Webkul\NDISPlan\Models\NDISPlan;
use Webkul\User\Models\User;

class NDISPlanPolicy
{
    /**
     * Determine if user can view the plan.
     *
     * @return bool
     */
    public function view(User $user, NDISPlan $plan): bool
    {
        // User can view if they're associated with the participant
        return $user->id === $plan->participant->user_id 
            || $user->hasRole('admin')
            || $user->hasRole('coordinator');
    }

    /**
     * Determine if user can update the plan.
     *
     * @return bool
     */
    public function update(User $user, NDISPlan $plan): bool
    {
        return $user->hasRole('admin') || $user->hasRole('coordinator');
    }
}
```

### ServiceRequest Model

```php
<?php

namespace Webkul\ServiceRequest\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class ServiceRequest extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'participant_id',
        'assigned_coordinator_id',
        'title',
        'description',
        'service_category',
        'urgency',
        'preferred_date',
        'preferred_time',
        'status',
        'priority_score',
        'ai_categorized_category',
        'ai_priority_reason',
    ];

    protected $casts = [
        'preferred_date' => 'date',
        'priority_score' => 'float',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the participant this request belongs to.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function participant(): BelongsTo
    {
        return $this->belongsTo(\Webkul\Participant\Models\Participant::class);
    }

    /**
     * Get the assigned coordinator.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function coordinator(): BelongsTo
    {
        return $this->belongsTo(\Webkul\User\Models\User::class, 'assigned_coordinator_id');
    }

    /**
     * Get all bookings for this request.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function bookings(): HasMany
    {
        return $this->hasMany(\Webkul\Booking\Models\Booking::class);
    }

    /**
     * Scope: Get open requests.
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeOpen($query)
    {
        return $query->where('status', 'open');
    }

    /**
     * Scope: Get high-priority requests.
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeHighPriority($query)
    {
        return $query->whereIn('urgency', ['high', 'urgent']);
    }
}
```

### ServiceRequest Repository

```php
<?php

namespace Webkul\ServiceRequest\Repositories;

use Webkul\ServiceRequest\Models\ServiceRequest;
use Illuminate\Pagination\Paginator;

class ServiceRequestRepository
{
    public function __construct(
        private ServiceRequest $model
    ) {}

    public function query()
    {
        return $this->model->query();
    }

    public function findById(int $id): ?ServiceRequest
    {
        return $this->query()
            ->with(['participant', 'coordinator', 'bookings'])
            ->find($id);
    }

    public function getByParticipant(int $participantId, $perPage = 15): Paginator
    {
        return $this->query()
            ->where('participant_id', $participantId)
            ->orderBy('created_at', 'desc')
            ->paginate($perPage);
    }

    public function getOpenRequests($perPage = 15): Paginator
    {
        return $this->query()
            ->open()
            ->orderBy('priority_score', 'desc')
            ->paginate($perPage);
    }

    public function create(array $data): ServiceRequest
    {
        return $this->model->create($data);
    }

    public function update(int $id, array $data): bool
    {
        return $this->query()->find($id)->update($data);
    }
}
```

### Provider & Support Worker Models

```php
<?php

namespace Webkul\Provider\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Provider extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'name',
        'contact_email',
        'contact_phone',
        'address',
        'services_offered',
        'availability_hours',
        'rating',
        'is_active',
        'ai_success_rate',
        'ai_specialties',
    ];

    protected $casts = [
        'services_offered' => 'json',
        'availability_hours' => 'json',
        'rating' => 'float',
        'is_active' => 'boolean',
        'ai_success_rate' => 'float',
        'ai_specialties' => 'json',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get all support workers for this provider.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function supportWorkers(): HasMany
    {
        return $this->hasMany(SupportWorker::class);
    }

    /**
     * Get active support workers.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function activeWorkers(): HasMany
    {
        return $this->supportWorkers()->where('is_active', true);
    }
}

class SupportWorker extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'provider_id',
        'first_name',
        'last_name',
        'email',
        'phone',
        'qualifications',
        'specialties',
        'availability',
        'is_active',
    ];

    protected $casts = [
        'qualifications' => 'json',
        'specialties' => 'json',
        'availability' => 'json',
        'is_active' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the provider this worker belongs to.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function provider(): BelongsTo
    {
        return $this->belongsTo(Provider::class);
    }

    /**
     * Get all bookings for this worker.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function bookings(): HasMany
    {
        return $this->hasMany(\Webkul\Booking\Models\Booking::class);
    }
}
```

### Booking Model

```php
<?php

namespace Webkul\Booking\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class Booking extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'service_request_id',
        'participant_id',
        'support_worker_id',
        'provider_id',
        'start_time',
        'end_time',
        'duration_hours',
        'service_type',
        'location',
        'notes',
        'status',
        'actual_start_time',
        'actual_end_time',
        'ai_suggested_timing',
        'ai_optimal_duration',
    ];

    protected $casts = [
        'start_time' => 'datetime',
        'end_time' => 'datetime',
        'actual_start_time' => 'datetime',
        'actual_end_time' => 'datetime',
        'duration_hours' => 'float',
        'ai_optimal_duration' => 'float',
        'ai_suggested_timing' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the service request.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function serviceRequest(): BelongsTo
    {
        return $this->belongsTo(\Webkul\ServiceRequest\Models\ServiceRequest::class);
    }

    /**
     * Get the participant.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function participant(): BelongsTo
    {
        return $this->belongsTo(\Webkul\Participant\Models\Participant::class);
    }

    /**
     * Get the support worker.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function supportWorker(): BelongsTo
    {
        return $this->belongsTo(\Webkul\Provider\Models\SupportWorker::class);
    }

    /**
     * Scope: Get completed bookings.
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeCompleted($query)
    {
        return $query->where('status', 'completed');
    }
}
```

### Billing Model

```php
<?php

namespace Webkul\Billing\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Invoice extends Model
{
    protected $fillable = [
        'ndis_plan_id',
        'participant_id',
        'booking_id',
        'ndis_support_item_number',
        'hours_billed',
        'rate_per_hour',
        'total_amount',
        'service_date',
        'status',
        'ndis_claim_id',
        'submitted_date',
        'paid_date',
    ];

    protected $casts = [
        'hours_billed' => 'float',
        'rate_per_hour' => 'float',
        'total_amount' => 'float',
        'service_date' => 'date',
        'submitted_date' => 'date',
        'paid_date' => 'date',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the NDIS plan.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function ndisPlan(): BelongsTo
    {
        return $this->belongsTo(\Webkul\NDISPlan\Models\NDISPlan::class);
    }

    /**
     * Get the booking.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function booking(): BelongsTo
    {
        return $this->belongsTo(Booking::class);
    }

    /**
     * Scope: Get pending invoices.
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopePending($query)
    {
        return $query->where('status', 'draft')->orWhere('status', 'submitted');
    }
}
```

## Module 3: AI Assistant Integration

**Purpose:** Cross-cutting AI services for intelligent matching, triage, and recommendations  
**Dependencies:** Core, all above modules  
**Status:** Priority 2 (Enhancement)

### AI Models & Services

```php
<?php

namespace Webkul\AIAssistant\Models;

use Illuminate\Database\Eloquent\Model;

class AIRequestLog extends Model
{
    protected $table = 'ai_request_logs';

    protected $fillable = [
        'request_type',
        'input_data',
        'output_data',
        'model_used',
        'tokens_used',
        'processing_time_ms',
        'success',
        'error_message',
    ];

    protected $casts = [
        'input_data' => 'json',
        'output_data' => 'json',
        'tokens_used' => 'integer',
        'processing_time_ms' => 'integer',
        'success' => 'boolean',
        'created_at' => 'datetime',
    ];
}

class AIRecommendation extends Model
{
    protected $fillable = [
        'service_request_id',
        'provider_id',
        'support_worker_id',
        'match_score',
        'reasoning',
        'factors_considered',
        'was_accepted',
        'human_feedback',
    ];

    protected $casts = [
        'match_score' => 'float',
        'factors_considered' => 'json',
        'was_accepted' => 'boolean',
        'created_at' => 'datetime',
    ];

    /**
     * Get the service request.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function serviceRequest(): BelongsTo
    {
        return $this->belongsTo(\Webkul\ServiceRequest\Models\ServiceRequest::class);
    }

    /**
     * Get the provider.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function provider(): BelongsTo
    {
        return $this->belongsTo(\Webkul\Provider\Models\Provider::class);
    }
}
```

### AI Matching Service

```php
<?php

namespace Webkul\AIAssistant\Services;

use Webkul\ServiceRequest\Models\ServiceRequest;
use Webkul\Provider\Models\Provider;
use Webkul\AIAssistant\Models\AIRecommendation;

class ProviderMatchingService
{
    /**
     * Get recommended providers for a service request.
     *
     * @param \Webkul\ServiceRequest\Models\ServiceRequest  $serviceRequest
     * @param int  $limit
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getRecommendedProviders(
        ServiceRequest $serviceRequest,
        int $limit = 5
    ) {
        try {
            // Call DeepSeek API for provider matching
            $recommendations = $this->callAIModel(
                'provider_matching',
                [
                    'service_request' => $serviceRequest->toArray(),
                    'participant_preferences' => $serviceRequest->participant->preferences,
                ]
            );

            // Store recommendations
            foreach ($recommendations as $rec) {
                AIRecommendation::create([
                    'service_request_id' => $serviceRequest->id,
                    'provider_id' => $rec['provider_id'],
                    'support_worker_id' => $rec['support_worker_id'] ?? null,
                    'match_score' => $rec['score'],
                    'reasoning' => $rec['reasoning'],
                    'factors_considered' => json_encode($rec['factors']),
                ]);
            }

            return $recommendations;
        } catch (\Exception $e) {
            \Log::error('Provider matching failed', [
                'error' => $e->getMessage(),
                'service_request_id' => $serviceRequest->id,
            ]);
            throw new \RuntimeException('Provider matching service unavailable');
        }
    }

    /**
     * Call the AI model.
     *
     * @param string  $requestType
     * @param array  $data
     * @return array
     */
    private function callAIModel(string $requestType, array $data): array
    {
        // Implementation would call DeepSeek API
        // See AIAssistant module documentation
    }
}
```

---

## Module 4: NDIS Integration

**Purpose:** Manage NDIS API integration, sync, and compliance  
**Dependencies:** NDISPlan, Provider, Billing  
**Status:** Priority 2 (Enhancement)

### NDIS Models

```php
<?php

namespace Webkul\NDISIntegration\Models;

use Illuminate\Database\Eloquent\Model;

class NDISApiLog extends Model
{
    protected $table = 'ndis_api_logs';

    protected $fillable = [
        'endpoint',
        'request_data',
        'response_data',
        'status_code',
        'error_message',
    ];

    protected $casts = [
        'request_data' => 'json',
        'response_data' => 'json',
        'status_code' => 'integer',
        'created_at' => 'datetime',
    ];

    /**
     * Scope: Get failed requests.
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeFailed($query)
    {
        return $query->where('status_code', '>=', 400);
    }
}

class NDISProviderSync extends Model
{
    protected $table = 'ndis_provider_syncs';

    protected $fillable = [
        'ndis_provider_id',
        'provider_id',
        'last_synced',
        'is_active_in_ndis',
    ];

    protected $casts = [
        'last_synced' => 'datetime',
        'is_active_in_ndis' => 'boolean',
        'created_at' => 'datetime',
    ];

    /**
     * Get the provider.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function provider(): BelongsTo
    {
        return $this->belongsTo(\Webkul\Provider\Models\Provider::class);
    }
}
```

---

## Supporting Models

### Notifications

```php
<?php

namespace Webkul\Core\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Notification extends Model
{
    protected $fillable = [
        'user_id',
        'notification_type',
        'title',
        'message',
        'is_read',
        'related_entity_type',
        'related_entity_id',
    ];

    protected $casts = [
        'is_read' => 'boolean',
        'created_at' => 'datetime',
    ];

    /**
     * Get the user.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(\Webkul\User\Models\User::class);
    }

    /**
     * Mark as read.
     *
     * @return bool
     */
    public function markAsRead(): bool
    {
        return $this->update(['is_read' => true]);
    }
}
```

### Documents & Communication

```php
<?php

namespace Webkul\Core\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Document extends Model
{
    protected $fillable = [
        'uploader_id',
        'filename',
        'file_path',
        'file_size',
        'mime_type',
        'document_type',
        'related_participant_id',
        'related_booking_id',
    ];

    protected $casts = [
        'file_size' => 'integer',
        'created_at' => 'datetime',
    ];

    /**
     * Get the uploader.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function uploader(): BelongsTo
    {
        return $this->belongsTo(\Webkul\User\Models\User::class);
    }
}

class Communication extends Model
{
    protected $fillable = [
        'participant_id',
        'user_id',
        'communication_type',
        'subject',
        'content',
        'direction',
        'ai_generated',
        'ai_assisted',
    ];

    protected $casts = [
        'ai_generated' => 'boolean',
        'ai_assisted' => 'boolean',
        'created_at' => 'datetime',
    ];
}
```

---

## Implementation Roadmap

### Phase 1: Foundation (Weeks 1-2)
- [ ] Create Participant module with migrations and models
- [ ] Create NDISPlan module with budget tracking
- [ ] Implement ParticipantRepository and NDISPlanRepository
- [ ] Create service providers and register in Concord
- [ ] Add Pest tests for core functionality

### Phase 2: Service Management (Weeks 3-4)
- [ ] Create ServiceRequest module
- [ ] Create Provider and SupportWorker models
- [ ] Implement request triage and categorization
- [ ] Add request/response validation via FormRequest classes
- [ ] Create API endpoints with proper authorization

### Phase 3: Booking & Scheduling (Weeks 5-6)
- [ ] Create Booking module
- [ ] Implement scheduling logic
- [ ] Create booking API endpoints
- [ ] Add conflict detection and availability checking

### Phase 4: Billing Integration (Weeks 7-8)
- [ ] Create Billing module
- [ ] Implement invoice generation
- [ ] Add NDIS rate calculations
- [ ] Create billing API endpoints

### Phase 5: AI Integration (Weeks 9-10)
- [ ] Create AIAssistant module
- [ ] Implement provider matching service
- [ ] Add DeepSeek API integration
- [ ] Create recommendation endpoints

### Phase 6: NDIS Compliance (Weeks 11-12)
- [ ] Create NDISIntegration module
- [ ] Implement NDIS API integration
- [ ] Add provider sync logic
- [ ] Create compliance reporting

---

## Database Schema Overview

### Migration Checklist

```php
// Phase 1 Migrations
- create_participants_table
- create_participant_preferences_table
- create_ndis_plans_table

// Phase 2 Migrations
- create_service_requests_table
- create_providers_table
- create_support_workers_table

// Phase 3 Migrations
- create_bookings_table

// Phase 4 Migrations
- create_invoices_table

// Phase 5 Migrations
- create_ai_request_logs_table
- create_ai_recommendations_table

// Phase 6 Migrations
- create_ndis_api_logs_table
- create_ndis_provider_syncs_table

// Supporting Tables
- create_notifications_table
- create_communications_table
- create_documents_table
```

### Key Indexes

```sql
-- Participants
ALTER TABLE participants ADD INDEX idx_contact_id (contact_id);
ALTER TABLE participants ADD INDEX idx_user_id (user_id);
ALTER TABLE participants ADD INDEX idx_ndis_number (ndis_number);
ALTER TABLE participants ADD INDEX idx_created_at (created_at);

-- Service Requests
ALTER TABLE service_requests ADD INDEX idx_participant_id (participant_id);
ALTER TABLE service_requests ADD INDEX idx_status_urgency (status, urgency);
ALTER TABLE service_requests ADD INDEX idx_created_at (created_at);

-- Bookings
ALTER TABLE bookings ADD INDEX idx_participant_id (participant_id);
ALTER TABLE bookings ADD INDEX idx_service_request_id (service_request_id);
ALTER TABLE bookings ADD INDEX idx_start_time (start_time);

-- Invoices
ALTER TABLE invoices ADD INDEX idx_participant_id (participant_id);
ALTER TABLE invoices ADD INDEX idx_ndis_plan_id (ndis_plan_id);
ALTER TABLE invoices ADD INDEX idx_status (status);
```

---

## API Endpoints Reference

### Participant APIs
```
GET    /api/participants              # List all participants
GET    /api/participants/{id}         # Get participant details
POST   /api/participants              # Create new participant
PUT    /api/participants/{id}         # Update participant
DELETE /api/participants/{id}         # Soft delete participant
```

### Service Request APIs
```
GET    /api/service-requests          # List requests (with filtering)
GET    /api/service-requests/{id}     # Get request details
POST   /api/service-requests          # Create request
PUT    /api/service-requests/{id}     # Update request
DELETE /api/service-requests/{id}     # Cancel request
```

### Booking APIs
```
GET    /api/bookings                  # List bookings
POST   /api/bookings                  # Create booking
PUT    /api/bookings/{id}             # Update booking
DELETE /api/bookings/{id}             # Cancel booking
```

### Invoice APIs
```
GET    /api/invoices                  # List invoices
GET    /api/invoices/{id}             # Get invoice details
POST   /api/invoices                  # Create invoice
PUT    /api/invoices/{id}             # Update invoice status
```

### AI Recommendation APIs
```
GET    /api/recommendations/{requestId}  # Get recommendations
POST   /api/recommendations/{id}/accept  # Accept recommendation
POST   /api/recommendations/{id}/feedback  # Provide feedback
```

---

## Security Considerations

### Authorization Requirements

Each module must implement:
- ✅ User role-based access control (RBAC)
- ✅ Participant-specific data isolation
- ✅ Audit trail for sensitive operations
- ✅ Input validation via FormRequest classes
- ✅ SQL injection prevention (Eloquent)
- ✅ XSS prevention (Blade escaping)

### FormRequest Examples

```php
<?php

namespace Webkul\Participant\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateParticipantRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check() && auth()->user()->hasRole('coordinator');
    }

    public function rules(): array
    {
        return [
            'contact_id' => ['required', 'integer', 'exists:contacts,id'],
            'user_id' => ['required', 'integer', 'exists:users,id'],
            'ndis_number' => ['required', 'string', 'unique:participants,ndis_number'],
            'date_of_birth' => ['nullable', 'date_format:Y-m-d'],
            'address' => ['nullable', 'string', 'max:500'],
        ];
    }
}
```

---

## Testing Strategy

### Test File Structure

```
tests/
├── Feature/
│   ├── ParticipantApiTest.php
│   ├── ServiceRequestApiTest.php
│   ├── BookingApiTest.php
│   └── BillingApiTest.php
├── Unit/
│   ├── Models/
│   │   ├── ParticipantTest.php
│   │   └── NDISPlanTest.php
│   └── Repositories/
│       ├── ParticipantRepositoryTest.php
│       └── ServiceRequestRepositoryTest.php
```

### Example Pest Test

```php
<?php

use Webkul\Participant\Models\Participant;
use Webkul\Contact\Models\Contact;
use Webkul\User\Models\User;

describe('ParticipantRepository', function () {
    let('repository', fn() => new \Webkul\Participant\Repositories\ParticipantRepository(new Participant()));

    it('creates a participant with valid data', function () {
        $contact = Contact::factory()->create();
        $user = User::factory()->create();

        $data = [
            'contact_id' => $contact->id,
            'user_id' => $user->id,
            'ndis_number' => 'NDI-123456',
        ];

        $participant = $this->repository->create($data);

        expect($participant->ndis_number)->toBe('NDI-123456');
        expect($participant->is_active)->toBeTrue();
    });

    it('finds participant by NDIS number', function () {
        $participant = Participant::factory()->create(['ndis_number' => 'NDI-999999']);

        $found = $this->repository->findByNDISNumber('NDI-999999');

        expect($found)->not->toBeNull();
        expect($found->id)->toBe($participant->id);
    });
});
```

---

## Compliance & Standards

### Code Standards Compliance

All modules MUST follow:
- ✅ PSR-12 coding standards
- ✅ Laravel 10.0 best practices
- ✅ Eloquent ORM patterns
- ✅ Repository pattern for data access
- ✅ Service classes for business logic
- ✅ FormRequest for validation
- ✅ Policy/Gate for authorization
- ✅ Pest for testing

### Documentation Requirements

Each module must include:
- [ ] README.md with module overview
- [ ] Database schema documentation
- [ ] API endpoint documentation
- [ ] Service class documentation
- [ ] Authorization rules documentation

---

## Relationship Diagram

```
Participant
    ├─ contact (Contact model)
    ├─ user (User model)
    ├─ ndisPlan (NDISPlan)
    └─ serviceRequests (ServiceRequest)

NDISPlan
    ├─ participant (Participant)
    └─ invoices (Invoice)

ServiceRequest
    ├─ participant (Participant)
    ├─ coordinator (User)
    └─ bookings (Booking)

Booking
    ├─ serviceRequest (ServiceRequest)
    ├─ participant (Participant)
    ├─ supportWorker (SupportWorker)
    └─ provider (Provider)

Provider
    └─ supportWorkers (SupportWorker)

SupportWorker
    ├─ provider (Provider)
    └─ bookings (Booking)

Invoice
    ├─ ndisPlan (NDISPlan)
    └─ booking (Booking)

AIRecommendation
    ├─ serviceRequest (ServiceRequest)
    └─ provider (Provider)
```

---

## Performance Optimization

### Query Optimization

```php
// ✅ GOOD: Use eager loading
$requests = ServiceRequest::with(['participant', 'coordinator'])->paginate();

// ❌ BAD: N+1 queries
$requests = ServiceRequest::paginate();
foreach ($requests as $request) {
    echo $request->participant->first_name;  // Query per iteration
}
```

### Caching Strategy

```php
// Cache provider recommendations for 1 hour
$recommendations = Cache::remember(
    "provider_recommendations_{$serviceRequest->id}",
    60 * 60,
    function () use ($serviceRequest) {
        return $this->matchingService->getRecommendedProviders($serviceRequest);
    }
);
```

---

## Configuration Files

### Module Configuration (config/module-name.php)

```php
<?php

return [
    'enabled' => env('MODULE_ENABLED', true),
    
    'ndis' => [
        'api_base_url' => env('NDIS_API_URL'),
        'api_key' => env('NDIS_API_KEY'),
        'sync_interval' => 3600,  // seconds
    ],
    
    'ai' => [
        'provider' => env('AI_PROVIDER', 'deepseek'),
        'model' => env('AI_MODEL', 'deepseek-reasoning'),
        'timeout' => 30000,  // milliseconds
    ],
    
    'billing' => [
        'auto_generate_invoices' => true,
        'invoice_due_days' => 14,
    ],
];
```

---

## Migration from Python Models

The original Python/SQLModel definitions have been converted to Laravel Eloquent models with:
- ✅ Proper type casting
- ✅ Relationship definitions
- ✅ Indexed queries
- ✅ Soft deletes where appropriate
- ✅ JSON field support for complex data
- ✅ Repository pattern for data access

All functionality from the Python models is preserved in the Laravel implementation.

---

**Document Version:** 2.0 (Laravel Port)  
**Last Updated:** November 14, 2025  
**Standards Compliance:** ✅ AI_AGENT_CODING_STANDARDS.md  
**Status:** Ready for Implementation


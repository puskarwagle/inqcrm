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
        'plan_start_date'                => 'date',
        'plan_end_date'                  => 'date',
        'total_budget'                   => 'float',
        'used_budget'                    => 'float',
        'remaining_budget'               => 'float',
        'support_coordination_budget'    => 'float',
        'support_coordination_used'      => 'float',
        'support_coordination_remaining' => 'float',
        'is_active'                      => 'boolean',
        'created_at'                     => 'datetime',
        'updated_at'                     => 'datetime',
    ];

    /**
     * Get the participant this plan belongs to.
     */
    public function participant(): BelongsTo
    {
        return $this->belongsTo(\Webkul\Participant\Models\Participant::class);
    }

    /**
     * Get all invoices for this plan.
     */
    public function invoices(): HasMany
    {
        return $this->hasMany(\Webkul\Billing\Models\Invoice::class);
    }

    /**
     * Calculate remaining budget.
     */
    public function getRemainingBudgetAttribute(): float
    {
        return $this->total_budget - $this->used_budget;
    }

    /**
     * Check if plan is within budget.
     */
    public function isWithinBudget(): bool
    {
        return $this->remaining_budget >= 0;
    }

    /**
     * Check if plan has expired.
     */
    public function hasExpired(): bool
    {
        return now()->isAfter($this->plan_end_date);
    }
}

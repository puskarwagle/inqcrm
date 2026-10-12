<?php

namespace Webkul\Participant\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Webkul\Contact\Models\Contact;
use Webkul\NDISPlan\Models\NDISPlan;
use Webkul\ServiceRequest\Models\ServiceRequest;
use Webkul\User\Models\User;

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
     */
    public function contact(): BelongsTo
    {
        return $this->belongsTo(Contact::class);
    }

    /**
     * Get the user associated with this participant.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the NDIS plan for this participant.
     */
    public function ndisPlan(): HasOne
    {
        return $this->hasOne(NDISPlan::class);
    }

    /**
     * Get all service requests for this participant.
     */
    public function serviceRequests(): HasMany
    {
        return $this->hasMany(ServiceRequest::class);
    }
}

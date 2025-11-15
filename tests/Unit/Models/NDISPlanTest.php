<?php

use Carbon\Carbon;
use Webkul\Billing\Models\Invoice;
use Webkul\NDISPlan\Models\NDISPlan;
use Webkul\Participant\Models\Participant;

it('can create an NDIS plan', function () {
    $participant = Participant::factory()->create();

    $ndisPlan = NDISPlan::create([
        'participant_id'              => $participant->id,
        'ndis_number'                 => 'PLAN123456789',
        'plan_start_date'             => '2024-01-01',
        'plan_end_date'               => '2024-12-31',
        'plan_manager'                => 'Manager A',
        'total_budget'                => 10000.00,
        'used_budget'                 => 2000.00,
        'support_coordination_budget' => 1000.00,
        'support_coordination_used'   => 100.00,
        'plan_document_id'            => null,
        'is_active'                   => true,
    ]);

    expect($ndisPlan)->toBeInstanceOf(NDISPlan::class);
    expect($ndisPlan->ndis_number)->toBe('PLAN123456789');
    expect($ndisPlan->participant->id)->toBe($participant->id);
});

it('has a participant relationship', function () {
    $participant = Participant::factory()->create();
    $ndisPlan = NDISPlan::factory()->create(['participant_id' => $participant->id]);

    expect($ndisPlan->participant)->toBeInstanceOf(Participant::class);
    expect($ndisPlan->participant->id)->toBe($participant->id);
});

it('has many invoices relationship', function () {
    $ndisPlan = NDISPlan::factory()->create();
    Invoice::factory()->count(2)->create(['ndis_plan_id' => $ndisPlan->id]);

    expect($ndisPlan->invoices)->toHaveCount(2);
    expect($ndisPlan->invoices->first())->toBeInstanceOf(Invoice::class);
});

it('calculates remaining budget correctly', function () {
    $ndisPlan = NDISPlan::factory()->create([
        'total_budget' => 5000.00,
        'used_budget'  => 1500.00,
    ]);

    expect($ndisPlan->remaining_budget)->toBe(3500.00);
});

it('checks if plan is within budget', function () {
    $ndisPlan = NDISPlan::factory()->create([
        'total_budget' => 5000.00,
        'used_budget'  => 4000.00,
    ]);
    expect($ndisPlan->isWithinBudget())->toBeTrue();

    $ndisPlan->used_budget = 5500.00;
    expect($ndisPlan->isWithinBudget())->toBeFalse();
});

it('checks if plan has expired', function () {
    $ndisPlan = NDISPlan::factory()->create(['plan_end_date' => Carbon::yesterday()]);
    expect($ndisPlan->hasExpired())->toBeTrue();

    $ndisPlan = NDISPlan::factory()->create(['plan_end_date' => Carbon::tomorrow()]);
    expect($ndisPlan->hasExpired())->toBeFalse();
});

it('casts date fields to date objects', function () {
    $ndisPlan = NDISPlan::factory()->create([
        'plan_start_date' => '2023-01-01',
        'plan_end_date'   => '2023-12-31',
    ]);

    expect($ndisPlan->plan_start_date)->toBeInstanceOf(Carbon::class);
    expect($ndisPlan->plan_end_date)->toBeInstanceOf(Carbon::class);
    expect($ndisPlan->plan_start_date->format('Y-m-d'))->toBe('2023-01-01');
});

it('casts float fields correctly', function () {
    $ndisPlan = NDISPlan::factory()->create([
        'total_budget'                => 1234.56,
        'used_budget'                 => 123.45,
        'support_coordination_budget' => 100.00,
        'support_coordination_used'   => 10.00,
    ]);

    expect($ndisPlan->total_budget)->toBe(1234.56);
    expect($ndisPlan->used_budget)->toBe(123.45);
    expect($ndisPlan->support_coordination_budget)->toBe(100.00);
    expect($ndisPlan->support_coordination_used)->toBe(10.00);
});

it('uses soft deletes', function () {
    $ndisPlan = NDISPlan::factory()->create();
    $ndisPlan->delete();
    $this->assertSoftDeleted($ndisPlan);
});

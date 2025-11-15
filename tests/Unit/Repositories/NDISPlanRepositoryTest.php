<?php

use Webkul\NDISPlan\Models\NDISPlan;
use Webkul\Participant\Models\Participant;
use Webkul\NDISPlan\Repositories\NDISPlanRepository;
use Illuminate\Database\Eloquent\Collection;

describe('NDISPlanRepository', function () {
    beforeEach(function () {
        $this->repository = new NDISPlanRepository(new NDISPlan());
    });

    it('can create an NDIS plan with valid data', function () {
        $participant = Participant::factory()->create();

        $data = [
            'participant_id' => $participant->id,
            'ndis_number' => 'PLAN-REPO-123',
            'plan_start_date' => '2024-01-01',
            'plan_end_date' => '2024-12-31',
            'total_budget' => 15000.00,
            'is_active' => true,
        ];

        $ndisPlan = $this->repository->create($data);

        expect($ndisPlan)->toBeInstanceOf(NDISPlan::class);
        expect($ndisPlan->ndis_number)->toBe('PLAN-REPO-123');
        expect($ndisPlan->is_active)->toBeTrue();
        $this->assertDatabaseHas('ndis_plans', ['ndis_number' => 'PLAN-REPO-123']);
    });

    it('can find an NDIS plan by ID', function () {
        $ndisPlan = NDISPlan::factory()->create();

        $found = $this->repository->findById($ndisPlan->id);

        expect($found)->not->toBeNull();
        expect($found->id)->toBe($ndisPlan->id);
    });

    it('can find an active NDIS plan by ID', function () {
        $ndisPlan = NDISPlan::factory()->create(['is_active' => true]);
        $found = $this->repository->findActive($ndisPlan->id);

        expect($found)->not->toBeNull();
        expect($found->id)->toBe($ndisPlan->id);
        expect($found->is_active)->toBeTrue();
    });

    it('does not find an inactive NDIS plan by ID using findActive', function () {
        $ndisPlan = NDISPlan::factory()->create(['is_active' => false]);
        $found = $this->repository->findActive($ndisPlan->id);

        expect($found)->toBeNull();
    });

    it('can update an NDIS plan', function () {
        $ndisPlan = NDISPlan::factory()->create(['total_budget' => 1000.00]);
        $updated = $this->repository->update($ndisPlan->id, ['total_budget' => 2000.00]);

        expect($updated)->toBeTrue();
        $this->assertDatabaseHas('ndis_plans', ['id' => $ndisPlan->id, 'total_budget' => 2000.00]);
    });

    it('can get all active NDIS plans', function () {
        NDISPlan::factory()->count(2)->create(['is_active' => true]);
        NDISPlan::factory()->count(1)->create(['is_active' => false]);

        $activePlans = $this->repository->getActivePlans();

        expect($activePlans)->toBeInstanceOf(Collection::class);
        expect($activePlans)->toHaveCount(2);
        $activePlans->each(function ($p) {
            expect($p->is_active)->toBeTrue();
        });
    });
});

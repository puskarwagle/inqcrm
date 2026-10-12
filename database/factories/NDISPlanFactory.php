<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\NDISPlan\Models\NDISPlan;
use Webkul\Participant\Models\Participant;

class NDISPlanFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = NDISPlan::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $totalBudget = $this->faker->randomFloat(2, 5000, 50000);
        $usedBudget = $this->faker->randomFloat(2, 0, $totalBudget * 0.8);
        $supportCoordinationBudget = $this->faker->randomFloat(2, 500, 5000);
        $supportCoordinationUsed = $this->faker->randomFloat(2, 0, $supportCoordinationBudget * 0.8);

        return [
            'participant_id'              => Participant::factory(),
            'ndis_number'                 => 'PLAN-'.$this->faker->unique()->randomNumber(7),
            'plan_start_date'             => $this->faker->dateTimeBetween('-1 year', 'now')->format('Y-m-d'),
            'plan_end_date'               => $this->faker->dateTimeBetween('now', '+1 year')->format('Y-m-d'),
            'plan_manager'                => $this->faker->name,
            'total_budget'                => $totalBudget,
            'used_budget'                 => $usedBudget,
            'support_coordination_budget' => $supportCoordinationBudget,
            'support_coordination_used'   => $supportCoordinationUsed,
            'plan_document_id'            => null,
            'is_active'                   => $this->faker->boolean(),
        ];
    }
}

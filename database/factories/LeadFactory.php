<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Webkul\Lead\Models\Lead>
 */
class LeadFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title'                  => $this->faker->sentence(),
            'description'            => $this->faker->paragraph(),
            'lead_value'             => $this->faker->randomFloat(4, 10, 1000),
            'status'                 => 1,
            'user_id'                => 1,
            'person_id'              => \Webkul\Contact\Models\Person::factory(),
            'lead_source_id'         => 1,
            'lead_type_id'           => 1,
            'lead_pipeline_id'       => 1,
            'lead_pipeline_stage_id' => 1,
            'created_at'             => now(),
            'updated_at'             => now(),
        ];
    }
}

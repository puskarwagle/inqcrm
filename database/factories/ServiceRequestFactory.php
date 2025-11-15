<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Participant\Models\Participant;
use Webkul\ServiceRequest\Models\ServiceRequest;
use Webkul\User\Models\User;

class ServiceRequestFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = ServiceRequest::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'participant_id'          => Participant::factory(),
            'assigned_coordinator_id' => User::factory(),
            'title'                   => $this->faker->sentence,
            'description'             => $this->faker->paragraph,
            'service_category'        => $this->faker->randomElement(['personal care', 'transport', 'therapy', 'household tasks']),
            'urgency'                 => $this->faker->randomElement(['low', 'medium', 'high', 'urgent']),
            'preferred_date'          => $this->faker->date(),
            'preferred_time'          => $this->faker->time('H:i'),
            'status'                  => $this->faker->randomElement(['open', 'in progress', 'completed', 'cancelled']),
            'priority_score'          => $this->faker->randomFloat(2, 0, 100),
            'ai_categorized_category' => $this->faker->word,
            'ai_priority_reason'      => $this->faker->sentence,
        ];
    }
}

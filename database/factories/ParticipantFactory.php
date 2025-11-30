<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Contact\Models\Contact;
use Webkul\Participant\Models\Participant;
use Webkul\User\Models\User;

class ParticipantFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Participant::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'contact_id'        => Contact::factory(),
            'user_id'           => User::factory(),
            'ndis_number'       => 'NDIS-'.$this->faker->unique()->randomNumber(8),
            'date_of_birth'     => $this->faker->date(),
            'address'           => $this->faker->address,
            'emergency_contact' => $this->faker->name.' - '.$this->faker->phoneNumber,
            'disabilities'      => json_encode($this->faker->randomElements(['mobility', 'vision', 'hearing', 'cognitive'], $this->faker->numberBetween(1, 3))),
            'preferences'       => json_encode(['communication' => $this->faker->randomElement(['email', 'phone', 'mail'])]),
            'is_active'         => $this->faker->boolean(),
        ];
    }
}

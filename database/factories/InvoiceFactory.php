<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Webkul\Billing\Models\Invoice;
use Webkul\Booking\Models\Booking;
use Webkul\NDISPlan\Models\NDISPlan;
use Webkul\Participant\Models\Participant; // Assuming Booking model will be created later

class InvoiceFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Invoice::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $hoursBilled = $this->faker->randomFloat(2, 1, 10);
        $ratePerHour = $this->faker->randomFloat(2, 30, 100);
        $totalAmount = $hoursBilled * $ratePerHour;

        return [
            'ndis_plan_id'   => NDISPlan::factory(),
            'participant_id' => Participant::factory(),
            // 'booking_id' => Booking::factory(), // Uncomment when BookingFactory is available
            'ndis_support_item_number' => $this->faker->bothify('????##'),
            'hours_billed'             => $hoursBilled,
            'rate_per_hour'            => $ratePerHour,
            'total_amount'             => $totalAmount,
            'service_date'             => $this->faker->date(),
            'status'                   => $this->faker->randomElement(['draft', 'submitted', 'paid', 'cancelled']),
            'ndis_claim_id'            => $this->faker->uuid,
            'submitted_date'           => $this->faker->optional()->date(),
            'paid_date'                => $this->faker->optional()->date(),
        ];
    }
}

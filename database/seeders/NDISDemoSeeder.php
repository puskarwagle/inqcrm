<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Webkul\Contact\Models\Person;
use Webkul\NDISPlan\Models\NDISPlan;
use Webkul\Participant\Models\Participant;
use Webkul\Participant\Models\ParticipantPreference;
use Webkul\User\Models\User;

/**
 * Demo data for the NDIS modules.
 *
 * Idempotent: safe to re-run, existing rows (matched by NDIS number)
 * are left untouched.
 *
 * Run with:
 *   php artisan db:seed --class=Database\\Seeders\\NDISDemoSeeder
 */
class NDISDemoSeeder extends Seeder
{
    public function run(): void
    {
        $admin = User::where('email', 'admin@example.com')->first()
            ?? User::firstOrFail();

        foreach ($this->participants() as $data) {
            $person = Person::where('name', $data['name'])->first();

            if (! $person) {
                $person = Person::create([
                    'name' => $data['name'],
                    'emails' => [['value' => $data['email'], 'label' => 'Work']],
                    'contact_numbers' => [['value' => $data['phone'], 'label' => 'Work']],
                    'job_title' => 'NDIS Participant',
                    'user_id' => $admin->id,
                    'unique_id' => 'DEMO-'.substr($data['ndis_number'], -6),
                ]);
            }

            $participant = Participant::firstOrCreate(
                ['ndis_number' => $data['ndis_number']],
                [
                    'contact_id' => $person->id,
                    'user_id' => $admin->id,
                    'date_of_birth' => $data['date_of_birth'],
                    'address' => $data['address'],
                    'emergency_contact' => $data['emergency_contact'],
                    'disabilities' => $data['disabilities'],
                    'preferences' => $data['preferences'],
                    'is_active' => $data['is_active'],
                ]
            );

            NDISPlan::firstOrCreate(
                ['ndis_number' => $data['plan']['ndis_number']],
                [
                    'participant_id' => $participant->id,
                    'plan_start_date' => $data['plan']['start'],
                    'plan_end_date' => $data['plan']['end'],
                    'plan_manager' => $data['plan']['manager'],
                    'total_budget' => $data['plan']['total'],
                    'used_budget' => $data['plan']['used'],
                    'support_coordination_budget' => $data['plan']['sc_total'],
                    'support_coordination_used' => $data['plan']['sc_used'],
                    'is_active' => $data['plan']['is_active'],
                ]
            );

            foreach ($data['preference_rows'] as $preference) {
                ParticipantPreference::firstOrCreate(
                    [
                        'participant_id' => $participant->id,
                        'preference_key' => $preference['key'],
                    ],
                    [
                        'preference_value' => $preference['value'],
                        'category' => $preference['category'],
                    ]
                );
            }
        }
    }

    /**
     * Eight fictional participants covering the demo scenarios:
     * healthy plan, high utilisation, expiring soon, expired/inactive.
     */
    private function participants(): array
    {
        return [
            [
                'name' => 'Sarah Mitchell',
                'email' => 'sarah.mitchell@example.com',
                'phone' => '+61 412 345 678',
                'ndis_number' => '430012345',
                'date_of_birth' => '1988-04-12',
                'address' => '14 Park Street, Brunswick VIC 3056',
                'emergency_contact' => 'David Mitchell (brother) - +61 423 456 789',
                'disabilities' => ['mobility', 'chronic-pain'],
                'preferences' => ['communication' => 'email'],
                'is_active' => true,
                'plan' => [
                    'ndis_number' => 'PLAN-43001234',
                    'start' => '2025-07-01',
                    'end' => '2026-06-30',
                    'manager' => 'Leap in! Australia',
                    'total' => 65000.00,
                    'used' => 41200.50,
                    'sc_total' => 8000.00,
                    'sc_used' => 3250.00,
                    'is_active' => true,
                ],
                'preference_rows' => [
                    ['key' => 'communication', 'value' => 'email', 'category' => 'contact'],
                    ['key' => 'appointment_reminder', 'value' => 'sms-24h', 'category' => 'contact'],
                ],
            ],
            [
                'name' => 'James OConnor',
                'email' => 'james.oconnor@example.com',
                'phone' => '+61 435 678 901',
                'ndis_number' => '430023456',
                'date_of_birth' => '1975-11-03',
                'address' => '27 Beach Road, Fremantle WA 6160',
                'emergency_contact' => 'Mary OConnor (wife) - +61 446 789 012',
                'disabilities' => ['vision'],
                'preferences' => ['communication' => 'phone'],
                'is_active' => true,
                'plan' => [
                    'ndis_number' => 'PLAN-43002345',
                    'start' => '2025-09-15',
                    'end' => '2026-09-14',
                    'manager' => 'My Plan Manager',
                    'total' => 42000.00,
                    'used' => 38900.00,
                    'sc_total' => 5000.00,
                    'sc_used' => 4750.25,
                    'is_active' => true,
                ],
                'preference_rows' => [
                    ['key' => 'communication', 'value' => 'phone', 'category' => 'contact'],
                    ['key' => 'large_print', 'value' => 'yes', 'category' => 'accessibility'],
                ],
            ],
            [
                'name' => 'Priya Sharma',
                'email' => 'priya.sharma@example.com',
                'phone' => '+61 448 901 234',
                'ndis_number' => '430034567',
                'date_of_birth' => '1996-02-28',
                'address' => '8/52 Harris Street, Parramatta NSW 2150',
                'emergency_contact' => 'Raj Sharma (father) - +61 459 012 345',
                'disabilities' => ['hearing'],
                'preferences' => ['communication' => 'sms'],
                'is_active' => true,
                'plan' => [
                    'ndis_number' => 'PLAN-43003456',
                    'start' => '2026-01-10',
                    'end' => '2027-01-09',
                    'manager' => 'Plan Partners',
                    'total' => 28000.00,
                    'used' => 3200.00,
                    'sc_total' => 3000.00,
                    'sc_used' => 450.00,
                    'is_active' => true,
                ],
                'preference_rows' => [
                    ['key' => 'communication', 'value' => 'sms', 'category' => 'contact'],
                    ['key' => 'auslan_interpreter', 'value' => 'required', 'category' => 'accessibility'],
                ],
            ],
            [
                'name' => 'Tom Nguyen',
                'email' => 'tom.nguyen@example.com',
                'phone' => '+61 461 234 567',
                'ndis_number' => '430045678',
                'date_of_birth' => '2001-07-19',
                'address' => '3 Wattle Avenue, Springvale VIC 3171',
                'emergency_contact' => 'Linh Nguyen (mother) - +61 472 345 678',
                'disabilities' => ['cognitive', 'psychosocial'],
                'preferences' => ['communication' => 'email'],
                'is_active' => true,
                'plan' => [
                    'ndis_number' => 'PLAN-43004567',
                    'start' => '2025-11-01',
                    'end' => '2026-11-10',
                    'manager' => 'Self managed',
                    'total' => 55000.00,
                    'used' => 28750.75,
                    'sc_total' => 10000.00,
                    'sc_used' => 6100.00,
                    'is_active' => true,
                ],
                'preference_rows' => [
                    ['key' => 'communication', 'value' => 'email', 'category' => 'contact'],
                    ['key' => 'quiet_room', 'value' => 'preferred', 'category' => 'accessibility'],
                ],
            ],
            [
                'name' => 'Emily Carter',
                'email' => 'emily.carter@example.com',
                'phone' => '+61 483 456 789',
                'ndis_number' => '430056789',
                'date_of_birth' => '1990-12-05',
                'address' => '19 Ocean View Terrace, Noosa QLD 4567',
                'emergency_contact' => 'Steve Carter (husband) - +61 494 567 890',
                'disabilities' => ['neurological'],
                'preferences' => ['communication' => 'phone'],
                'is_active' => true,
                'plan' => [
                    'ndis_number' => 'PLAN-43005678',
                    'start' => '2024-08-01',
                    'end' => '2025-07-31',
                    'manager' => 'NDIS Plan Managers',
                    'total' => 73000.00,
                    'used' => 70120.00,
                    'sc_total' => 9000.00,
                    'sc_used' => 8900.00,
                    'is_active' => false,
                ],
                'preference_rows' => [
                    ['key' => 'communication', 'value' => 'phone', 'category' => 'contact'],
                ],
            ],
            [
                'name' => 'Oliver Smith',
                'email' => 'oliver.smith@example.com',
                'phone' => '+61 405 678 901',
                'ndis_number' => '430067890',
                'date_of_birth' => '1983-06-22',
                'address' => '44 King William Street, Adelaide SA 5000',
                'emergency_contact' => 'Karen Smith (sister) - +61 416 789 012',
                'disabilities' => ['mobility'],
                'preferences' => ['communication' => 'email'],
                'is_active' => true,
                'plan' => [
                    'ndis_number' => 'PLAN-43006789',
                    'start' => '2026-03-01',
                    'end' => '2027-02-28',
                    'manager' => 'Leap in! Australia',
                    'total' => 38000.00,
                    'used' => 0.00,
                    'sc_total' => 4000.00,
                    'sc_used' => 0.00,
                    'is_active' => true,
                ],
                'preference_rows' => [
                    ['key' => 'communication', 'value' => 'email', 'category' => 'contact'],
                    ['key' => 'wheelchair_access', 'value' => 'required', 'category' => 'accessibility'],
                ],
            ],
            [
                'name' => 'Aisha Khan',
                'email' => 'aisha.khan@example.com',
                'phone' => '+61 427 890 123',
                'ndis_number' => '430078901',
                'date_of_birth' => '1993-09-14',
                'address' => '11 Lonsdale Street, Braddon ACT 2612',
                'emergency_contact' => 'Imran Khan (brother) - +61 438 901 234',
                'disabilities' => ['psychosocial'],
                'preferences' => ['communication' => 'sms'],
                'is_active' => true,
                'plan' => [
                    'ndis_number' => 'PLAN-43007890',
                    'start' => '2025-05-20',
                    'end' => '2026-05-19',
                    'manager' => 'My Plan Manager',
                    'total' => 47000.00,
                    'used' => 44100.30,
                    'sc_total' => 6000.00,
                    'sc_used' => 5900.00,
                    'is_active' => true,
                ],
                'preference_rows' => [
                    ['key' => 'communication', 'value' => 'sms', 'category' => 'contact'],
                    ['key' => 'female_worker', 'value' => 'preferred', 'category' => 'care'],
                ],
            ],
            [
                'name' => 'Jack Thompson',
                'email' => 'jack.thompson@example.com',
                'phone' => '+61 449 012 345',
                'ndis_number' => '430089012',
                'date_of_birth' => '1970-01-30',
                'address' => '2 Salamanca Place, Hobart TAS 7000',
                'emergency_contact' => 'Diane Thompson (wife) - +61 450 123 456',
                'disabilities' => ['mobility', 'vision'],
                'preferences' => ['communication' => 'phone'],
                'is_active' => false,
                'plan' => [
                    'ndis_number' => 'PLAN-43008901',
                    'start' => '2024-02-01',
                    'end' => '2025-01-31',
                    'manager' => 'Plan Partners',
                    'total' => 59000.00,
                    'used' => 51200.00,
                    'sc_total' => 7500.00,
                    'sc_used' => 7000.00,
                    'is_active' => false,
                ],
                'preference_rows' => [
                    ['key' => 'communication', 'value' => 'phone', 'category' => 'contact'],
                ],
            ],
        ];
    }
}

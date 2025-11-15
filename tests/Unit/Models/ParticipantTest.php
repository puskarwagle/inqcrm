<?php

use Webkul\Participant\Models\Participant;
use Webkul\Contact\Models\Contact;
use Webkul\User\Models\User;
use Webkul\NDISPlan\Models\NDISPlan;
use Webkul\ServiceRequest\Models\ServiceRequest;

it('can create a participant', function () {
    $contact = Contact::factory()->create();
    $user = User::factory()->create();

    $participant = Participant::create([
        'contact_id' => $contact->id,
        'user_id' => $user->id,
        'ndis_number' => 'NDIS123456789',
        'date_of_birth' => '1990-01-01',
        'address' => '123 Main St',
        'emergency_contact' => 'John Doe - 0400000000',
        'disabilities' => ['mobility', 'vision'],
        'preferences' => ['communication' => 'email'],
        'is_active' => true,
    ]);

    expect($participant)->toBeInstanceOf(Participant::class);
    expect($participant->ndis_number)->toBe('NDIS123456789');
    expect($participant->contact->id)->toBe($contact->id);
    expect($participant->user->id)->toBe($user->id);
});

it('has a contact relationship', function () {
    $contact = Contact::factory()->create();
    $participant = Participant::factory()->create(['contact_id' => $contact->id]);

    expect($participant->contact)->toBeInstanceOf(Contact::class);
    expect($participant->contact->id)->toBe($contact->id);
});

it('has a user relationship', function () {
    $user = User::factory()->create();
    $participant = Participant::factory()->create(['user_id' => $user->id]);

    expect($participant->user)->toBeInstanceOf(User::class);
    expect($participant->user->id)->toBe($user->id);
});

it('has an NDIS plan relationship', function () {
    $participant = Participant::factory()->create();
    $ndisPlan = NDISPlan::factory()->create(['participant_id' => $participant->id]);

    expect($participant->ndisPlan)->toBeInstanceOf(NDISPlan::class);
    expect($participant->ndisPlan->id)->toBe($ndisPlan->id);
});

it('has many service requests relationship', function () {
    $participant = Participant::factory()->create();
    ServiceRequest::factory()->count(3)->create(['participant_id' => $participant->id]);

    expect($participant->serviceRequests)->toHaveCount(3);
    expect($participant->serviceRequests->first())->toBeInstanceOf(ServiceRequest::class);
});

it('casts date_of_birth to date', function () {
    $participant = Participant::factory()->create(['date_of_birth' => '1990-05-15']);
    expect($participant->date_of_birth)->toBeInstanceOf(Carbon\Carbon::class);
    expect($participant->date_of_birth->format('Y-m-d'))->toBe('1990-05-15');
});

it('casts disabilities and preferences to json', function () {
    $participant = Participant::factory()->create([
        'disabilities' => ['hearing', 'speech'],
        'preferences' => ['mode' => 'phone'],
    ]);

    expect($participant->disabilities)->toBe(['hearing', 'speech']);
    expect($participant->preferences)->toBe(['mode' => 'phone']);
});

it('casts is_active to boolean', function () {
    $participant = Participant::factory()->create(['is_active' => 0]);
    expect($participant->is_active)->toBeFalse();

    $participant = Participant::factory()->create(['is_active' => 1]);
    expect($participant->is_active)->toBeTrue();
});

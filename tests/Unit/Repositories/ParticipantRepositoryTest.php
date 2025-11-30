<?php

use Illuminate\Database\Eloquent\Collection;
use Webkul\Contact\Models\Contact;
use Webkul\Participant\Models\Participant;
use Webkul\Participant\Repositories\ParticipantRepository;
use Webkul\User\Models\User;

describe('ParticipantRepository', function () {
    beforeEach(function () {
        $this->repository = new ParticipantRepository(new Participant);
    });

    it('can create a participant with valid data', function () {
        $contact = Contact::factory()->create();
        $user = User::factory()->create();

        $data = [
            'contact_id'        => $contact->id,
            'user_id'           => $user->id,
            'ndis_number'       => 'NDI-123456',
            'date_of_birth'     => '1990-01-01',
            'address'           => '123 Test St',
            'emergency_contact' => 'Jane Doe',
            'disabilities'      => ['physical'],
            'preferences'       => ['email_updates' => true],
            'is_active'         => true,
        ];

        $participant = $this->repository->create($data);

        expect($participant)->toBeInstanceOf(Participant::class);
        expect($participant->ndis_number)->toBe('NDI-123456');
        expect($participant->is_active)->toBeTrue();
        $this->assertDatabaseHas('participants', ['ndis_number' => 'NDI-123456']);
    });

    it('can find a participant by NDIS number', function () {
        $participant = Participant::factory()->create(['ndis_number' => 'NDI-999999']);

        $found = $this->repository->findByNDISNumber('NDI-999999');

        expect($found)->not->toBeNull();
        expect($found->id)->toBe($participant->id);
        expect($found->ndis_number)->toBe('NDI-999999');
    });

    it('can find an active participant by ID', function () {
        $participant = Participant::factory()->create(['is_active' => true]);
        $found = $this->repository->findActive($participant->id);

        expect($found)->not->toBeNull();
        expect($found->id)->toBe($participant->id);
        expect($found->is_active)->toBeTrue();
    });

    it('does not find an inactive participant by ID using findActive', function () {
        $participant = Participant::factory()->create(['is_active' => false]);
        $found = $this->repository->findActive($participant->id);

        expect($found)->toBeNull();
    });

    it('can update a participant', function () {
        $participant = Participant::factory()->create(['ndis_number' => 'OLD-NDIS']);
        $updated = $this->repository->update($participant->id, ['ndis_number' => 'NEW-NDIS']);

        expect($updated)->toBeTrue();
        $this->assertDatabaseHas('participants', ['id' => $participant->id, 'ndis_number' => 'NEW-NDIS']);
    });

    it('can get all active participants', function () {
        Participant::factory()->count(2)->create(['is_active' => true]);
        Participant::factory()->count(1)->create(['is_active' => false]);

        $activeParticipants = $this->repository->getActiveParticipants();

        expect($activeParticipants)->toBeInstanceOf(Collection::class);
        expect($activeParticipants)->toHaveCount(2);
        $activeParticipants->each(function ($p) {
            expect($p->is_active)->toBeTrue();
        });
    });
});

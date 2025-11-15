<?php

namespace Webkul\Participant\Repositories;

use Webkul\Participant\Models\Participant;
use Illuminate\Database\Eloquent\Collection;

class ParticipantRepository
{
    public function __construct(
        private Participant $model
    ) {}

    public function query()
    {
        return $this->model->query();
    }

    public function findByNDISNumber(string $ndisNumber): ?Participant
    {
        return $this->query()
            ->where('ndis_number', $ndisNumber)
            ->with(['contact', 'user', 'ndisPlan'])
            ->first();
    }

    public function findActive(int $id): ?Participant
    {
        return $this->query()
            ->where('is_active', true)
            ->find($id);
    }

    public function create(array $data): Participant
    {
        return $this->model->create($data);
    }

    public function update(int $id, array $data): bool
    {
        return $this->query()->find($id)->update($data);
    }

    public function getActiveParticipants(): Collection
    {
        return $this->query()
            ->where('is_active', true)
            ->with(['contact', 'ndisPlan'])
            ->get();
    }
}

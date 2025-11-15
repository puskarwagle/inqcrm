<?php

namespace Webkul\NDISPlan\Repositories;

use Webkul\NDISPlan\Models\NDISPlan;
use Illuminate\Database\Eloquent\Collection;

class NDISPlanRepository
{
    public function __construct(
        private NDISPlan $model
    ) {}

    public function query()
    {
        return $this->model->query();
    }

    public function findById(int $id): ?NDISPlan
    {
        return $this->query()
            ->with(['participant'])
            ->find($id);
    }

    public function findActive(int $id): ?NDISPlan
    {
        return $this->query()
            ->where('is_active', true)
            ->find($id);
    }

    public function create(array $data): NDISPlan
    {
        return $this->model->create($data);
    }

    public function update(int $id, array $data): bool
    {
        return $this->query()->find($id)->update($data);
    }

    public function getActivePlans(): Collection
    {
        return $this->query()
            ->where('is_active', true)
            ->with(['participant'])
            ->get();
    }
}

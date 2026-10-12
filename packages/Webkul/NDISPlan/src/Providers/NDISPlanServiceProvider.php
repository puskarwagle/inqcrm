<?php

namespace Webkul\NDISPlan\Providers;

use Webkul\Core\Providers\BaseModuleServiceProvider;
use Webkul\NDISPlan\Repositories\NDISPlanRepository;

class NDISPlanServiceProvider extends BaseModuleServiceProvider
{
    public function register(): void
    {
        parent::register();

        $this->loadMigrationsFrom(__DIR__.'/../Database/Migrations');

        $this->app->singleton(NDISPlanRepository::class, function () {
            return new NDISPlanRepository(new \Webkul\NDISPlan\Models\NDISPlan);
        });
    }
}

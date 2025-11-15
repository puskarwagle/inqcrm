<?php

namespace Webkul\Participant\Providers;

use Konekt\Concord\BaseModuleServiceProvider;
use Webkul\Participant\Repositories\ParticipantRepository;

class ParticipantServiceProvider extends BaseModuleServiceProvider
{
    protected $routesPath = __DIR__ . '/../Routes/api.php';

    public function register(): void
    {
        parent::register();

        $this->loadMigrationsFrom(__DIR__ . '/../Database/Migrations');

        $this->app->singleton(ParticipantRepository::class, function () {
            return new ParticipantRepository(new \Webkul\Participant\Models\Participant());
        });
    }
}

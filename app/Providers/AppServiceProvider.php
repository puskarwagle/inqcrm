<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // Force HTTPS URLs when request is over HTTPS (behind proxy or direct)
        if (request()->isSecure() || 
            request()->header('X-Forwarded-Proto') === 'https' ||
            (request()->server('HTTPS') === 'on' || request()->server('HTTPS') === '1')) {
            \URL::forceScheme('https');
        }
        
        // Also check if APP_URL contains https://crm.inquisitivemind.tech
        $appUrl = config('app.url');
        if (str_contains($appUrl, 'crm.inquisitivemind.tech') || str_contains($appUrl, 'inquisitivemind.tech')) {
            \URL::forceScheme('https');
        }
        
        // Force HTTPS for the domain
        if (request()->getHost() === 'crm.inquisitivemind.tech') {
            \URL::forceScheme('https');
        }
    }
}

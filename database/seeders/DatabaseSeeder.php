<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Webkul\Lead\Models\Lead;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(\Database\Seeders\Tables\RolesSeeder::class);
        $this->call(\Database\Seeders\Tables\GroupsSeeder::class);
        $this->call(\Database\Seeders\Tables\UsersSeeder::class);
        $this->call(\Database\Seeders\Tables\LeadPipelinesSeeder::class);
        $this->call(\Database\Seeders\Tables\LeadPipelineStagesSeeder::class);
        $this->call(\Database\Seeders\Tables\LeadSourcesSeeder::class);

        Lead::factory()->count(20)->create();
    }
}

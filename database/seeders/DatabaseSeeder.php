<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        $this->call(\Database\Seeders\Tables\RolesSeeder::class);
        $this->call(\Database\Seeders\Tables\GroupsSeeder::class);
        $this->call(\Database\Seeders\Tables\UsersSeeder::class);
        $this->call(\Database\Seeders\Tables\LeadPipelinesSeeder::class);
        $this->call(\Database\Seeders\Tables\LeadPipelineStagesSeeder::class);
        $this->call(\Database\Seeders\Tables\LeadSourcesSeeder::class);

        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}

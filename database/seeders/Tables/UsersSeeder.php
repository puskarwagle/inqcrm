<?php
namespace Database\Seeders\Tables;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /**
         * Command :
         * artisan seed:generate --table-mode --tables=users
         *
         */

        DB::table("users")->truncate();

        $dataTables = [
            [
                'id' => 1,
                'name' => 'Example Admin',
                'email' => 'admin@example.com',
                'password' => '$2y$10$omtxk7pDeqvmVmFI7K21buTkZCNa2j2wSuwr3ofANLQWMiqlpbUtG',
                'status' => 1,
                'view_permission' => 'global',
                'role_id' => 1,
                'remember_token' => NULL,
                'created_at' => '2025-11-15 07:31:34',
                'updated_at' => '2025-11-15 07:31:34',
            ]
        ];
        
        DB::table("users")->insert($dataTables);
    }
}
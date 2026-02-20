<?php

namespace Database\Seeders\Tables;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LeadStagesSeeder extends Seeder
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
         * artisan seed:generate --table-mode --tables=activities,activity_files,activity_participants,attributes,attribute_options,attribute_values,core_config,countries,country_states,email_attachments,email_templates,emails,groups,lead_pipeline_stages,lead_pipelines,lead_products,lead_sources,lead_stages,leads,organizations,persons,products,quote_items,quotes,roles,tags,workflows
         */
        DB::table('lead_stages')->truncate();
        $dataTables = [

        ];

        DB::table('lead_stages')->insert($dataTables);
    }
}

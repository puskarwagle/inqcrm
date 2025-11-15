<?php
namespace Database\Seeders\Tables;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LeadPipelineStagesSeeder extends Seeder
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
         *
         */

DB::table("lead_pipeline_stages")->truncate();
        $dataTables = [
            [
                'id' => 1,
                'code' => 'new',
                'name' => 'New',
                'probability' => 100,
                'sort_order' => 1,
                'lead_pipeline_id' => 1,
            ],
            [
                'id' => 2,
                'code' => 'follow-up',
                'name' => 'Follow Up',
                'probability' => 100,
                'sort_order' => 2,
                'lead_pipeline_id' => 1,
            ],
            [
                'id' => 3,
                'code' => 'prospect',
                'name' => 'Prospect',
                'probability' => 100,
                'sort_order' => 3,
                'lead_pipeline_id' => 1,
            ],
            [
                'id' => 4,
                'code' => 'negotiation',
                'name' => 'Negotiation',
                'probability' => 100,
                'sort_order' => 4,
                'lead_pipeline_id' => 1,
            ],
            [
                'id' => 5,
                'code' => 'won',
                'name' => 'Won',
                'probability' => 100,
                'sort_order' => 5,
                'lead_pipeline_id' => 1,
            ],
            [
                'id' => 6,
                'code' => 'lost',
                'name' => 'Lost',
                'probability' => 0,
                'sort_order' => 6,
                'lead_pipeline_id' => 1,
            ]
        ];
        
        DB::table("lead_pipeline_stages")->insert($dataTables);
    }
}
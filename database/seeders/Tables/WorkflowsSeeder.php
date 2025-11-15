<?php

namespace Database\Seeders\Tables;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class WorkflowsSeeder extends Seeder
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
        DB::table('workflows')->truncate();
        $dataTables = [
            [
                'id'             => 1,
                'name'           => 'Emails to participants after activity creation',
                'description'    => 'Emails to participants after activity creation',
                'entity_type'    => 'activities',
                'event'          => 'activity.create.after',
                'condition_type' => 'and',
                'conditions'     => '[{"value": ["call", "meeting", "lunch"], "operator": "{}", "attribute": "type", "attribute_type": "multiselect"}]',
                'actions'        => '[{"id": "send_email_to_participants", "value": "1"}]',
                'created_at'     => '2025-11-15 07:31:35',
                'updated_at'     => '2025-11-15 07:31:35',
            ],
            [
                'id'             => 2,
                'name'           => 'Emails to participants after activity updation',
                'description'    => 'Emails to participants after activity updation',
                'entity_type'    => 'activities',
                'event'          => 'activity.update.after',
                'condition_type' => 'and',
                'conditions'     => '[{"value": ["call", "meeting", "lunch"], "operator": "{}", "attribute": "type", "attribute_type": "multiselect"}]',
                'actions'        => '[{"id": "send_email_to_participants", "value": "2"}]',
                'created_at'     => '2025-11-15 07:31:35',
                'updated_at'     => '2025-11-15 07:31:35',
            ],
        ];

        DB::table('workflows')->insert($dataTables);
    }
}

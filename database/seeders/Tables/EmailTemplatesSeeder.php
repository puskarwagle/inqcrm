<?php

namespace Database\Seeders\Tables;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EmailTemplatesSeeder extends Seeder
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
        DB::table('email_templates')->truncate();
        $dataTables = [
            [
                'id'      => 1,
                'name'    => 'Activity created',
                'subject' => 'Activity created: {%activities.title%}',
                'content' => '<p style="font-size: 16px; color: #5e5e5e;">You have a new activity, please find the details bellow:</p>
                                <p><strong style="font-size: 16px;">Details</strong></p>
                                <table style="height: 97px; width: 952px;">
                                    <tbody>
                                        <tr>
                                            <td style="width: 116.953px; color: #546e7a; font-size: 16px;">Title</td>
                                            <td style="width: 770.047px; font-size: 16px;">{%activities.title%}</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 116.953px; color: #546e7a; font-size: 16px;">Type</td>
                                                <td style="width: 770.047px; font-size: 16px;">{%activities.type%}</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 116.953px; color: #546e7a; font-size: 16px;">Date</td>
                                            <td style="width: 770.047px; font-size: 16px;">{%activities.schedule_from%} to&nbsp;{%activities.schedule_to%}</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 116.953px; color: #546e7a; font-size: 16px; vertical-align: text-top;">Participants</td>
                                            <td style="width: 770.047px; font-size: 16px;">{%activities.participants%}</td>
                                        </tr>
                                    </tbody>
                                </table>',
                'created_at' => '2025-11-15 07:31:32',
                'updated_at' => '2025-11-15 07:31:32',
            ],
            [
                'id'      => 2,
                'name'    => 'Activity modified',
                'subject' => 'Activity modified: {%activities.title%}',
                'content' => '<p style="font-size: 16px; color: #5e5e5e;">You have a new activity modified, please find the details bellow:</p>
                                <p><strong style="font-size: 16px;">Details</strong></p>
                                <table style="height: 97px; width: 952px;">
                                    <tbody>
                                        <tr>
                                            <td style="width: 116.953px; color: #546e7a; font-size: 16px;">Title</td>
                                            <td style="width: 770.047px; font-size: 16px;">{%activities.title%}</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 116.953px; color: #546e7a; font-size: 16px;">Type</td>
                                            <td style="width: 770.047px; font-size: 16px;">{%activities.type%}</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 116.953px; color: #546e7a; font-size: 16px;">Date</td>
                                            <td style="width: 770.047px; font-size: 16px;">{%activities.schedule_from%} to&nbsp;{%activities.schedule_to%}</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 116.953px; color: #546e7a; font-size: 16px; vertical-align: text-top;">Participants</td>
                                            <td style="width: 770.047px; font-size: 16px;">{%activities.participants%}</td>
                                        </tr>
                                    </tbody>
                                </table>',
                'created_at' => '2025-11-15 07:31:32',
                'updated_at' => '2025-11-15 07:31:32',
            ],
        ];

        DB::table('email_templates')->insert($dataTables);
    }
}

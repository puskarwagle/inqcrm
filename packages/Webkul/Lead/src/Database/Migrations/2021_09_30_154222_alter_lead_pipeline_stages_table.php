<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $tablePrefix = DB::getTablePrefix();

        // Add columns only if they don't already exist (idempotent)
        if (! Schema::hasColumn('lead_pipeline_stages', 'code')) {
            Schema::table('lead_pipeline_stages', function (Blueprint $table) {
                $table->string('code')->after('id')->nullable();
            });
        }

        if (! Schema::hasColumn('lead_pipeline_stages', 'name')) {
            Schema::table('lead_pipeline_stages', function (Blueprint $table) {
                $table->string('name')->after('code')->nullable();
            });
        }

        // MySQL-compatible UPDATE with JOIN
        // Only run update if the referenced tables/columns exist
        if (Schema::hasTable('lead_pipeline_stages') && Schema::hasTable('lead_stages')) {
            DB::statement("
                    UPDATE {$tablePrefix}lead_pipeline_stages
                    JOIN {$tablePrefix}lead_stages ON {$tablePrefix}lead_pipeline_stages.lead_stage_id = {$tablePrefix}lead_stages.id
                    SET {$tablePrefix}lead_pipeline_stages.code = {$tablePrefix}lead_stages.code,
                        {$tablePrefix}lead_pipeline_stages.name = {$tablePrefix}lead_stages.name
                ");
        }

        // Drop foreign/column only if it exists
        if (Schema::hasColumn('lead_pipeline_stages', 'lead_stage_id')) {
            Schema::table('lead_pipeline_stages', function (Blueprint $table) use ($tablePrefix) {
                // dropForeign can fail if the constraint name does not exist; swallow exceptions
                try {
                    $table->dropForeign($tablePrefix.'lead_pipeline_stages_lead_stage_id_foreign');
                } catch (\Exception $e) {
                    // ignore
                }

                $table->dropColumn('lead_stage_id');
            });
        }

        // Create unique indexes only if they do not already exist
        $codeIndex = DB::select("SHOW INDEX FROM {$tablePrefix}lead_pipeline_stages WHERE Key_name = 'lead_pipeline_stages_code_lead_pipeline_id_unique'");
        if (count($codeIndex) === 0) {
            Schema::table('lead_pipeline_stages', function (Blueprint $table) {
                $table->unique(['code', 'lead_pipeline_id']);
            });
        }

        $nameIndex = DB::select("SHOW INDEX FROM {$tablePrefix}lead_pipeline_stages WHERE Key_name = 'lead_pipeline_stages_name_lead_pipeline_id_unique'");
        if (count($nameIndex) === 0) {
            Schema::table('lead_pipeline_stages', function (Blueprint $table) {
                $table->unique(['name', 'lead_pipeline_id']);
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('lead_pipeline_stages', function (Blueprint $table) {
            $table->dropColumn('code');
            $table->dropColumn('name');

            $table->integer('lead_stage_id')->unsigned();
            $table->foreign('lead_stage_id')->references('id')->on('lead_stages')->onDelete('cascade');

            $table->dropUnique(['lead_pipeline_stages_code_lead_pipeline_id_unique', 'lead_pipeline_stages_name_lead_pipeline_id_unique']);
        });
    }
};

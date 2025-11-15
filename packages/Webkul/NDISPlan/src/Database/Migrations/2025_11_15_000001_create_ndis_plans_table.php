<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('ndis_plans', function (Blueprint $table) {
            $table->id();
            $table->foreignId('participant_id')->constrained('participants')->onDelete('cascade');
            $table->string('ndis_number')->unique()->index();
            $table->date('plan_start_date');
            $table->date('plan_end_date');
            $table->string('plan_manager')->nullable();
            $table->float('total_budget');
            $table->float('used_budget')->default(0.0);
            $table->float('support_coordination_budget')->nullable();
            $table->float('support_coordination_used')->default(0.0);
            $table->unsignedBigInteger('plan_document_id')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
            $table->softDeletes();

            $table->index('participant_id');
            $table->index('plan_start_date');
            $table->index('plan_end_date');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ndis_plans');
    }
};

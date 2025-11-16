<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('participants', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('contact_id');
            $table->foreign('contact_id')->references('id')->on('persons')->onDelete('cascade');
            $table->unsignedInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->string('ndis_number')->unique()->index();
            $table->date('date_of_birth')->nullable();
            $table->text('address')->nullable();
            $table->string('emergency_contact')->nullable();
            $table->json('disabilities')->nullable();
            $table->json('preferences')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();

            $table->index(['contact_id', 'user_id']);
            $table->index('created_at');
        });

        Schema::create('participant_preferences', function (Blueprint $table) {
            $table->id();
            $table->foreignId('participant_id')->constrained('participants')->onDelete('cascade');
            $table->string('preference_key');
            $table->text('preference_value');
            $table->string('category')->index();
            $table->timestamps();

            $table->unique(['participant_id', 'preference_key']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('participant_preferences');
        Schema::dropIfExists('participants');
    }
};

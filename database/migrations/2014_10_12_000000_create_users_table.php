<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('country');
            $table->string('name');
            $table->string('mobile')->nullable();
            $table->string('username')->nullable();
            $table->string('ref_by')->nullable();
            $table->string('plan_id')->nullable();
            $table->string('task')->nullable();
            $table->string('balance')->nullable();
            $table->integer('depsit_time')->nullable();
            $table->integer('depsit_amount')->nullable();
            $table->integer('withdraw_amount')->nullable();
            $table->integer('nidfront')->nullable();
            $table->integer('nidback')->nullable();
            $table->string('address')->nullable();
            $table->string('email')->unique();
            $table->string('role')->default('reporter');
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('Bank_Name')->nullable();
            $table->string('Bank_account')->nullable();
            $table->string('withdrawpass')->nullable();
            $table->string('status')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};

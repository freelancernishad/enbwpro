<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWithdrawalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('withdrawals', function (Blueprint $table) {
            $table->id();
            $table->string('user_id')->nullable();
            $table->string('method')->nullable();
            $table->integer('amount')->nullable();
            $table->string('curency')->nullable();
            $table->string('rate')->nullable();
            $table->string('charge')->nullable();
            $table->string('trx')->nullable();
            $table->string('final_amount')->nullable();
            $table->string('after_charge')->nullable();
            $table->string('recieved_number')->nullable();
            $table->string('withdraw_info')->nullable();
            $table->string('status')->nullable();
            $table->text('admin_feedback')->nullable();
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
        Schema::dropIfExists('withdrawals');
    }
}

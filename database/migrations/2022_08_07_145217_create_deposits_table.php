<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDepositsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('deposits', function (Blueprint $table) {
            $table->id();
            $table->string('user_id')->nullable();
            $table->string('method')->nullable();
            $table->string('amount')->nullable();
            $table->string('screenshot')->nullable();
            $table->string('curency')->nullable();
            $table->string('rate')->nullable();
            $table->string('final_amount')->nullable();
            $table->text('detials')->nullable();
            $table->string('trx')->nullable();
            $table->string('sender')->nullable();
            $table->string('try')->nullable();
            $table->string('status')->nullable();
            $table->string('admin_feedback')->nullable();

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
        Schema::dropIfExists('deposits');
    }
}

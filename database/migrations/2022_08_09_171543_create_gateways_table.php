<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGatewaysTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gateways', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('currency')->nullable();
            $table->string('symbol')->nullable();
            $table->string('method_code')->nullable();
            $table->string('gateway_alias')->nullable();
            $table->string('min_amount')->nullable();
            $table->string('max_amount')->nullable();
            $table->string('percent_charge')->nullable();
            $table->string('fixed_charge')->nullable();
            $table->string('processtime')->nullable();
            $table->string('rate')->nullable();
            $table->string('image')->nullable();
            $table->string('gateway_parameter')->nullable();
            $table->string('number')->nullable();
            $table->string('status')->nullable();
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
        Schema::dropIfExists('gateways');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('equipo_partido', function (Blueprint $table) {
            $table->unsignedBigInteger('equipoid');
            $table->unsignedBigInteger('partidoid');
            $table->primary(['equipoid','partidoid']);
            $table->boolean('equipo_ganador');
            $table->foreign('equipoid')->references('id')->on('equipos');
            $table->foreign('partidoid')->references('id')->on('partidos');
            //$table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('equipo_partido');
    }
};

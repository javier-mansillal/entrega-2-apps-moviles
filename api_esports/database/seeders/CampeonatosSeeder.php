<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CampeonatosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('campeonatos')->insert(
            [
                ['nombre'=>'Liga League of Legends','reglas'=>'Lorem Ipsum.','premio'=>10000,'fecha_inicio'=>'2024-10-20'],
                ['nombre'=>'Counter Strike Mundial','reglas'=>'Lorem','premio'=>1000000,'fecha_inicio'=>'2024-10-23'],
                ['nombre'=>'Valorant Mundial','reglas'=>'No hay reglas.','premio'=>50000,'fecha_inicio'=>'2024-12-05'],
                ['nombre'=>'Dota 2 Final','reglas'=>'','premio'=>130000,'fecha_inicio'=>'2024-10-23'],
                ['nombre'=>'Overwatch 2 World Cup','reglas'=>'Hola','premio'=>200,'fecha_inicio'=>'2024-10-21'],
            ]
        );
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class JugadoresSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('jugadores')->insert(
            [
                ['nombre'=>'Juanito','edad'=> 20,'nacionalidad'=>'Jamaicano', 'equipoid'=> 1],
            ]
        );
    }
}

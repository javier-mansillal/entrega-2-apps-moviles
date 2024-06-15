<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PartidosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('partidos')->insert(
            [
                ['fecha'=>'2025-02-25 15:34:48', 'jugado'=> false, 'campeonatoid'=> 1],
            ]
        );
    }
}


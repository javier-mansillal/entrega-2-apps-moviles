<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CampeonatosController;
use App\Http\Controllers\JugadoresController;
use App\Http\Controllers\EquiposController;
use App\Http\Controllers\PartidosController;
//Route::get('/user', function (Request $request) {
//    return $request->user();
//})->middleware('auth:sanctum');

Route::resource('/campeonatos', CampeonatosController::class);
Route::resource('/equipos', EquiposController::class);
Route::resource('/jugadores', JugadoresController::class);
Route::resource('/partidos', PartidosController::class);
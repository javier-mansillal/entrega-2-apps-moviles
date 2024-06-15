<?php

namespace App\Http\Controllers;

use App\Models\Jugadores;
use Illuminate\Http\Request;

class JugadoresController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $jugadores = Jugadores::all();
        return $jugadores;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(int $equipoId)
    {
        $jugadores = Jugadores::where('equipoId', $equipoId)->get();

        if ($jugadores->isEmpty()) {
            return response()->json(['message' => 'No jugadores found for equipo ID ' . $equipoId], 404);
        }
        return response()->json($jugadores);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Jugadores $jugadores)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Jugadores $jugadores)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Jugadores $jugadores)
    {
        //
    }
}

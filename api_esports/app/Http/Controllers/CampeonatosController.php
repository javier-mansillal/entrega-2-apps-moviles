<?php

namespace App\Http\Controllers;

use App\Models\Campeonatos;
use Illuminate\Http\Request;

class CampeonatosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $campeonatos = Campeonatos::all();
        return $campeonatos;
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
    public function show(Campeonatos $campeonatos)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Campeonatos $campeonatos)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Campeonatos $campeonatos)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Campeonatos $campeonatos)
    {
        
    }
}

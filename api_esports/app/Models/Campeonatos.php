<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Campeonatos extends Model
{
    use HasFactory;
    protected $table = "campeonatos";
    public $timestamps = false;
}

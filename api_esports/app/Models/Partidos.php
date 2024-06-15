<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Partidos extends Model
{
    use HasFactory;
    protected $table = 'partidos';
    public $timestamps = false;

    public function partido():BelongsTo{
        return $this->belongsTo(Campeonato::class);
    }
}

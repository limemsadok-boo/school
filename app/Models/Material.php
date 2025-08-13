<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Material extends Model
{
/**
 * The attributes that are mass assignable.
 *
 * @var list<string>
 */
protected $fillable = [
    'name',
    'oral_note',
    'written_note',
    'total_note',
];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentStatus extends Model
{
    use HasFactory;

    protected $fillable = ['status'];

    public function behaviors()
    {
        return $this->hasMany(Behavior::class, 'status_id');
    }
}


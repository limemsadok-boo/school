<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    
    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'classe_id',
        'group_id',
        'health',
    ];

    public function classe()
    {
        return $this->belongsTo(Classe::class);
    }

    public function group()
    {
        return $this->belongsTo(Group::class);
    }

    public function behaviors()
    {
        return $this->hasMany(Behavior::class);
    }
}

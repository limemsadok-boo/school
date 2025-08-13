<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ClasseTeacher extends Model
{
    protected $table = 'classe_teacher';

    protected $fillable = [
        'teacher_id',
        'classe_id',
    ];

    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }

    public function classe()
    {
        return $this->belongsTo(Classe::class);
    }
}



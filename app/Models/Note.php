<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Note extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'material_id',
        'teacher_id',
        'oral_note',
        'written_note',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function material()
    {
        return $this->belongsTo(Material::class);
    }

    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }
}

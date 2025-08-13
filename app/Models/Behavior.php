<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Behavior extends Model
{
    protected $fillable = [
        'student_id',
        'classe_id',
        'group_id',
        'teacher_id',
        'material_id',
        'status_id',
        'description',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function group()
    {
        return $this->belongsTo(Group::class);
    }

    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }

    public function classe()
    {
        return $this->belongsTo(Classe::class);
    }

    public function material()
    {
        return $this->belongsTo(Material::class);
    }

    public function status()
    {
        return $this->belongsTo(StudentStatus::class, 'status_id');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Seance extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'student_id',
        'classe_id',
        'teacher_id',
        'material_id',
        'time_session_id',
        'absence_date',
    ];
    protected $casts = [
    'absence_date' => 'datetime',
    ];

    public function getAbsenceDateOnlyAttribute()
    {
        return $this->absence_date?->format('Y-m-d');
    }

    public function getAbsenceTimeOnlyAttribute()
    {
        return $this->absence_date?->format('H:i:s');
    }
    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function classe()
    {
        return $this->belongsTo(Classe::class);
    }

    public function teacher()
    {
        return $this->belongsTo(Teacher::class);
    }

    public function material()
    {
        return $this->belongsTo(Material::class);
    }

    public function timeSession()
    {
        return $this->belongsTo(Session::class);
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;

use Illuminate\Notifications\Notifiable;

class Teacher extends Authenticatable
{
    use Notifiable;
    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */

    protected $fillable = [
        'name', 'email', 'password', 'tel', 'material_id',
    ];

    protected $hidden = ['password', 'remember_token'];

    public function classes()
    {
        return $this->belongsToMany(Classe::class);
    }

    public function material()
    {
        return $this->belongsTo(Material::class);

    }

    public function canAccessFilament(): bool
    {
        return true;
    }
}


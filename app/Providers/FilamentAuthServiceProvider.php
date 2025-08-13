<?php

namespace App\Providers;

use Filament\Facades\Filament;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\ServiceProvider;
use App\Models\User;
use App\Models\Teacher;

class FilamentAuthServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        \Log::debug('FilamentAuthServiceProvider loaded');

        Filament::auth(function (array $credentials) {
            \Log::debug('FilamentAuthServiceProvider auuuuuuuuth');
            // Try User
            $user = User::where('email', $credentials['email'])->first();
            \Log::debug('user : '.$user);
            if ($user && Hash::check($credentials['password'], $user->password)) {
                return $user;
            }

            // Try Teacher
            $teacher = Teacher::where('email', $credentials['email'])->first();
            
            \Log::debug('teacher : '.$teacher);
            if ($teacher && Hash::check($credentials['password'], $teacher->password)) {
                return $teacher;
            }

            return null;
        });
    }
}


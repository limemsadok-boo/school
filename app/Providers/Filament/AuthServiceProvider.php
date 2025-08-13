<?php
use Filament\Facades\Filament;
use Illuminate\Support\Facades\Auth;

public function boot()
{
    Filament::auth(function (array $credentials): ?\Illuminate\Contracts\Auth\Authenticatable {
        // Try default user first
        if (Auth::guard('web')->attempt($credentials)) {
            return Auth::guard('web')->user();
        }

        // Then try teacher
        if (Auth::guard('teacher')->attempt($credentials)) {
            return Auth::guard('teacher')->user();
        }

        return null;
    });
}

<?php

namespace App\Filament\Teacher\Resources\AbscenceResource\Pages;

use App\Filament\Teacher\Resources\AbscenceResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListAbscences extends ListRecords
{
    protected static string $resource = AbscenceResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}

<?php

namespace App\Filament\Teacher\Resources\AbscenceResource\Pages;

use App\Filament\Teacher\Resources\AbscenceResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditAbscence extends EditRecord
{
    protected static string $resource = AbscenceResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}

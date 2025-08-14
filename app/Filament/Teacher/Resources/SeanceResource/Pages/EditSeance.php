<?php

namespace App\Filament\Teacher\Resources\SeanceResource\Pages;

use App\Filament\Teacher\Resources\SeanceResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSeance extends EditRecord
{
    protected static string $resource = SeanceResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}

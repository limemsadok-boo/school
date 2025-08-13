<?php

namespace App\Filament\Teacher\Resources\StudentNoteResource\Pages;

use App\Filament\Teacher\Resources\StudentNoteResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditStudentNote extends EditRecord
{
    protected static string $resource = StudentNoteResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}

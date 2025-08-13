<?php

namespace App\Filament\Teacher\Resources\Teacher\StudentClasseResource\Pages;

use App\Filament\Teacher\Resources\Teacher\StudentClasseResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditStudentClasse extends EditRecord
{
    protected static string $resource = StudentClasseResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}

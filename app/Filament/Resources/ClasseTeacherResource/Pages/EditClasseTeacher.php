<?php

namespace App\Filament\Resources\ClasseTeacherResource\Pages;

use App\Filament\Resources\ClasseTeacherResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditClasseTeacher extends EditRecord
{
    protected static string $resource = ClasseTeacherResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}

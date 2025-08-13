<?php

namespace App\Filament\Resources\ClasseTeacherResource\Pages;

use App\Filament\Resources\ClasseTeacherResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListClasseTeachers extends ListRecords
{
    protected static string $resource = ClasseTeacherResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}

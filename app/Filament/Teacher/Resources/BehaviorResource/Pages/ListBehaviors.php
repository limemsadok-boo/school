<?php

namespace App\Filament\Teacher\Resources\BehaviorResource\Pages;

use App\Filament\Teacher\Resources\BehaviorResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBehaviors extends ListRecords
{
    protected static string $resource = BehaviorResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}

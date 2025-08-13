<?php

namespace App\Filament\Teacher\Resources\BehaviorResource\Pages;

use App\Filament\Teacher\Resources\BehaviorResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditBehavior extends EditRecord
{
    protected static string $resource = BehaviorResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}

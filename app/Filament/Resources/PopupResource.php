<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PopupResource\Pages;
use App\Filament\Resources\PopupResource\RelationManagers;
use App\Models\Popup;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Actions\Action;
use Filament\Tables\Columns\ViewColumn;

class PopupResource extends Resource
{
    protected static ?string $model = Popup::class;

    protected static ?int $navigationSort = 4;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('address')
                    ->label(__('popup.address'))
                    ->maxLength(255)
                    ->default(null),
                Forms\Components\Textarea::make('description')
                    ->label(__('popup.description'))
                    ->maxLength(255)
                    ->default(null),
                Forms\Components\Toggle::make('is_active')
                    ->label(__('popup.is_active'))
                    ->required(),
                Forms\Components\FileUpload::make('image')
                    ->label(__('popup.file'))
                    ->acceptedFileTypes(['image/jpeg', 'image/png', 'image/webp', 'image/jpg'])
                    ->image(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label(__('popup.code')),
                Tables\Columns\TextColumn::make('address')
                    ->label(__('popup.address'))
                    ->searchable(),
                
                Tables\Columns\IconColumn::make('is_active')
                    ->label(__('popup.is_active'))
                    ->boolean(),
                Tables\Columns\ImageColumn::make('image')
                    ->label(__('popup.file'))
                    ->view('components.columns.image-modal')
                    ->viewData(fn ($record) => ['record' => $record]), 
            ])
            ->recordUrl(null)
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->headerActions([
            Action::make('export_pdf')
                ->label('Export PDF')
                ->icon('heroicon-o-printer')
                ->action(fn () => redirect(route('popups.export-pdf'))),
            
                   
        ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPopups::route('/'),
            'create' => Pages\CreatePopup::route('/create'),
            'edit' => Pages\EditPopup::route('/{record}/edit'),
        ];
    }

    public static function getModelLabel(): string
    {
        return __('popup.popup');
    }

    public static function getPluralModelLabel(): string
    {
        return __('popup.popups');
    }
}

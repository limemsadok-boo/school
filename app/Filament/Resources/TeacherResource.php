<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TeacherResource\Pages;
use App\Filament\Resources\TeacherResource\RelationManagers;
use App\Models\Teacher;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Filters\SelectFilter;

class TeacherResource extends Resource
{
    protected static ?string $model = Teacher::class;

    protected static ?int $navigationSort = 1;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                ->label(__('teacher.name'))
                ->required()
                ->maxLength(255),
                
                Forms\Components\TextInput::make('email')
                ->label(__('teacher.email'))
                ->email()
                ->required()
                ->unique(ignoreRecord: true),

                Forms\Components\TextInput::make('password')
                ->label(__('teacher.password'))
                ->password()
                ->dehydrateStateUsing(fn ($state) => !empty($state) ? bcrypt($state) : null)
                ->required(fn (string $context): bool => $context === 'create')
                ->dehydrated(fn ($state) => filled($state))
                ->maxLength(255),

                Forms\Components\TextInput::make('tel')
                ->label(__('teacher.tel'))
                ->maxLength(25),
                
                Forms\Components\Select::make('material_id')
                    ->label(__('teacher.material'))
                    ->relationship('material', 'name') 
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                ->label(__('teacher.name'))
                ->searchable(),

                Tables\Columns\TextColumn::make('email')
                ->label(__('teacher.email'))
                ->searchable(),

                Tables\Columns\TextColumn::make('tel')
                ->label(__('teacher.tel'))
                ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                ->dateTime()
                ->sortable(),
            ])
            ->filters([
                SelectFilter::make('material_id')
                ->label(__('teacher.material'))
                ->relationship('material', 'name'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make('delete')
                ->requiresConfirmation()
                ->action(fn (Teacher $record) => $record->delete()),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
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
            'index' => Pages\ListTeachers::route('/'),
            'create' => Pages\CreateTeacher::route('/create'),
            'edit' => Pages\EditTeacher::route('/{record}/edit'),
        ];
    }

    public static function getModelLabel(): string
    {
        return __('teacher.teacher'); // "User" singular
    }

    public static function getPluralModelLabel(): string
    {
        return __('teacher.teachers'); // "Users" plural
    }

}

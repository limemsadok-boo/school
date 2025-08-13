<?php

namespace App\Filament\Resources;

use App\Filament\Resources\StudentResource\Pages;
use App\Filament\Resources\StudentResource\RelationManagers;
use App\Models\Student;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Filters\SelectFilter;


class StudentResource extends Resource
{
    protected static ?string $model = Student::class;

    protected static ?int $navigationSort = 4;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->label(__('student.name')),

                Forms\Components\Select::make('classe_id')
                    ->label(__('student.classe'))
                    ->relationship('classe', 'name') 
                    ->required(),

                Forms\Components\Select::make('group_id')
                    ->required()
                    ->relationship('group', 'name') 
                    ->label(__('student.group')),

                Forms\Components\TextInput::make('health')
                    ->label(__('student.health')),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->label(__('student.name'))->searchable(),
                Tables\Columns\TextColumn::make('classe.name')->label(__('student.classe')),
                Tables\Columns\TextColumn::make('group.name')->label(__('student.group')),
                Tables\Columns\TextColumn::make('health')->label(__('student.health')),
            ])
            ->filters([
                SelectFilter::make('classe_id')
                ->label(__('student.classe'))
                ->relationship('classe', 'name')
                ->multiple(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
            'index' => Pages\ListStudents::route('/'),
            'create' => Pages\CreateStudent::route('/create'),
            'edit' => Pages\EditStudent::route('/{record}/edit'),
        ];
    }

        public static function getModelLabel(): string
    {
        return __('student.student');
    }

    public static function getPluralModelLabel(): string
    {
        return __('student.students');
    }
}

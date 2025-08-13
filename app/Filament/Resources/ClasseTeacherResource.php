<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ClasseTeacherResource\Pages;
use App\Models\ClasseTeacher;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Validation\Rule;
use App\Rules\UniqueTeacherClasse;


class ClasseTeacherResource extends Resource
{
    protected static ?string $model = ClasseTeacher::class;

    protected static ?int $navigationSort = 5;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('teacher_id')
                    ->label(__('classe_teacher.teacher'))
                    ->relationship('teacher', 'name')
                    ->required(),

                Forms\Components\Select::make('classe_id')
                    ->label(__('classe_teacher.classe'))
                    ->relationship('classe', 'name')
                    ->required()
                    ->rules([
                        function (Get $get, ?Model $record) {
                            return new UniqueTeacherClasse($get('teacher_id'), optional($record)->id);
                        }
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('teacher.name')->label(__('classe_teacher.teacher')),
                Tables\Columns\TextColumn::make('classe.name')->label(__('classe_teacher.classe')),
            ])
            ->filters([])
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
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListClasseTeachers::route('/'),
            'create' => Pages\CreateClasseTeacher::route('/create'),
            'edit' => Pages\EditClasseTeacher::route('/{record}/edit'),
        ];
    }

    public static function getModelLabel(): string
    {
        return __('classe_teacher.classe_teacher');
    }

    public static function getPluralModelLabel(): string
    {
        return __('classe_teacher.classe_teachers');
    }
}

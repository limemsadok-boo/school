<?php

namespace App\Filament\Teacher\Resources;

use App\Filament\Teacher\Resources\StudentResource\Pages;
use App\Filament\Teacher\Resources\StudentResource\RelationManagers;
use App\Models\Student;
use App\Models\Classe;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;
use Filament\Tables\Filters\SelectFilter;

class StudentResource extends Resource
{
    protected static ?string $model = Student::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->label(__('student.name'))->searchable(),
                Tables\Columns\TextColumn::make('classe.name')->label(__('student.classe')),
                //Tables\Columns\TextColumn::make('group.name')->label(__('student.group')),
                Tables\Columns\TextColumn::make('health')->label(__('student.health')),
            ])
            ->filters([
                SelectFilter::make('classe_id')
                    ->label(__('student.classe'))
                    ->options(function () {
                        $teacher = Auth::user();

                        return Classe::whereIn('id', function ($query) use ($teacher) {
                                $query->select('classe_id')
                                    ->from('classe_teacher')
                                    ->where('teacher_id', $teacher->id);
                            })
                            ->pluck('name', 'id');
                    })
                    ->searchable(),
            ])
            ->actions([
                //Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                //Tables\Actions\BulkActionGroup::make([
                    //Tables\Actions\DeleteBulkAction::make(),
                //]),
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
            //'create' => Pages\CreateStudent::route('/create'),
            //'edit' => Pages\EditStudent::route('/{record}/edit'),
        ];
    }

    public static function canCreate(): bool
    {
        return false;
    }

    public static function getEloquentQuery(): Builder
    {
        $teacher = Auth::user(); // Logged-in teacher

        return parent::getEloquentQuery()
        ->whereNotNull('health')
        ->whereIn('classe_id', function ($query) use ($teacher) {
            $query->select('classe_id')
                ->from('classe_teacher')
                ->where('teacher_id', $teacher->id);
        })
        ->distinct();
    }

    public static function getModelLabel(): string
    {
        return __('student.health_student');
    }

    public static function getPluralModelLabel(): string
    {
        return __('student.health_student');
    }
}

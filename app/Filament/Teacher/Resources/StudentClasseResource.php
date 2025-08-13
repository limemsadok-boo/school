<?php

namespace App\Filament\Teacher\Resources;

use App\Filament\Teacher\Resources\StudentClasseResource\Pages;
use App\Models\Classe;
use App\Models\Student;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class StudentClasseResource extends Resource
{
    protected static ?string $model = Student::class;
    //protected static ?string $navigationLabel = 'Students by Class'; // Menu label
    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    //protected static ?string $navigationGroup = 'Teacher Panel'; // Optional grouping
    protected static bool $shouldRegisterNavigation = true;

    public static function table(Table $table): Table
    {
        $teacherId = auth()->id();

        $teacherClasses = Classe::whereHas('teachers', fn($q) => $q->where('teacher_id', $teacherId))->get();

        $defaultClasseId = $teacherClasses->first()?->id;

        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->label(__('student.name'))->searchable(),
                Tables\Columns\TextColumn::make('classe.name')->label(__('student.classe')),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('classe_id')
                    ->label('Class')
                    ->options($teacherClasses->pluck('name', 'id'))
                    ->default($defaultClasseId),
            ])
            ->actions([])   // No edit, delete, create
            ->bulkActions([]); // No bulk actions
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListStudentClasses::route('/'),
        ];
    }

    
    public static function getModelLabel(): string
    {
        return __('student.student_classe');
    }

    public static function getPluralModelLabel(): string
    {
        return __('student.student_classe');
    }
}

<?php

namespace App\Filament\Teacher\Resources;

use App\Filament\Teacher\Resources\StudentNoteResource\Pages;
use App\Models\Classe;
use App\Models\Student;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Actions\Action;
use Filament\Forms;

class StudentNoteResource extends Resource
{
    protected static ?string $model = Student::class; // Base the resource on Student
    //protected static ?string $navigationLabel = 'Student Notes';
    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-list';
    //protected static ?string $navigationGroup = 'Teacher Panel';
    protected static bool $shouldRegisterNavigation = true;

    public static function table(Tables\Table $table): Tables\Table
    {
        $teacherId = auth()->id();
        $teacher = auth()->user();
        $teacherClasses = Classe::whereHas('teachers', fn($q) => $q->where('teacher_id', $teacherId))->get();
        $defaultClasseId = $teacherClasses->first()?->id;

        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->label(__('student.name')),
                Tables\Columns\TextColumn::make('oral_note')
                    ->label(__('material.oral_note'))
                    ->getStateUsing(fn($record) => optional($record->notes()->where('material_id', $teacher->material_id)->first())->oral_note ?? null),
                Tables\Columns\TextColumn::make('written_note')
                    ->label(__('material.written_note'))
                    ->getStateUsing(fn($record) => optional($record->notes()->where('material_id', $teacher->material_id)->first())->written_note ?? null),
                Tables\Columns\TextColumn::make('total_note')
                    ->label(__('material.total_note'))
                    ->getStateUsing(fn($record) => 
                        (optional($record->notes()->where('material_id', $teacher->material_id)->first())->oral_note ?? 0) +
                        (optional($record->notes()->where('material_id', $teacher->material_id)->first())->written_note ?? 0)
                    ),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('classe_id')
                    ->label(__('student.classe'))
                    ->options($teacherClasses->pluck('name', 'id'))
                    ->default($defaultClasseId)
                    ->query(function ($query, $data) {
                        if (!empty($data['value'])) {
                            $query->where('classe_id', $data['value']);
                        }
                    }),
            ])
            ->actions([
                Action::make('addNote')
                    ->icon('heroicon-o-pencil-square')
                    ->form(function ($record) use ($teacher) {
                        $material = $teacher->material;

                        return [
                            Forms\Components\TextInput::make('student_name')
                                ->label(__('student.name'))
                                ->default($record->name)
                                ->disabled(),

                            Forms\Components\TextInput::make('oral_note')
                            ->label(__('material.oral_note'))
                            ->numeric()
                            ->required()
                            ->rules([
                                'lte:' . ($material?->oral_note ?? 100), // less than or equal to max in material
                            ]),

                        Forms\Components\TextInput::make('written_note')
                            ->label(__('material.written_note'))
                            ->numeric()
                            ->required()
                            ->rules([
                                'lte:' . ($material?->written_note ?? 100),
                            ]),
                        ];
                    })
                    ->action(function ($record, array $data) use ($teacher) {
                        $material = $teacher->material;

                        // Create or update the note for this student and material
                        $note = $record->notes()->updateOrCreate(
                            ['material_id' => $material->id],
                            [
                                'teacher_id'  => $teacher->id,
                                'oral_note'   => $data['oral_note'],
                                'written_note'=> $data['written_note'],
                            ]
                        );
                    })
                    ->modalHeading('Add / Edit Note')
                    ->modalButton('Save')
                    ->color('success'),
            ])
            ->bulkActions([]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListStudentNotes::route('/'),
        ];
    }

    public static function getModelLabel(): string
    {
        return __('student.student_note');
    }

    public static function getPluralModelLabel(): string
    {
        return __('student.student_note');
    }
}

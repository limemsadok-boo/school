<?php

namespace App\Filament\Teacher\Resources\StudentNoteResource\Pages;

use App\Filament\Teacher\Resources\StudentNoteResource;
use Filament\Resources\Pages\ListRecords;
use App\Models\Student;

class ListStudentNotes extends ListRecords
{
    protected static string $resource = StudentNoteResource::class;

    protected function getTableQuery(): ?\Illuminate\Database\Eloquent\Builder
    {
        $teacherId = auth()->id();

        // Show all students in teacher's classes, even if they have no note
        return Student::query()
            ->whereHas('classe.teachers', fn($q) => $q->where('teacher_id', $teacherId))
            ->with('notes'); // load notes relation if exists
    }
}

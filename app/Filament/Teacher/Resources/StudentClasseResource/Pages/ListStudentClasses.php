<?php

namespace App\Filament\Teacher\Resources\StudentClasseResource\Pages;

use App\Filament\Teacher\Resources\StudentClasseResource;
use Filament\Resources\Pages\ListRecords;
use App\Models\Student;

class ListStudentClasses extends ListRecords
{
    protected static string $resource = StudentClasseResource::class;

    protected function getTableQuery(): ?\Illuminate\Database\Eloquent\Builder
    {
        $teacherId = auth()->id();

        return Student::query()
            ->whereIn('classe_id', function ($query) use ($teacherId) {
                $query->select('classe_id')
                    ->from('classe_teacher')
                    ->where('teacher_id', $teacherId);
            });
    }

}

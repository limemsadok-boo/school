<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\DB;

class UniqueTeacherClasse implements Rule
{
    protected $teacherId;
    protected $recordId;

    public function __construct($teacherId, $recordId = null)
    {
        $this->teacherId = $teacherId;
        $this->recordId = $recordId;
    }

    public function passes($attribute, $value): bool
    {
        return !DB::table('classe_teacher')
            ->where('teacher_id', $this->teacherId)
            ->where('classe_id', $value)
            ->when($this->recordId, fn ($q) => $q->where('id', '!=', $this->recordId))
            ->exists();
    }

    public function message(): string
    {
        return __('teacher.msg_already_assigned');
    }
}


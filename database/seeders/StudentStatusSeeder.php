<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\StudentStatus;

class StudentStatusSeeder extends Seeder
{
    public function run(): void
    {
        $statuses = ['عام', 'ثرثار', 'مشاغب'];

        foreach ($statuses as $status) {
            StudentStatus::create(['status' => $status]);
        }
    }
}


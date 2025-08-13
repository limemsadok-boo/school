<?php

namespace App\Filament\Teacher\Resources;

use App\Filament\Teacher\Resources\BehaviorResource\Pages;
use App\Models\Student;
use App\Models\Classe;
use App\Models\Behavior;
use App\Models\StudentStatus;
use Filament\Forms;
use Filament\Resources\Resource;
use Filament\Tables;
use Illuminate\Database\Eloquent\Builder;
use Filament\Facades\Filament;
use Filament\Tables\Actions\Action;

class BehaviorResource extends Resource
{
    protected static ?string $model = Student::class;
    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';


    public static function form(Forms\Form $form): Forms\Form
    {
        return $form->schema([
                Forms\Components\Select::make('student_id')
                    ->label('Student')
                    ->options(function () {
                        $teacherId = auth()->id();
                        // Only students from classes assigned to teacher
                        return Student::whereIn('classe_id', function ($query) use ($teacherId) {
                            $query->select('classe_id')
                                  ->from('classe_teacher')
                                  ->where('teacher_id', $teacherId);
                        })->pluck('name', 'id');
                    })
                    ->searchable()
                    ->required(),

                Forms\Components\Select::make('status_id')
                    ->label('Status')
                    ->options(StudentStatus::pluck('status', 'id'))
                    ->required(),

                Forms\Components\Textarea::make('description')
                    ->label('Description')
                    ->maxLength(500),
            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->label('Student')->searchable(),
                Tables\Columns\TextColumn::make('classe.name')->label('Class'),
                Tables\Columns\TextColumn::make('normal_count')->label('عام'),
                Tables\Columns\TextColumn::make('talks_count')->label('ثرثار'),
                Tables\Columns\TextColumn::make('scream_count')->label('مشاغب'),
                Tables\Columns\TextColumn::make('total_behaviors')->label('Total'),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('classe')
                    ->label('Class')
                    ->options(function () {
                        $teacherId = Filament::auth()->user()->id;
                        return Classe::whereHas('teachers', fn ($q) => $q->where('teacher_id', $teacherId))
                            ->pluck('name', 'id');
                    })
                    ->query(function (Builder $query, array $data) {
                        if (!empty($data['value'])) {
                            $query->where('classe_id', $data['value']);
                        }
                    }),
            ])
            ->actions([
                Action::make('addBehavior')
                ->label('Add Behavior')
                ->icon('heroicon-o-plus')
                ->form(function ($record) {
                    return [
                        Forms\Components\TextInput::make('student_name')
                        ->label('Student')
                        ->default($record->name)
                        ->disabled(), // just display the name, not editable

                        Forms\Components\Select::make('status_id')
                            ->label('Status')
                            ->options(StudentStatus::pluck('status', 'id'))
                            ->required(),

                        Forms\Components\Textarea::make('description')
                            ->label('Description')
                            ->maxLength(500),
                    ];
                })
                ->action(function ($record, array $data) {
                    Behavior::create([
                        'student_id'  => $record->id,
                        'classe_id'   => $record->classe_id,
                        'group_id'    => $record->group_id,
                        'teacher_id'  => auth()->id(),
                        'material_id' => auth()->user()->material_id,
                        'status_id'   => $data['status_id'],
                        'description' => $data['description'],
                    ]);
                })
                ->modalHeading('Add Behavior')
                ->modalButton('Save Behavior')
                ->color('success'),
            ])
            ->bulkActions([]);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListBehaviors::route('/'),
        ];
    }

    public static function canCreate(): bool
    {
        return false;
    }

    public static function getEloquentQuery(): Builder
    {
        $teacherId = Filament::auth()->user()->id;

        return Student::query()
            ->whereHas('classe.teachers', fn ($q) => $q->where('teacher_id', $teacherId))
            ->withCount([
                'behaviors as normal_count' => fn ($q) =>
                    $q->whereHas('status', fn ($sq) => $sq->where('status', 'عام')),
                'behaviors as talks_count' => fn ($q) =>
                    $q->whereHas('status', fn ($sq) => $sq->where('status', 'ثرثار')),
                'behaviors as scream_count' => fn ($q) =>
                    $q->whereHas('status', fn ($sq) => $sq->where('status', 'مشاغب')),
                'behaviors as total_behaviors',
            ]);
    }

    public static function getModelLabel(): string
    {
        return __('behavior.behavior');
    }

    public static function getPluralModelLabel(): string
    {
        return __('behavior.behaviors');
    }

}

<?php

namespace App\Filament\Teacher\Resources;

use App\Filament\Teacher\Resources\SeanceResource\Pages;
use App\Filament\Teacher\Resources\SeanceResource\RelationManagers;
use App\Models\Seance;
use App\Models\Classe;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Enums\FiltersLayout;


class SeanceResource extends Resource
{
    protected static ?string $model = Seance::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                
            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        $teacherId = auth()->id();

        $teacherClasses = Classe::whereHas('teachers', fn($q) => $q->where('teacher_id', $teacherId))->get();

        $defaultClasseId = $teacherClasses->first()?->id;
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('student.name')
                    ->label(__('seance.student_name'))
                    ->searchable(),

                Tables\Columns\TextColumn::make('teacher.name')
                    ->label(__('seance.teacher_name')),


                Tables\Columns\TextColumn::make('timeSession.id')
                    ->label(__('seance.session')),

                Tables\Columns\BadgeColumn::make('absence_status')
                ->label(__('seance.status'))
                ->getStateUsing(fn () => __('seance.status_abscent'))
                ->color('danger'),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('classe_id')
                    ->label(__('seance.classe'))
                    ->options($teacherClasses->pluck('name', 'id'))
                    ->default($defaultClasseId),
                    
            ], layout: FiltersLayout::AboveContent)
            ->defaultSort('absence_date', 'asc');
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
            'index' => Pages\ListSeances::route('/'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        $teacherId = auth()->id();

        return parent::getEloquentQuery()
            ->where('teacher_id', $teacherId)
            ->whereDate('absence_date', now()->toDateString());
    }

    public static function getModelLabel(): string
    {
        return __('seance.seance');
    }

    public static function getPluralModelLabel(): string
    {
        return __('seance.seances');
    }
}

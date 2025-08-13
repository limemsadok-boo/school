<?php

use Illuminate\Support\Facades\Route;
use App\Models\Popup;
use Barryvdh\DomPDF\Facade\Pdf;
Route::get('/popups/export-pdf', function () {
    $popups = popup::all();

    $pdf = Pdf::loadView('pdf.popups', compact('popups'));

    return $pdf->download('popups-list.pdf');
})->name('popups.export-pdf');

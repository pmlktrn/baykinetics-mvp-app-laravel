<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BioTrackAuthController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/biotrack/authorize', [BioTrackAuthController::class, 'redirect'])->name('biotrack.redirect');
Route::get('/biotrack/callback', [BioTrackAuthController::class, 'callback'])->name('biotrack.callback');

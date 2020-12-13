<?php

use App\Http\Controllers\TasksController;
use Illuminate\Http\Request;

Route::get('/', function () {
    $threads = App\Thread::paginate(15);
    return view('welcome', compact('threads'));
});
Auth::routes();
Route::get('/calendar/{id}', 'TasksController@showcalendar')->name('cal');
Route::post('/dashboard/mail', 'TasksController@sendmail')->name('sendmail');
Route::post(
    '/upload',
    function (Request $request) {
        $request->image->store('images','public');
        return redirect()->back()->withMessage("Įkėlta nuotrauka");

    }
);
Route::get(
    '/viewimages',
    function () {
        return view('images');
    }
)->name("images");
Route::any('/showhalls', 'TasksController@showhalls')->name('halls');
Route::resource('/thread', 'ThreadController');
Route::get('/showalltasks', 'TasksController@showall')->name('allt');
Route::get('/dashboard', 'TasksController@dashboard')->name('dashb');
Route::get('/delete/{id}', 'TasksController@destroy')->name('delete');
Route::resource('comment', 'CommentController', ['only' => ['update', 'destroy']]);
Route::resource('tasks', 'TasksController');
Route::post('comment/create/{thread}', 'CommentController@addThreadComment')->name('threadcomment.store');
Route::get('/user/profile/{user}', 'UserProfileController@index')->name('user_profile')->middleware('auth');

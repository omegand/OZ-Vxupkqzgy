<?php
use App\Http\Controllers\TasksController;
Route::get('/', function () {
    $threads=App\Thread::paginate(15);
    return view('welcome',compact('threads'));
});
Auth::routes();
Route::resource('/thread','ThreadController');
Route::get('/showalltasks','TasksController@showall')->name('allt');
Route::resource('comment','CommentController',['only'=>['update','destroy']]);
Route::resource('tasks', 'TasksController');
Route::post('comment/create/{thread}','CommentController@addThreadComment')->name('threadcomment.store');
Route::get('/user/profile/{user}', 'UserProfileController@index')->name('user_profile')->middleware('auth');
<?php
use App\Http\Controllers\TasksController;
Route::get('/', function () {
    $threads=App\Thread::paginate(15);
    return view('welcome',compact('threads'));
});
Auth::routes();
Route::post('/dashboard/mail','TasksController@sendmail')->name('sendmail');
Route::resource('/thread','ThreadController');
Route::get('/showalltasks','TasksController@showall')->name('allt');
Route::get('/dashboard','TasksController@dashboard')->name('dashb');
Route::get('/delete/{id}','TasksController@destroy')->name('delete');
Route::resource('comment','CommentController',['only'=>['update','destroy']]);
Route::resource('tasks', 'TasksController');
Route::post('comment/create/{thread}','CommentController@addThreadComment')->name('threadcomment.store');
Route::get('/user/profile/{user}', 'UserProfileController@index')->name('user_profile')->middleware('auth');
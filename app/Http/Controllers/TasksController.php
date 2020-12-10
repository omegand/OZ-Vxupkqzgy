<?php

namespace App\Http\Controllers;
use App\Task;
use App\User;
use App\Bookings;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TasksController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    $tasks = Task::all();
    return view('tasks.index', compact('tasks'));
    }
    public function showall()
    { 
        $userId = Auth::id();
       // $data = Bookings::where('user_id','=',$userId)->get();
       $data = DB::select("
       SELECT tasks.name,tasks.task_date,tasks.description,bookings.user_id,bookings.id as id
       FROM tasks
       INNER JOIN bookings
       ON bookings.task_id = tasks.id
       WHERE bookings.user_id ='$userId'");
        return view('tasks.show',['tasks' => $data]);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('tasks.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
    Task::create($request->all());
    return redirect()->route('tasks.index');
    }

    
    public function show($id)
    {
    
        $userId = Auth::id();
        if(Bookings::where([['user_id','=',$userId],['task_id','=', $id]])->exists()) {
                return back()->withMessage('Jau esi užregistruotas į renginį');
        }
               
        $booking = new Bookings;
        $booking->user_id = $userId;
        $booking->task_id = $id;
        $booking->save();
        return back()->withMessage('Užregistruota į renginį');

    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::table('bookings')->delete($id);
        return redirect()->route('allt')->withMessage("Registracija ištrinta");
    }

    public function dostuff()
    {
        return view('dashboard');
    }
}

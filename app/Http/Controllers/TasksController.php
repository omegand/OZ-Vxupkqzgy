<?php

namespace App\Http\Controllers;

use App\Task;
use App\User;
use App\Bookings;
use App\Halls;
use App\Mail\SubMail;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class TasksController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        echo "Neleidžiamas puslapis";
      
    }
    public function showall()
    {
        $userId = Auth::id();
        $data = DB::select("
       SELECT tasks.name,tasks.task_date,tasks.description,bookings.user_id,bookings.id as id
       FROM tasks
       INNER JOIN bookings
       ON bookings.task_id = tasks.id
       WHERE bookings.user_id ='$userId'");
        if (is_null($data)) {
            return redirect()->back()->withMessage("Įvyko klaida");
        }
        return view('tasks.show', ['tasks' => $data]);
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
        return back()->withMessage('Įkėltas renginys.');
    }


    public function show($id)
    {
        $userId = Auth::id();
        if (Bookings::where([['user_id', '=', $userId], ['task_id', '=', $id]])->exists()) {
            return back()->withMessage('Jau esi užregistruotas į renginį');
        }
        $booking = new Bookings;
        $booking->user_id = $userId;
        $booking->task_id = $id;
        $booking->save();
        return back()->withMessage('Užregistruota į renginį');
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

    public function dashboard()
    {
        return view('dashboard');
    }
    public function sendmail()
    {
        $user = User::select('email')->get();
        if (is_null($user)) {
            return redirect()->back()->withMessage("Nerasta vartotojų");
        }
        foreach ($user as $u)
            Mail::to($u)->send(new SubMail());
        return redirect()->back()->withMessage("Išsiūstas email");
    }
    public function showhalls()
    {
        $data = Halls::all();
        if (is_null($data)) {
            return redirect()->back()->withMessage("Įvyko klaida");
        }
        return view('tasks.halls', ['halls' => $data]);
    }
    public function showcalendar($id)
    {
        $tasks = Task::where('halls_id', '=', $id)->get();
        return view('calendar', compact('tasks'));
    }
}

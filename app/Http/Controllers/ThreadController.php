<?php

namespace App\Http\Controllers;

use App\Thread;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;

class ThreadController extends Controller
{
    function __construct()
    {
        return $this->middleware('auth')->except('index');
    }

    public function index()
    {
        $threads=Thread::all();
       return view('thread.index')->with(compact('threads'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('thread.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //validate

        $this->validate($request, [
            'subject' => 'required|min:5',
            'thread'  => 'required|min:10',
        ]);
        $thread = auth()->user()->threads()->create($request->all());
        return back()->withMessage('Diskusija sukurta.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Thread $thread
     * @return \Illuminate\Http\Response
     */
    public function show(Thread $thread)
    {
        return view('thread.single', compact('thread'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Thread $thread
     * @return \Illuminate\Http\Response
     */
    public function edit(Thread $thread)
    {
        return view('thread.edit', compact('thread'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \App\Thread $thread
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Thread $thread)
    {
        $this->authorize('update', $thread);
        $this->validate($request, [
            'subject' => 'required|min:5',
            'thread'  => 'required|min:10'
        ]);
        $thread->update($request->all());
        return redirect()->route('thread.show', $thread->id)->withMessage('Diskusija atnaujinta.');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Thread $thread
     * @return \Illuminate\Http\Response
     */
    public function destroy(Thread $thread)
    {
        $this->authorize('update', $thread);
        $thread->delete();
        return redirect()->route('thread.index')->withMessage("Diskusija ištrinta.");
    }
}

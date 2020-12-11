@extends('layouts.front')
@section('content')
    <div class="row">
        <div class=" well">
            <form class="form-vertical" action="{{route('thread.update',$thread->id)}}" method="post" role="form"
                  id="create-thread-form">
                {{csrf_field()}}
                {{method_field('put')}}
                <div class="form-group">
                    <label for="subject">Tema</label>
                    <input type="text" class="form-control" name="subject" id="" placeholder="Tekstas..."value="{{$thread->subject}}">
                </div>
                <div class="form-group">
                    <label for="thread">Diskusija</label>
                    <textarea class="form-control" name="thread" id="" placeholder="Tekstas..."> {{$thread->thread}} </textarea>
                </div>
                <button type="submit" class="btn btn-primary">Patvirtinti</button>
            </form>
        </div>
    </div>

@endsection
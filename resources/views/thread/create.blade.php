@extends('layouts.front')
@section('heading',"Sukurti Diskusija")
@section('content')
@include('layouts.partials.error')
    <div class="row">
        <div class=" well">
            <form class="form-vertical" action="{{route('thread.store')}}" method="post" role="form"
                  id="create-thread-form">
                {{csrf_field()}}
                <div class="form-group">
                    <label for="subject">Tema</label>
                    <input type="text" class="form-control" name="subject" id="" placeholder="Tekstas..."
                           value="{{old('subject')}}">
                </div>
                <div class="form-group">
                    <label for="thread">Diskusija</label>
                    <textarea class="form-control" name="thread" id="" placeholder="Tekstas..."
                    > {{old('thread')}}</textarea>
                </div>
                <button type="submit" class="btn btn-primary">Patvirtinti</button>
            </form>
        </div>
    </div>
@endsection
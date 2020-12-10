@extends('layouts.front')
@section('content')
    <div class="content-wrap well">
        <h4>{{$thread->subject}}</h4>
        <hr>
        <div class="thread-details">
            {!! \Michelf\Markdown::defaultTransform($thread->thread)  !!}
        </div>
        <br>
        {{--@if(auth()->user()->id == $thread->user_id)--}}
        @can('update',$thread)
            <div class="actions">
                <a href="{{route('thread.edit',$thread->id)}}" class="btn btn-info btn-xs">Redaguoti</a>
                {{--//delete form--}}
                <form action="{{route('thread.destroy',$thread->id)}}" method="POST" class="inline-it">
                    {{csrf_field()}}
                    {{method_field('DELETE')}}
                    <input class="btn btn-xs btn-danger" type="submit" value="Ištrinti">
                </form>

            </div>
        @endcan
        {{--@endif--}}
    </div>
    <hr>
    <br>
    @foreach($thread->comments as $comment)
        <div class="comment-list well well-lg">
           @include('thread.partials.comment-list')
        </div>
        <hr>
    @endforeach
    <br><br>
    @include('thread.partials.comment-form')

@endsection
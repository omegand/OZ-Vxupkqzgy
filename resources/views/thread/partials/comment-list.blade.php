<h4>{{$comment->body}} </h4>
<lead>{{$comment->user->name}}</lead>
@if(auth()->user()->id == $comment->user_id)
<div class="actions">
    {{--<a href="{{route('thread.edit',$thread->id)}}" class="btn btn-info btn-xs">Koreguoti</a>--}}
    <a class="btn btn-primary btn-xs" data-toggle="modal" href="#{{$comment->id}}">Koreguoti</a>
    <div class="modal fade" id="{{$comment->id}}">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="comment-form">
                        <form action="{{route('comment.update',$comment->id)}}" method="post" role="form">
                            {{csrf_field()}}
                            {{method_field('put')}}
                            <legend>Keisti komentarą</legend>
                            <div class="form-group">
                                <input type="text" class="form-control" name="body" id="" placeholder="Tekstas..." value="{{$comment->body}}">
                            </div>
                            <button type="submit" class="btn btn-primary">Keisti</button>
                        </form>

                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <form action="{{route('comment.destroy',$comment->id)}}" method="POST" class="inline-it">
        {{csrf_field()}}
        {{method_field('DELETE')}}
        <input class="btn btn-xs btn-danger" type="submit" value="Ištrinti">
    </form>
</div>
@endif
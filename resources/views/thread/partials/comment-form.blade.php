<div class="comment-form">

    <form action="{{route('threadcomment.store',$thread->id)}}" method="post" role="form">
        {{csrf_field()}}
        <legend>Sukurti komentarą</legend>

        <div class="form-group">
            <input type="text" class="form-control" name="body" id="" placeholder="Tekstas...">
        </div>


        <button type="submit" class="btn btn-primary">Komentuoti</button>
    </form>

</div>
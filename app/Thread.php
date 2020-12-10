<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class Thread extends Model
{
    use CommentableTrait;
    protected $fillable=['subject','thread','user_id'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bookings extends Model
{
    protected $fillable=['user_id','task_id'];
}

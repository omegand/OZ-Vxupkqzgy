<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{


    protected $fillable = [
        'name', 'email', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    public function getRouteKeyName()
    {
        return 'name';
    }
    public function threads()
    {
        return $this->hasMany(Thread::class);
    }
    public function isAdmin()
    {
        if ($this->admin == 1) return true;
        else return false;
    }
}

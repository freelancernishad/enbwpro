<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'mobileCode',
        'flags',
        'mobile',
        'username',
        'ref_by',
        'plan_id',
        'receiveable',
        'checkin',
        'task',
        'balance',
        'depsit_time',
        'depsit_amount',
        'withdraw_amount',
        'nidfront',
        'nidback',
        'address',
        'role',
        'email',
        'password',
        'Bank_Name',
        'Bank_account',
        'withdrawpass',
        'status',
        'ip',

    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function roles(){
        return $this->belongsTo(Role::class, 'role', 'id');
    }


    public function Tasks(){
        return $this->belongsTo(Task::class, 'id', 'user_id');
    }

    public function Plans(){
        return $this->belongsTo(Plan::class, 'plan_id', 'id');
    }

    public function deposits()
    {
        return $this->hasMany(Deposit::class,'user_id','id');
    }

    public function package_buys()
    {
        return $this->hasMany(PackageBuy::class,'userid','id');
    }



}

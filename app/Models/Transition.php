<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transition extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'amount',
        'charge',
        'post_balance',
        'trx_type',
        'trx',
        'remark',
        'details',
    ];


    public function users(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }


}

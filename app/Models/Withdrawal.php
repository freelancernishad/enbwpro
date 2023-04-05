<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Withdrawal extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'method',
        'amount',
        'curency',
        'rate',
        'charge',
        'trx',
        'mer_trx',
        'final_amount',
        'after_charge',
        'recieved_number',
        'withdraw_info',
        'status',
        'admin_feedback',
    ];

    public function methods(){
        return $this->belongsTo(Gateway::class, 'method', 'id');
    }

    public function users(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Deposit extends Model
{
    use HasFactory;
    protected $fillable= [
        'user_id',
        'method',
        'amount',
        'screenshot',
        'curency',
        'rate',
        'final_amount',
        'detials',
        'trx',
        'mer_trx',
        'sender',
        'try',
        'status',
        'admin_feedback',
    ];


    public function methods(){
        return $this->belongsTo(Gateway::class, 'method', 'id');
    }

    public function users(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }


    public function scopeFilterByStatus($query, $status)
    {
        return $query->where('status', $status);
    }

}

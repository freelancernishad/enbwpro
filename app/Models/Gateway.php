<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gateway extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'currency',
        'symbol',
        'method_code',
        'gateway_alias',
        'min_amount',
        'max_amount',
        'percent_charge',
        'fixed_charge',
        'processtime',
        'rate',
        'image',
        'gateway_parameter',
        'number',
        'status',
    ];

}

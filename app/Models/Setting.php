<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;

    protected $fillable = [
        'notice',
        'new_regitration',
        'refer_bonus',
        'ref_count',
        'a',
        'min_deposit',
        'telegroup',
        'telesupport1',
        'telesupport2',
        'telesupport3',
        'worktime',
        'withdrawtext',
        'recharagetext',
        'slide1',
        'slide2',
        'slide3',
        'slide4',
        'bkash',
        'nagad',
        'rocket',
    ];
}

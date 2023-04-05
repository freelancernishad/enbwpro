<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PackageBuy extends Model
{
    use HasFactory;

    protected $fillable = [
        'packageId',
        'userid',
        'price',
        'earn',
        'duration',
        'startDate',
        'endDate',
        'status',
    ];


    public function packages(){
        return $this->belongsTo(Package::class, 'packageId', 'id');
    }


    public function scopeFilterByStatus($query, $status)
    {
        return $query;
    }


}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Blog extends Model
{
    use HasFactory,SoftDeletes;


    protected $fillable = [
        'post_id',
        'title',
        'short_description',
        'description',
        'Images',
        'Tags',
        'Category',
        'price',
        'status',
    ];

}

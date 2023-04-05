<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Blog_category extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'category_id',
        'name',
        'slug',
        'parent_category',
    ];

}

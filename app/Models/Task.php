<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;
    protected $fillable = [
        'orderNumber',
        'user_id',
        'blog_id',
        'task_comisition',
        'date',
    ];


    public function Packages(){
        return $this->belongsTo(Package::class, 'blog_id', 'id');
    }

}

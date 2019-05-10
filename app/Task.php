<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    protected $visible = [
        'id',
        'title',
        'assigned_user',
        'due_date',
        'description',
        'created_by',
        'is_complete',
        'commments'
    ];

    protected $fillable = [
        'title',
        'assigned_user',
        'due_date',
        'description',
        'created_by',
        'is_complete'
    ];

    public function createdBy()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    public function assignedUser() {
        return $this->belongsTo('App\User', 'assigned_user');
    }

    public function comments()
    {
        return $this->hasMany('App\Comment');
    }
}

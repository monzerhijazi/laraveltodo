<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $visible = [
        'id',
        'task_id',
        'body',
        'created_by',
        'created_at',
    ];

    protected $fillable = [
        'body',
        'task_id',
        'created_by',
    ];

    public function createdBy()
    {
        return $this->belongsTo('App\User', 'created_by');
    }

    /**
     * Get the post that owns the comment.
     */
    public function task()
    {
        return $this->belongsTo('App\Task');
    }
}

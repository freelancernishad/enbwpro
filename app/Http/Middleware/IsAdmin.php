<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Auth;
class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::check()) {
            return redirect()->route('login')->with('error',"You don't have admin access.");
        }else{
         // return $next($request);
        if(Auth::user()->role != 'admin'){
            return redirect('sub');
        }
            return $next($request);


        }

        // Auth::logout();
        // return redirect('login')->with('error',"You don't have admin access.");
    }






}

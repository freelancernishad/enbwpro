<?php

namespace App\Http\Controllers\Auth;

use Auth;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    // protected $redirectTo = RouteServiceProvider::HOME;



    protected $redirectTo = '/dashboard';
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    public function login(Request $request)
    {
        $clientIP = request()->ip();

        $userscount = User::where(['mobile' => $request->mobile, 'status' => 'active'])->count();
        if($userscount){
            $users = User::where(['mobile' => $request->mobile, 'status' => 'active'])->first();
            $users->update(['ip' => $clientIP]);

        }

        // if($users->role=='admin'){

        // }else{
        //             // $users = User::where('ip',$clientIP)->count();
        //  $usersCount = User::where(['ip' => $clientIP])->count();
        // if ($usersCount == 0) {
            // $users->update(['ip' => $clientIP]);
        // } else {

        //     $usersCount = User::where('mobile', '!=', $request->mobile)->where(['ip' => $clientIP])->count();
        //     if ($usersCount >= 1) {
        //         return 444;
        //     } else {
        //     }
        // }
        // }






        // return $usersCount;
        // if($usersCount>1){
        //     return 444;

        // }else{

        // }
        // return;
        // dd($users);


        $validator = Validator::make($request->all(), [
            'mobile' => 'required',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return sent_error('validation error', $validator->errors(), 422);
        }



        $checkUser = User::where(['mobile' => $request->mobile, 'status' => 'active'])->count();


        $credentials = $request->only('mobile', 'password');
        if (Auth::attempt($credentials)) {
            if ($checkUser) {
                $user = Auth::user();
                $data['id'] = $user->id;
                $data['school_id'] = $user->school_id;
                $data['name'] = $user->name;
                $data['email '] = $user->email;
                $data['access_token'] = $user->createToken('accessToken')->accessToken;
                //  return sent_response('Login Success', $data);
                return $this->respondWithToken($data['access_token']);
            } else {
                return 422;
            }
        } else {
            return 0;
        }
    }



    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => 60,
            'user_id' => auth()->user()->id,
            'name' => auth()->user()->name,
            'email' => auth()->user()->email,
            'role' => auth()->user()->role,
            'class' => auth()->user()->class,
            'teacherOrstudent' => auth()->user()->teacherOrstudent,
            'users' => auth()->user(),
        ]);
    }
}

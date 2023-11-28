<?php
namespace App\Http\Controllers\api;
use Exception;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class authController extends Controller
{
    public function login(Request $r)
    {



        $validator = Validator::make($r->all(), [
            'mobile' => 'required',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return sent_error('validation error', $validator->errors(), 422);
        }

        $credentials = $r->only('mobile', 'password');
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $data['id'] = $user->id;
            $data['school_id'] = $user->school_id;
            $data['name'] = $user->name;
            $data['email '] = $user->email;
            $data['access_token'] = $user->createToken('accessToken')->accessToken;
            //  return sent_response('Login Success', $data);
            return $this->respondWithToken($data['access_token']);
        } else {
            return sent_error('Unauthorised', '', 401);
        }




    }

        public function usernamecheck(Request $request)
        {
                 $username = $request->username;
            return User::where(['username'=>$username])->count();

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



    public function register(Request $r)
    {


        $CountUser = User::count();
        if($CountUser>0){
            $lastUser = User::latest()->first();

          $usernameInt =  explode('Af',$lastUser->username)[1];


            $username =  intval($usernameInt)+1;
             $username = "Af$username";

        }else{
            $username =  'Af24777';
        }

        // $name = str_replace(" ", "_", $r->mobile);
        // $username =  substr($name, 0, 6).rand(100,999);


        $clientIP = request()->ip();

        // $users = User::where('ip',$clientIP)->count();
        // if($users>0) return 444;


        $data = [];
        $data = $r->except(['password','password_confirmation','ref_by']);

        $ref_by=  $r->ref_by;
        // if($ref_by==16346){
        //     $data['ref_by'] = 17597;
        // }else{
        //     $data['ref_by'] = $ref_by;
        // }
        $data['ref_by'] = $ref_by;

        $data['password'] = hash::make($r->password);
        $data['username'] =$username;
        $data['email'] =time().'@gmail.com';
        $bonus = settings()->new_regitration;
        $data['balance'] =$bonus;
        $data['task'] =10;
        $data['plan_id'] =planId($bonus);
        $data['ip'] = $clientIP;
        $data['status'] ='active';

        $validator = Validator::make($r->all(), [
            'name' => 'required|min:4',
            // 'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
        ]);
        if ($validator->fails()) {
            return sent_error('validation error', $validator->errors(), 422);
        }
        try {
            $checkUser = User::where(['mobile'=>$r->mobile])->count();
            if($checkUser){
                return 422;
            }else{


                $refer_bonus =  (int)settings()->refer_bonus;
                if($refer_bonus>0){
                 $reUserCount =  User::where('ref_by',$r->ref_by)->count();
                 if($reUserCount<(int)settings()->ref_count){
                     $reUser =  User::where('username',$r->ref_by)->first();
                     transitionCreate($reUser->id,$refer_bonus,0,$refer_bonus,'increase','1234','refer_commisition','');
                     $reUser->update(['balance'=> balanceIncrease($reUser->balance, $refer_bonus)]);
                 }
                }




                     $user =   User::create($data);

                        transitionCreate($user->id,$bonus,0,$bonus,'increase','DJGDFGLJ','registration_bonus','');
            return $user;
                    }
        } catch (Exception $e) {
            return sent_error($e->getMessage(), $e->getCode());
        }
        // return $r->all();
    }
    public function Edit(Request $r, $id)
    {
        $user = User::findOrFail($id);
        $data = [];
        $inputData = $r->all();
        foreach ($inputData as $key => $value) {
            if ($key == '_token' || $key == 'submit') {
            } else if ($key == 'password') {
                $data[$key] = hash::make($value);
            } else {
                $data[$key] = $value;
            }
        }
        $validator = Validator::make($r->all(), [

            'name' => 'required|min:4',

        ]);
        if ($validator->fails()) {
            return sent_error('validation error', $validator->errors(), 422);
        }
        try {
            $user->update($data);
            $output = [];
            $inputData = $r->all();
            foreach ($inputData as $key => $value) {
                if ($key == 'id') {
                } else if ($key == 'password') {
                    $output[$key] = hash::make($value);
                } else {
                    $output['id'] = $id;
                    $output[$key] = $value;
                }
            }
            $output = [
                'user' => $output,
            ];
            return sent_response('User Update Success', $output);
        } catch (Exception $e) {
            return sent_error($e->getMessage(), $e->getCode());
        }
        // return $r->all();
    }
    public function delete(Request $r, $id)
    {
        $user = User::findOrFail($id);
        try {
            $user->delete();
            return sent_response('User Delete Success');
        } catch (Exception $e) {
            return sent_error($e->getMessage(), $e->getCode());
        }
    }
    public function restore(Request $r, $id)
    {
        // $user = User::findOrFail($id);
        try {
            User::withTrashed()->find($id)->restore();
            return sent_response('User Restore Success');
        } catch (Exception $e) {
            return sent_error($e->getMessage(), $e->getCode());
        }
    }
    public function restoreAll(Request $r)
    {
        // $user = User::findOrFail($id);
        try {
            User::onlyTrashed()->restore();
            return sent_response('All User Restore Success');
        } catch (Exception $e) {
            return sent_error($e->getMessage(), $e->getCode());
        }
    }
    public function deleted(Request $r)
    {
        return  $trashed = User::onlyTrashed()->get();
    }
    public function logout(Request $r)
    {
        auth()->user()->token()->revoke();
        $data = [];
        return sent_response('Logout Success', $data);
    }
    public function show(Request $r, $id)
    {
        $data =   User::find($id);
        if ($data) {
            return sent_response('Success', $data);
        } else {
            return sent_error('Data Not Found!');
        }
    }
    public function showByUnion(Request $r, $union)
    {
        //    $data =   User::find('unioun',$union);
        $data =   User::where('unioun', $union)->get();
        if ($data) {
            return sent_response('Success', $data);
        } else {
            return sent_error('Data Not Found!');
        }
    }
    public function index(Request $r)
    {
        $data =   User::all();
        if ($data) {
            return sent_response('Success', $data);
        } else {
            return sent_error('Data Not Found!');
        }
    }

    public function roleAssign(Request $request)
    {


            if($request->type=='Update'){
                $roles = Role::find($request->roleName);
                $roles->update(['permission'=>$request->permission]);
                return  'Role update successfully completed';
            }else{

                $roles = Role::where('roleName',$request->roleName)->count();;
if($roles>0){
    return  'Role Already Exists!';
}
                Role::create(['roleName'=>$request->roleName,'permission'=>$request->permission]);
                return  'Role created successfully completed';
            }
    }

    public function getRoles(Request $request)
    {

           return Role::find($request->id);

    }



}

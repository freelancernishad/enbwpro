<?php

namespace App\Http\Controllers;

use App\Models\Plan;
use App\Models\Task;
use App\Models\User;
use App\Models\Deposit;
use App\Models\PackageBuy;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $user_id = $request->user_id;
        $blog_id = $request->blog_id;
        if($blog_id && $user_id){

              $liked = Task::where(['user_id'=>$user_id,'blog_id'=>$blog_id])->count();
              $totalLiked = Task::where(['blog_id'=>$blog_id])->count();
        return  $data = [
                'liked'=>$liked,
                'totalLiked'=>$totalLiked,
            ];

         }



        $count = $request->count;
        if($user_id && $count){
           return  $task = Task::where(['user_id'=>$user_id])->latest()->take($count)->get()->sum('task_comisition');

        }


        $id = $request->id;
        if($id){

            $task = Task::where(['user_id'=>$id])->orderBy('created_at','desc')->get();
            $user = User::find($id);
            $plans = Plan::find($user->plan_id);


            $rows = [

                'user'=>$user,
                'task'=>$task,
                'plans'=>$plans,

            ];
            return $rows;

        }

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {



        $user_id = $request->user_id;
        // $task_comisition = $request->task_comisition;

     $user = User::find($user_id);



     $registerdate =  date('d-m-Y', strtotime($user->created_at));
     $todaydate =  date('d-m-Y');


     $now = time(); // or your date as well
     $your_date = strtotime($registerdate);
     $datediff = $now - $your_date;
     $registerDays = round($datediff / (60 * 60 * 24));

             if($registerDays>80000){

                $planName = Plan::find($user->plan_id)->name;
                if($planName=='VIP0'){
                 return 1000;
                }


             }





     $user = User::find($user_id);
     $plan_id = $user->plan_id;
    $plans = Plan::find($plan_id);

//  $task_comisition = (($user->balance * $plans->comission_rate) / 100);
//  $task_comisition =  number_format($task_comisition,2);
$tascount = $user->receiveable;
 $task_comisition =  number_format($tascount,2);







if($tascount>0){


    $levelOneCommisition =  tasklevelCommistion('Level1', $task_comisition);
    $levelTwoCommisition =  tasklevelCommistion('Level2', $task_comisition);
    $levelThreeCommisition =  tasklevelCommistion('Level3', $task_comisition);
    if ($user->ref_by) {
          $LevelOneUser = User::where(['username' => $user->ref_by])->first();
        //   $depositCount = Deposit::where(['user_id'=>$LevelOneUser->id,'status'=>'approved'])->count();
        // if($depositCount>0){
                        $LevelOneNewBalance = balanceIncrease($LevelOneUser->balance, $levelOneCommisition);
        transitionCreate($LevelOneUser->id,$levelOneCommisition,0,$LevelOneNewBalance,'increase','','refer_task_commisition','L1');
        // return planId($LevelOneNewBalance);
        $LevelOneUser->update([
            'balance' => $LevelOneNewBalance,
            'plan_id' => planId($LevelOneNewBalance),
        ]);

        // }
        if ($LevelOneUser->ref_by) {
            $LevelTwoUser = User::where(['username' => $LevelOneUser->ref_by])->first();
            // $depositCount = Deposit::where(['user_id'=>$LevelTwoUser->id,'status'=>'approved'])->count();
            // if($depositCount>0){
            $LevelTwoNewBalance = balanceIncrease($LevelTwoUser->balance, $levelTwoCommisition);
            transitionCreate($LevelTwoUser->id,$levelTwoCommisition,0,$LevelTwoNewBalance,'increase','','refer_task_commisition','L2');

            $LevelTwoUser->update([
                'balance' => $LevelTwoNewBalance,
                'plan_id' => planId($LevelTwoNewBalance),
            ]);
        // }
            if ($LevelTwoUser->ref_by) {

                $LevelThreeUser = User::where(['username' => $LevelTwoUser->ref_by])->first();

                // $depositCount = Deposit::where(['user_id'=>$LevelThreeUser->id,'status'=>'approved'])->count();
                // if($depositCount>0){
                $LevelThreeNewBalance = balanceIncrease($LevelThreeUser->balance, $levelThreeCommisition);
                transitionCreate($LevelThreeUser->id,$levelThreeCommisition,0,$LevelThreeNewBalance,'increase','','refer_task_commisition','L3');
                $LevelThreeUser->update([
                    'balance' => $LevelThreeNewBalance,
                    'plan_id' => planId($LevelThreeNewBalance),
                ]);
            // }
            }
        }
    }






    $newBalance = balanceIncrease($user->balance, $task_comisition);
    // $user->decrement('task');


    $user->update([
        'balance'=>$newBalance,
        'receiveable'=>0,
        'plan_id' => planId($newBalance),
    ]);
    transitionCreate($user_id,$task_comisition,0,$newBalance,'increase',quickRandom(10),'task_comisition','');


    $packages = PackageBuy::with('packages')->where(['userid'=>$user_id,'status'=>'Active'])->get();

    $packagesTotal = PackageBuy::with('packages')->where(['userid'=>$user_id,'status'=>'Active'])->sum('earn');


    foreach ($packages as $value) {
        if($packagesTotal==$task_comisition){
            $data = [
                'task_comisition'=>$value->earn,
                'user_id'=>$user_id,
                'blog_id'=>$value->id,
            ];
            $data['date'] = date('Y-m-d');
            Task::create($data);
        }

    }


    return;





}else{
    return 444;
}








    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function show(Task $task)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function edit(Task $task)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Task $task)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function destroy(Task $task)
    {
        //
    }
}

<?php

namespace App\Http\Controllers;

use DateTime;
use App\Models\Plan;
use App\Models\Task;
use App\Models\User;
use App\Models\PackageBuy;
use App\Models\Transition;
use Illuminate\Http\Request;

class TransitionController extends Controller
{


    public function transitions(Request $request)
    {
        $id = $request->id;
        $trx_type = $request->trx_type;
        $remark = $request->remark;

        if($remark && $trx_type){

            return Transition::where(['user_id'=>$id,'trx_type'=>$trx_type,'remark'=>$remark])->orderBy('created_at','desc')->get();
        }
        if($trx_type){

            return Transition::where(['user_id'=>$id,'trx_type'=>$trx_type])->orderBy('created_at','desc')->get();
        }
        return Transition::with('users')->where(['user_id'=>$id])->orderBy('created_at','desc')->get();

    }

    public function earningHistroy(Request $request)
    {

        $id = $request->id;

         $packages = PackageBuy::with('packages')->where(['userid'=>$id,'status'=>'Active'])->get();



        $trx_type = $request->trx_type;
        $remark = $request->remark;

        $transitions = Transition::where(['user_id'=>$id,'trx_type'=>$trx_type,'remark'=>$remark])->orderBy('id','desc')->get();


        $TaskEarnByPack = [];
        $TaskTotalAmount= 0;
        foreach ($packages as $value) {

            $TaskAmount = Task::where(['user_id'=>$id,'blog_id'=>$value->id])->sum('task_comisition');
            $TaskTotalAmount +=$TaskAmount;
            // return $value->endDate;
            $date1 = new DateTime(date('Y-m-d'));  //current date or any date
            $date2 = new DateTime($value->endDate);   //Future date
            $diff = $date2->diff($date1)->format("%a");  //find difference
            $days = intval($diff);   //rounding days


            array_push($TaskEarnByPack,
                [
                        'nameOfPackage'=>$value->packages->name,
                        'imageOfPackage'=>$value->packages->image,
                        'startDate'=>$value->startDate,
                        'endDate'=>$value->endDate,
                        'duration'=>$value->duration,
                        'remainigDays'=>$days,
                        'dailyearn'=>$value->earn,
                        'totalEarn'=>$TaskAmount,
                        'estimatedEarn'=>$value->earn*$value->duration,
                        'deposit'=>$value->price,
                    ]

            );


        }

   return  $packgeTotalEarn =  $TaskEarnByPack;
        return $TaskTotalAmount;



        $data = [
            'packages_buy'=>$packages,
            'transitions'=>$transitions,
        ];

        return $data;




    }



    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $id = $request->id;
        if($id){

            $task = Task::where(['user_id'=>$id])->get();
            $transiton = Transition::where(['user_id'=>$id])->orderBy('created_at','desc')->get();
            $user = User::find($id);
            $plans = Plan::find($user->plan_id);


            $rows = [

                'user'=>$user,
                'task'=>$task,
                'transiton'=>$transiton,
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Transition  $transition
     * @return \Illuminate\Http\Response
     */
    public function show(Transition $transition)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Transition  $transition
     * @return \Illuminate\Http\Response
     */
    public function edit(Transition $transition)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Transition  $transition
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Transition $transition)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Transition  $transition
     * @return \Illuminate\Http\Response
     */
    public function destroy(Transition $transition)
    {
        //
    }
}

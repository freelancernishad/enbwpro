<?php

namespace App\Http\Controllers;

use App\Models\Deposit;
use App\Models\Plan;
use App\Models\User;
use App\Models\Gateway;
use App\Models\PackageBuy;
use App\Models\Withdrawal;
use Illuminate\Http\Request;

class WithdrawalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $id = $request->id;
        if ($id) {
            return Withdrawal::where(['user_id' => $id])->orderBy('created_at','DESC')->get();
        }
        $status = $request->status;
        if($status=='all'){
            return Withdrawal::with(['methods','users'])->orderBy('created_at','DESC')->get();
        }else{
            return Withdrawal::with(['methods','users'])->where([
                'status'=>$status
            ])->orderBy('created_at','DESC')->get();
        }

    }

        public function withdrawcharge($id)
        {
         return  $gateway = Gateway::find($id);
        }

    public function userbanned(Request $request,$status,$id)
    {
         $withdrawal = Withdrawal::find($id);

         $userid = $withdrawal->user_id;
         $methodid = $withdrawal->method;
         $user = User::find($userid);
         $method = Gateway::find($methodid);

         $userbalance = $user->balance;
         if($userbalance==null) $userbalance = 0;

         if($status=='reject'){
            $amount = $userbalance+$withdrawal->amount;
              $user->update([
                  'plan_id'=>planId($amount),
                  'balance'=>$amount,

                ]);
                transitionCreate($userid,$withdrawal->amount,0,$amount,'Increase','Withdraw Trx','Withdraw Cancel','');
            }

          if($status=='approved'){
            transitionCreate($userid,$withdrawal->amount,0,$userbalance,'decrease','Withdraw Trx','Withdraw Approve','');
            }



        return $withdrawal->update(['status'=>$status]);

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

        $dpcount = PackageBuy::where(['userid'=>$user_id])->count();

        // if($dpcount>0){



        $data = $request->all();

        $userid = $request->user_id;
        $methodid = $request->method;
        $user = User::find($userid);
        $method = Gateway::find($methodid);
        $userbalance = $user->balance;

        $created_at = date('Y-m-d');

        $withdrawCount = Withdrawal::where('user_id',$userid)->where("created_at","LIKE","%$created_at%")->count();

        if($withdrawCount>0) return 445;
        if($userbalance<$method->min_amount) return 444;



        if($userbalance==null) $userbalance = 0;
        $amount = $userbalance-$request->amount;



        $plans = Plan::where('start_balance','<=',$amount)->where('end_balance','>=',$amount)->where('status','active')->first();
         $user->update([
             'plan_id'=>planId($amount),
             'balance'=>$amount,
           ]);
           $data['status'] = 'pending';
           Withdrawal::create($data);

           transitionCreate($user->id,$request->amount,0,$amount,'decrease','','Withdraw','');


    // }else{
    //     return 422;
    // }

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Withdrawal  $withdrawal
     * @return \Illuminate\Http\Response
     */
    public function show(Withdrawal $withdrawal)
    {
        $with =  $withdrawal;

        $user = User::where(['id'=>$with->user_id])->first();
        $method = Gateway::where(['id'=>$with->method])->first();
       $rows = [
           'withdrawal'=>$with,
           'user'=>$user,
           'method'=>$method,
       ];
       return $rows;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Withdrawal  $withdrawal
     * @return \Illuminate\Http\Response
     */
    public function edit(Withdrawal $withdrawal)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Withdrawal  $withdrawal
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Withdrawal $withdrawal)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Withdrawal  $withdrawal
     * @return \Illuminate\Http\Response
     */
    public function destroy(Withdrawal $withdrawal)
    {
        //
    }
}

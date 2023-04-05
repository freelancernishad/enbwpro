<?php

namespace App\Http\Controllers;

use App\Models\Plan;
use App\Models\Task;
use App\Models\User;
use App\Models\Level;
use App\Models\Deposit;
use App\Models\Gateway;
use App\Models\PackageBuy;
use App\Models\Setting;
use App\Models\Transition;
use App\Models\Withdrawal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    public function paymentUrl(Request $request)
    {
        $amount =$request->amount;

$metadata = json_encode($request->all());
$curl = curl_init();
$panel_url = env('UDDOKTAPY_URL');
$Api_Key = env('UDDOKTAPY_API_KEY');

curl_setopt_array($curl, array(
  CURLOPT_URL => "$panel_url/api/checkout-v2",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
     "full_name": "Freelancer Nishad",
     "email": "freelancernishad123@gmail.com",
     "amount": "'.$amount.'",
     "metadata": '.$metadata.',
     "redirect_url": "'.url('api/success').'",
     "cancel_url": "'.url('api/cancel').'",
     "webhook_url": "'.url('api/webhook').'"
}
',
  CURLOPT_HTTPHEADER => array(
    "RT-UDDOKTAPAY-API-KEY: $Api_Key",
    "Content-Type: application/json"
  ),
));

$response = curl_exec($curl);

curl_close($curl);
return $response;

    }


public function referfunction($id)
{




    $refer = [];
    if($id){
     $user = User::find($id);
    $wh = [
        'ref_by'=>$user->username,
    ];

    $refer['L1'] = Transition::where(['user_id'=>$id,'details'=>'L1'])->sum('amount');
    $refer['L2'] = Transition::where(['user_id'=>$id,'details'=>'L2'])->sum('amount');
    $refer['L3'] = Transition::where(['user_id'=>$id,'details'=>'L3'])->sum('amount');
    $refer['reacharge'] = Transition::where(['user_id'=>$id,'details'=>'r'])->sum('amount');
    $refer['purchase'] = Transition::where(['user_id'=>$id,'details'=>'purchase'])->sum('amount');

    $refer['ToalEarn'] = $refer['L1']+$refer['L2']+$refer['L3']+$refer['reacharge'];
    $refer['ToalEarnPur'] = $refer['L1']+$refer['L2']+$refer['L3'];



     $level1 = User::withSum(['deposits' => function ($query) {$query->FilterByStatus('approved');}], 'amount')->withSum(['package_buys' => function ($query) {$query->FilterByStatus('Active');}],'price')->where($wh)->get();

        // $level1 =  User::where($wh)->get();

        // $level1 =  User::join('tasks', 'users.id', '=', 'tasks.user_id')
        // // ->join('tasks', 'users.id', '=', 'tasks.user_id')
        // ->select('users.*', 'tasks.task_comisition')
        // ->get();



        $refer['level1'] = $level1;



        $refer2 = [];
        foreach ($level1 as $value1) {
            $wh2 = [
                'ref_by'=>$value1->username,
            ];

            // $level2 =  User::where($wh2)->get();

            $level2 =  User::withSum(['deposits' => function ($query) {$query->FilterByStatus('approved');}], 'amount')->withSum(['package_buys' => function ($query) {$query->FilterByStatus('Active');}],'price')->where($wh2)->first();

            $level2count =  User::where($wh2)->count();
            if($level2count){
                array_push($refer2,$level2);
            }


        }



        // return $refer2;

        $refer['level2'] = $refer2;
        $refer3 = [];
        if(!empty($refer2)){
                        foreach ($refer2 as $value2) {
            $wh3 = [
                'ref_by'=>$value2->username,
            ];
            // $level3 =  User::where($wh3)->get();

            $level3 =  User::withSum(['deposits' => function ($query) {$query->FilterByStatus('approved');}], 'amount')->withSum(['package_buys' => function ($query) {$query->FilterByStatus('Active');}],'price')->where($wh3)->first();

            $level2count =  User::where($wh3)->count();
            if($level2count){
                array_push($refer3,$level3);
            }
        }
        }


        $refer['level3'] = $refer3;



    }


    return $refer;
}

    public function referlist(Request $request)
    {
        $id = $request->id;
//         $users =  User::select('users.*', 'tasks.user_id as taskuser_id', 'deposits.user_id as depositsuser_id')
//         ->rightJoin('tasks', 'tasks.user_id', '=', 'users.id')
//         ->rightJoin('deposits', 'deposits.user_id', '=', 'users.id')
//         // ->where('analytics.date', Carbon::today()->toDateString())
//         ->groupBy('tasks.user_id')
//         ->get();

// return $users;
//         return $res = array_merge($users, ['tasks' => $histories]);

// dd($users);
        return $this->referfunction($id);



    }



    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $status = $request->status;

        $username = $request->username;
        $task = $request->task;



        if($task){
            if($status=='all'){
                // return User::with(['Plans'])->orderBy('id','DESC') ->where(['username'=> $username])->paginate(20);
                return User::with(['Plans'])->orderBy('id','DESC')->where('task', 'like', '%'.$task.'%')->paginate(20);
            }else{
                // return User::with(['Plans'])->orderBy('id','DESC') ->where(['username'=> $username])->where(['status'=>$status])->paginate(20);
                return User::with(['Plans'])->orderBy('id','DESC') ->where('task', 'like', '%'.$task.'%')->where(['status'=>$status])->paginate(20);
            }
        }

        if($username){
            if($status=='all'){
                // return User::with(['Plans'])->orderBy('id','DESC') ->where(['username'=> $username])->paginate(20);
                return User::with(['Plans'])->orderBy('id','DESC')->where('username', 'like', '%'.$username.'%')->paginate(20);
            }else{
                // return User::with(['Plans'])->orderBy('id','DESC') ->where(['username'=> $username])->where(['status'=>$status])->paginate(20);
                return User::with(['Plans'])->orderBy('id','DESC') ->where('username', 'like', '%'.$username.'%')->where(['status'=>$status])->paginate(20);
            }
        }

        if($status=='all'){
            return User::with(['Plans'])->orderBy('id','DESC')->paginate(20);

        }else{
            return User::with(['Plans'])->orderBy('id','DESC')->where([
                'status'=>$status
            ])->paginate(20);

        }

    }
    public function userbanned(Request $request,$status,$id)
    {
         $users = User::find($id);
        return $users->update(['status'=>$status]);

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
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        $user =  $user;
        $user['password'] = '';
        $referby = 1;
        if($user->ref_by){

            $referby = User::where('username',$user->ref_by)->first()->id;
        }

        $refercode = $user->username;
        $referList = User::with(['Plans'])->where(['ref_by'=>$refercode])->get();
        $refercount = User::where(['ref_by'=>$refercode])->count();

        $deposit = Deposit::where(['user_id'=>$user->id,'status'=>'approved'])->get();
        $depositamount = Deposit::where(['user_id'=>$user->id,'status'=>'approved'])->sum('amount');
        $withdraw = Withdrawal::where(['user_id'=>$user->id,'status'=>'approved'])->get();
        $withdrawamount = Withdrawal::where(['user_id'=>$user->id,'status'=>'approved'])->sum('amount');
        $plans = Plan::find($user->plan_id);

        $todayDate = date('Y-m-d');
        $YesterdayDate =  date('Y-m-d',strtotime("-1 days"));
        $registration_bonus = Transition::where(['user_id'=>$user->id,'remark'=>'registration_bonus'])->sum('amount');
        $deposit_commisition = Transition::where(['user_id'=>$user->id,'remark'=>'deposit_commisition'])->count();
        $taskearn = Task::where(['user_id'=>$user->id])->sum('task_comisition');
        $todayearn = Task::where(['user_id'=>$user->id,'date'=>$todayDate])->sum('task_comisition');
        $YesterdayEarn = Task::where(['user_id'=>$user->id,'date'=>$YesterdayDate])->sum('task_comisition');


       $rows = [
           'new_regitration'=>settings()->new_regitration,
           'deposit_commisition'=>$deposit_commisition,
           'registration_bonus'=>$registration_bonus,
           'taskearn'=>$taskearn,
           'todayearn'=>$todayearn,
           'YesterdayEarn'=>$YesterdayEarn,
           'plans'=>$plans,
           'deposit'=>$deposit,
           'depositamount'=>$depositamount,
           'user'=>$user,
           'referby'=>$referby,
           'withdraw'=>$withdraw,
           'withdrawamount'=>$withdrawamount,
           'refercount'=>$refercount,
           'referList'=>$referList,
       ];
       return $rows;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
         $taskcc = $request->taskcc;
        if($taskcc){
            Task::where(['user_id'=>$user->id])->latest()->take($taskcc)->delete();
        }




        $data = $request->except(['password']);
        if($request->password){

            $data['password'] = hash::make($request->password);
        }
       return $user->update($data);




    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }



    public function referActiveUser($array = [])
    {
        // return $array;
        $Active = 0;
        if(!empty($array)){
            foreach ($array as $value) {
                $depositlist = PackageBuy::where(['userid' => $value->id, 'status' => 'Active'])->count();
                if ($depositlist > 0) {
                    $Active += 1;
                }
            }
        }


        return $Active;
    }
    public function referdeposit($array = [])
    {
        $amount = 0;
        foreach ($array as $value) {
            $depositlist = Deposit::where(['user_id' => $value->id, 'status' => 'approved'])->sum('amount');
            if ($depositlist > 0) {
                $amount += $depositlist;
            }
        }
        return $amount;
    }
    public function teamdetails(Request $request)
    {

        $id = $request->id;
        $refercount =  $this->referfunction($id);
        $Direct_Invites = 0;
        $Level1_Invites = 0;
        $Level2_Invites = 0;
        $Direct_Invites_diposit = 0;
        $Level1_Invites_diposit = 0;
        $Level2_Invites_diposit = 0;
        $level1Active = 0;
        $level2Active = 0;
        $level3Active = 0;
        if (count($refercount['level1'])) {
            $Direct_Invitelist =  $refercount['level1'];
            $level1Active = $this->referActiveUser($Direct_Invitelist);
            $Direct_Invites_diposit = $this->referdeposit($Direct_Invitelist);
            $Direct_Invites =  count($refercount['level1']);
        }
        if (count($refercount['level2'])) {
            $Level1_Invitelist =  $refercount['level2'];
            $level2Active =  $this->referActiveUser($Level1_Invitelist);
            $Level1_Invites =  count($refercount['level2']);
            $Level1_Invites_diposit = $this->referdeposit($Level1_Invitelist);
        }
        if (count($refercount['level3'])) {
            $Level2_Invitelist =  $refercount['level3'];
            $level3Active =  $this->referActiveUser($Level2_Invitelist);
            $Level2_Invites =  count($refercount['level3']);
            $Level2_Invites_diposit = $this->referdeposit($Level2_Invitelist);
        }
        $total_member = $Direct_Invites + $Level1_Invites + $Level2_Invites;
        $total_ActiveMember = $level1Active + $level2Active + $level3Active;
        $total_ActiveMember_deposit = $Direct_Invites_diposit + $Level1_Invites_diposit + $Level2_Invites_diposit;







        $user =  User::find($id);


    $refer_task_bonus = Transition::where(['user_id'=>$id,'remark'=>'refer_task_commisition'])->sum('amount');
    $refer_commisition = Transition::where(['user_id'=>$id,'remark'=>'refer_commisition'])->sum('amount');

        $user['password'] = '';

        $refercode = $user->username;
        $refercount = User::where(['ref_by'=>$refercode])->count();

        $deposit = Deposit::where(['user_id'=>$user->id,'status'=>'approved'])->get();
        $depositamount = Deposit::where(['user_id'=>$user->id,'status'=>'approved'])->sum('amount');
        $withdraw = Withdrawal::where(['user_id'=>$user->id,'status'=>'approved'])->get();
        $withdrawamount = Withdrawal::where(['user_id'=>$user->id,'status'=>'approved'])->sum('amount');

       $rows = [
           'Direct_Invites'=>$Direct_Invites,
           'total_member'=>$total_member,
           'total_ActiveMember'=>$total_ActiveMember,
           'deposit'=>$deposit,
           'total_ActiveMember_deposit'=>$total_ActiveMember_deposit,
           'depositamount'=>$depositamount,
           'user'=>$user,
           'withdraw'=>$withdraw,
           'withdrawamount'=>$withdrawamount,
           'refercount'=>$refercount,
           'refer_task_bonus'=>$refer_task_bonus,
           'refer_commisition'=>$refer_commisition,
       ];
       return $rows;
    }


    public function passwordupdate(Request $request)
    {
        $id = $request->id;
        $user = User::find($id);
        $type = $request->type;
        if($type=='account'){
            $old = $request->old;
            $newpass = $request->newpass;
//  Hash::check($user->password, $old);
            if(Hash::check($old,$user->password)){
                $user->update([
                    'password'=> hash::make($newpass)
                ]);
            }else{
                return 0;
            }


        }else if($type=='withdraw'){
            $old = $request->old;
            $newpass = $request->newpass;
            if($old===$user->withdrawpass){
                $user->update([
                    'withdrawpass'=> $newpass
                ]);
            }else{
                return 0;
            }
        }
return 1;


    }
    public function allcount(Request $request)
    {
            $id = $request->id;
            $type = $request->type;

            if($type=='Recharge'){
                return Deposit::where(['user_id'=>$id,'status' => 'approved'])->sum('amount');
            }else
            if($type=='withdraw'){
                return Withdrawal::where(['user_id'=>$id,'status' => 'approved'])->sum('amount');
            }else
            if($type=='task'){
                return Task::where(['user_id'=>$id])->count();
            }

    }

    public function lastRecords(Request $request)
    {
        $deposit = Deposit::with(['Users'])->latest()->take(5)->get();
        $withdraw = Withdrawal::with(['Users'])->latest()->take(5)->get();
        $user = User::with(['plannames'])->latest()->take(5)->get();
        $levels = Level::all();
        $data = [
            'deposit' => $deposit,
            'withdraw' => $withdraw,
            'user' => $user,
            'levels' => $levels,
        ];
        return $data;
    }

    public function barReport($start,$end,$year,$table)
    {



    //   return  $start = $month = strtotime("$start");
        // $end = strtotime("$end");
        $data = [];
        $allmonth = [];
        $borderColor = [];
        $backgroundColor = [];
        $datas = [];
        $month = date("m",strtotime($start));
        $curentmonth = date("Y-m",strtotime($start));
        $days = cal_days_in_month(CAL_GREGORIAN,$month,$year);
        for ($i=1; $i <=$days ; $i++) {
           $d = str_pad($i, 2, '0', STR_PAD_LEFT);
            $fdate = $curentmonth.'-'.$d;

            $total = DB::table($table)->where(['status'=>'approved'])->whereDate('created_at', '<=', $fdate.' 00:00:00')->whereDate('created_at', '>=', $fdate.' 00:00:00')
            ->sum('amount');
            //  $total = DB::table($table)->whereBetween('created_at', [$start.' 00:00:00',$end.' 23:59:59'])->sum('amount');

            array_push($data, "$total");
            array_push($allmonth, $fdate);
            // $month = strtotime("+1 day", $month);


        // array_push($borderColor, "#" . $this->random_color());
        // array_push($backgroundColor, "#" . $this->random_color());



        }




        // $datas['allmonth'] = $allmonth;
        $arr = [
            'label' => $table,
            'backgroundColor' => 'green',
            'data' => $data,
            'borderColor' => 'red',
            'borderWidth' => 1
        ];

        $datas['reports'] = (object)$arr;
        $datas['allmonth'] = $allmonth;
        return $datas;
    }






    public function dashboard(Request $request)
    {

        $month = date("m");
        $year = date("Y");
        $days = cal_days_in_month(CAL_GREGORIAN,$month,$year);

        $dpChart = $this->barReport("2022-$month-01","2022-$month-$days","2022","deposits");
        $WChart = $this->barReport("2022-$month-01","2022-$month-$days","2022","withdrawals");

        $totalUser = User::where(['status'=>'active'])->count();
        $totalDeposit = Deposit::where(['status'=>'approved'])->sum('amount');
        $totalWithdrawal = Withdrawal::where(['status'=>'approved'])->sum('amount');
        $date = date("Y-m-d");

        $todayApprovedDeposit = Deposit::where(['status'=>'approved'])->whereDate('created_at', '<=', $date)->whereDate('created_at', '>=', $date)
        ->sum('amount');
        $todayApprovedWithdrawal = Withdrawal::where(['status'=>'approved'])->whereDate('created_at', '<=', $date)->whereDate('created_at', '>=', $date)->sum('amount');

        $todayPendingDepositCount = Deposit::where(['status'=>'pending'])->whereDate('created_at', '<=', $date)->whereDate('created_at', '>=', $date)->count();
        $todayPendingWithdrawalCount = Withdrawal::where(['status'=>'pending'])->whereDate('created_at', '<=', $date)->whereDate('created_at', '>=', $date)->count();

        $todayPendingDepositAmount = Deposit::where(['status'=>'pending'])->whereDate('created_at', '<=', $date)->whereDate('created_at', '>=', $date)
        ->sum('amount');
        $todayPendingWithdrawalAmount = Withdrawal::where(['status'=>'pending'])->whereDate('created_at', '<=', $date)->whereDate('created_at', '>=', $date)->sum('amount');


        $data = [
            'totalUser'=>$totalUser,
            'totalDeposit'=>$totalDeposit- settings()->a,
            'totalWithdrawal'=>$totalWithdrawal,
            'todayApprovedDeposit'=>$todayApprovedDeposit,
            'todayApprovedWithdrawal'=>$todayApprovedWithdrawal,
            'todayPendingDepositCount'=>$todayPendingDepositCount,
            'todayPendingWithdrawalCount'=>$todayPendingWithdrawalCount,
            'todayPendingDepositAmount'=>$todayPendingDepositAmount,
            'todayPendingWithdrawalAmount'=>$todayPendingWithdrawalAmount,
            'dpChart'=>$dpChart,
            'WChart'=>$WChart,
        ];

        return $data;

    }


    public function blances(Request $request,$id)
    {

        $user = User::find($id);
        $add = $request->add;

        $name = $request->name;
        if($name=='add'){
            $addTotal = balanceIncrease($user->balance, $add);
            transitionCreate($user->id,$add,0,$addTotal,'increase','dfg','deposit_commisition','');
        }else{
            $addTotal = balanceDecrease($user->balance, $add);
            transitionCreate($user->id,$add,0,$addTotal,'decrease','dfg','Fine','');
        }

// return $add;
        // return planId($LevelOneNewBalance);
        $user->update([
            'balance' => $addTotal,
            'plan_id' => planId($addTotal),
        ]);

    }



    public function md(Request $request)
    {
        $method = 'Bkash';
        $methodData = Gateway::where(['name' => $method])->first();



        $data = $request->all();


        $date = date("Y-m-d");

        if($request->screenshot){
            $data['screenshot'] =  fileupload($request->screenshot, "Recharge/screenshot/$date/");
        }

        $data['method'] =  $methodData->id;
        $data['curency'] =  $methodData->currency;
        $data['rate'] =  $methodData->rate;
        //  $data['trx'] = strtoupper(Str::random(10));
        $data['status'] = 'approved';

        transitionCreate($request->user_id,$request->amount,0,$request->amount,'increase',$request->trx,'rechage','');
         $amount = settings()->a+$request->amount;
        //  $set = Setting::find(1);
        settings()->update(['a'=>$amount]);

        $user = User::find($request->user_id);

        $userbalance = $user->balance;
        if ($userbalance == null) $userbalance = 0;
        $amount = $userbalance + $request->amount;
        // $plans = Plan::where('start_balance', '<=', $amount)->where('end_balance', '>=', $amount)->where('status', 'active')->first();
            $user->update([
                'plan_id' => planId($amount),
                'balance' => $amount,
            ]);


        return Deposit::insert($data);
    }



}

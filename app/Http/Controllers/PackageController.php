<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Models\User;
use App\Models\Deposit;
use App\Models\Package;
use App\Models\PackageBuy;
use Illuminate\Http\Request;

class PackageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Package::orderBy('id','asc')->get();
    }


    public function updateblog(Request $request)
    {

        $id = $request->id;
        $data = $request->except(['image']);

        $ImagesCount =  count(explode(';',$request->image));
            if($ImagesCount>1){
                $data['image'] =  fileupload($request->image,"packages/",200,150);
            }

        if($id){
            $blog = Package::find($id);
             $blog->update($data);
            return $blog;
        }
        return Package::create($data);


    }
        public function getblog(Request $request,$id)
        {
           $blogs =  Package::find($id);
           $data = $blogs;
           $data['Images'] =  asset($data->Images);
           return $data;
        }
        public function deleteblog(Request $request,$id)
        {
           $blog =  Package::find($id);
           return $blog->delete();
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
    public function store(Request $request,$id)
    {
        // return $id;
        // return $request->all();

        $user =  User::find($id);
        if(intval($user->balance)<intval($request->packagePrice)){
            return 44;
        }

        $DPamount = intval($request->packagePrice);

        $levelOneCommisition =  levelCommistion('Level1', $DPamount);
        $levelTwoCommisition =  levelCommistion('Level2', $DPamount);
        $levelThreeCommisition =  levelCommistion('Level3', $DPamount);
        if ($user->ref_by) {
            $LevelOneUser = User::where(['username' => $user->ref_by])->first();
            $depositCount = Deposit::where(['user_id'=>$LevelOneUser->id,'status'=>'approved'])->count();
            // if($depositCount>0){
            $LevelOneNewBalance = balanceIncrease($LevelOneUser->balance, $levelOneCommisition);
            transitionCreate($LevelOneUser->id,$levelOneCommisition,0,$LevelOneNewBalance,'increase','','refer_commisition','L1');
            // return planId($LevelOneNewBalance);
            $LevelOneUser->update([
                'balance' => $LevelOneNewBalance,
                'plan_id' => planId($LevelOneNewBalance),
            ]);

            // }

            if ($LevelOneUser->ref_by) {
                $LevelTwoUser = User::where(['username' => $LevelOneUser->ref_by])->first();
                $depositCount = Deposit::where(['user_id'=>$LevelTwoUser->id,'status'=>'approved'])->count();
                // if($depositCount>0){
                $LevelTwoNewBalance = balanceIncrease($LevelTwoUser->balance, $levelTwoCommisition);
                transitionCreate($LevelTwoUser->id,$levelTwoCommisition,0,$LevelTwoNewBalance,'increase','','refer_commisition','L2');

                $LevelTwoUser->update([
                    'balance' => $LevelTwoNewBalance,
                    'plan_id' => planId($LevelTwoNewBalance),
                ]);
            // }
                if ($LevelTwoUser->ref_by) {
                    $LevelThreeUser = User::where(['username' => $LevelTwoUser->ref_by])->first();
                    $depositCount = Deposit::where(['user_id'=>$LevelThreeUser->id,'status'=>'approved'])->count();
                    // if($depositCount>0){
                    $LevelThreeNewBalance = balanceIncrease($LevelThreeUser->balance, $levelThreeCommisition);
                    transitionCreate($LevelThreeUser->id,$levelThreeCommisition,0,$LevelThreeNewBalance,'increase','','refer_commisition','L3');
                    $LevelThreeUser->update([
                        'balance' => $LevelThreeNewBalance,
                        'plan_id' => planId($LevelThreeNewBalance),
                    ]);
                // }
                }
            }
        }



        $startDate = date('Y-m-d');
         $endDate = date('Y-m-d',strtotime("$request->packageDuration days"));

        $data = [
            'packageId'=>$request->id,
            'userid'=>$id,
            'price'=>$request->packagePrice,
            'earn'=>$request->packageEarn,
            'duration'=>$request->packageDuration,
            'startDate'=>$startDate,
            'endDate'=>$endDate,
            'status'=>'Active',
        ];

        PackageBuy::create($data);


        $balance = intval($user->balance)-intval($request->packagePrice);
        transitionCreate($user->id,$request->packagePrice,0,$balance,'decrease','','package','purchase');

        $Oldreceiveable = $user->receiveable;
$receiveable = $Oldreceiveable+$request->packageEarn;
        $user->update(['balance'=>$balance,'receiveable'=>$receiveable]);
        return 1;





    }



    public function taskscreate(Request $request)
    {

         $packageBuy  = PackageBuy::where('status','Active')->get();

        foreach ($packageBuy as $value) {
            $package = Package::find($value->packageId);
            $packageEarn = $package->packageEarn;
            $data = [
                'user_id'=>$value->userid,
                'blog_id'=>$value->packageId,
                'task_comisition'=>$packageEarn,
                'date'=>date('Y-m-d'),
            ];
            Task::create($data);

            $user =  User::find($value->userid);
            $balance = intval($user->balance)+intval($packageEarn);
            $user->update(['balance'=>$balance]);
        }


    }


    public function tasksList(Request $request,$id)
    {
      return  $tasks = Task::with(['Packages'])->where('user_id',$id)->get();

    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function show(Package $package)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function edit(Package $package)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Package $package)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function destroy(Package $package)
    {
        //
    }
}

<?php

namespace App\Http\Controllers;

use DateTime;
use App\Models\Otp;
use Illuminate\Http\Request;

class OtpController extends Controller
{


    public function setotp(Request $request)
    {
       $mobile = $request->mobile;
       $otp = rand(111111,999999);
       $date = date('Y-m-d');
       $ipAddress = request()->ip();
       $lastSent = date('Y-m-d H:i:s');
       $nextSent = date('Y-m-d H:i:s', strtotime($lastSent .' +3 minute'));


       $otpCheckIp = Otp::where(['date'=>$date,'ipAddress'=>$ipAddress])->count();

       if($otpCheckIp>2){

            return 'cross limit';
        }


       $otpCheck = Otp::where(['mobile'=>$mobile,'date'=>$date,'ipAddress'=>$ipAddress])->count();
       if($otpCheck>0){

        $otps = Otp::where(['mobile'=>$mobile,'date'=>$date,'ipAddress'=>$ipAddress])->latest()->first();

        $nextSentData = $otps->nextSent;
        $minutes_diff = 0;
        if($nextSentData>$lastSent){
           $date1 = new DateTime($lastSent);
           $date2 = new DateTime($nextSentData);
           $interval = $date1->diff($date2);
           $seconds_diff = $interval->s;
           $minutes_diff = $interval->s + ($interval->i * 60) + ($interval->h * 3600);
           return 'time not finished';
        }

        if($otpCheck>2){

            return 'cross limit';
        }
       }

        $data = [
            'mobile'=>$mobile,
            'otp'=>$otp,
            'date'=>$date,
            'ipAddress'=>$ipAddress,
            'lastSent'=>$lastSent,
            'nextSent'=>$nextSent,
        ];
        Otp::create($data);

        $message = "United-Eib-3s verification code is $otp.";
        SmsNocSmsSend($message,$mobile);


    }

    public function checkotp(Request $request)
    {
        $mobile = $request->mobile;
        $Requestotp = $request->otp;
        $date = date('Y-m-d');
        $ipAddress = request()->ip();
        $otpCheck = Otp::where(['mobile'=>$mobile,'otp'=>$Requestotp,'date'=>$date,'ipAddress'=>$ipAddress])->count();

        if($otpCheck>0){
         return 1;
        }
        return 0;

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
     * @param  \App\Models\Otp  $otp
     * @return \Illuminate\Http\Response
     */
    public function show(Otp $otp)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Otp  $otp
     * @return \Illuminate\Http\Response
     */
    public function edit(Otp $otp)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Otp  $otp
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Otp $otp)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Otp  $otp
     * @return \Illuminate\Http\Response
     */
    public function destroy(Otp $otp)
    {
        //
    }
}

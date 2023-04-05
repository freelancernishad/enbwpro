<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Message;
use App\Models\Conversion;
use Illuminate\Http\Request;
use App\Events\MessageCreated;
use Spatie\QueryBuilder\QueryBuilder;
use Spatie\QueryBuilder\AllowedFilter;

class MessageController extends Controller
{


    public function smsNotice(Request $request)
    {

        $message = $request->message;
         $users =  User::all();
            $mobiles = '';
         foreach ($users as $value) {


             $mobile =  substr($value->mobile, -10);
             SmsNocSmsSend($message,"$mobile");
            // $mobiles .= $mobile.',';
        }
        // $Sentmobiles = rtrim($mobiles, ",");

        // SmsNocSmsSend($message,"$mobiles");
    }




    public function getBalance(Request $request)
    {

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://app.smsnoc.com/api/v3/balance',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    'Accept: application/json',
    'Authorization: Bearer 179|WNYLhDrRxgrKVsTwWtklf4YHxT8ZiSzCHHJoPdRS '
  ),
));

$response = curl_exec($curl);

curl_close($curl);
return $response;

    }

public function usersget(Request $request)
{
        $result = QueryBuilder::for(User::class)
            ->allowedFilters([
                'name',
                'role',
                AllowedFilter::exact('school_id'),
                AllowedFilter::exact('email'),
                AllowedFilter::exact('teacherOrstudent'),
                AllowedFilter::exact('id')
            ])
            ->orderBy('id', 'desc')
            ->paginate(20);
        return response()->json($result);

}



public function messagesget(Request $request)
{
        $result = QueryBuilder::for(Message::class)
            ->allowedFilters([

                'body',
                AllowedFilter::exact('id'),
                AllowedFilter::exact('conversion_id'),
                AllowedFilter::exact('from_id'),
                AllowedFilter::exact('to_id'),
            ])
            ->orderBy('id', 'asc')
            ->get();
        return response()->json($result);

}


public function messagessent(Request $request)
{


 $conversion_id = $request->conversion_id;

    if($request->conversion_id=='new'){
            $dataconver = [
                'user_one'=>$request->from_id,
                'user_two'=>$request->to_id,
            ];
         $getid =    Conversion::create($dataconver);
$conversion_id = $getid->id;
    }



    $data =  [
        'conversion_id'=>$conversion_id,
        'from_id'=>$request->from_id,
        'to_id'=>$request->to_id,
        'body'=>$request->body,
    ];
    return Message::create($data);




}



public function conversionget(Request $request)
{
    $userone =$request->filter['user_one'];
    $usertwo =$request->filter['user_two'];



     $result1count = Conversion::where(['user_one'=>$userone,'user_two'=>$usertwo])->count();
           $result2count = Conversion::Where(['user_one'=>$usertwo,'user_two'=>$userone])->count();

if($result1count>0){

    $result = Conversion::where(['user_one'=>$userone,'user_two'=>$usertwo])->first();
}elseif($result2count>0){

    $result = Conversion::Where(['user_one'=>$usertwo,'user_two'=>$userone])->first();
}else{
    $result = [];
}




        return response()->json($result);

}





}

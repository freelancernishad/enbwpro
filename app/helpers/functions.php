<?php
use App\Models\Plan;
use App\Models\Level;
use App\Models\Setting;

function settings()
{

   return Setting::first();
}

function month_en_to_bn($month)
{

    $bn_month = array('জানুয়ারি', 'ফেব্রুয়ারী', 'মার্চ', 'এপ্রিল', 'মে', 'জুন', 'জুলাই', 'আগষ্ট', 'সেপ্টেম্বর', 'অক্টোবর', 'নভেম্বর', 'ডিসেম্বর');
    $en_month = array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');


    return str_replace($en_month, $bn_month, $month);
}

function int_en_to_bn($number)
{

    $bn_digits = array('০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯');
    $en_digits = array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');

    return str_replace($en_digits, $bn_digits, $number);
}



function sent_response($message,$data=[]){
    $response = [
        'status'=>true,
        'message'=>$message,
        'data'=>$data,
    ];
    return response()->json([$response]);

}

function sent_error($message ,$messages=[],$code=404){
    $response = [
        'status'=>false,
        'message'=>$message,
        'code'=>$code
    ];
    !empty($messages) ? $response['errors'] = $messages : null;


    return response()->json(['response'=>$response],$code);

}



use App\Models\Transition;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;
use Stichoza\GoogleTranslate\GoogleTranslate;

function transition($text)
{





    if(session()->has('lan')){
            $tr = new GoogleTranslate(session('lan')); // Translates into English
    }else{
        $tr = new GoogleTranslate('en'); // Translates into English
    }
    return $tr->translate($text);
}

function transitionsingle($text,$lan)
{
    $tr = new GoogleTranslate($lan); // Translates into English
    return $tr->translate($text);
}



function base64($Image)
{
//  return $Image;

    if(File::exists(env('FILE_PATH').$Image)){

        $Image= env('FILE_PATH').$Image;
    }else{
        $Image= env('FILE_PATH').'backend/image.png';

    }

$ext =  pathinfo($Image, PATHINFO_EXTENSION);;
    return $b64image = "data:image/$ext;base64,".base64_encode(file_get_contents($Image));
}

 function fileupload($Image,$path,$width='',$height='',$customname='')
{
 // same file server
 if (!file_exists(env('FILE_PATH').$path)) {
    File::makeDirectory(env('FILE_PATH').$path, 0777, true, true);
}

 $position = strpos($Image, ';');
$sub = substr($Image, 0, $position);
$ext = explode('/', $sub)[1];
$random = rand(10000,99999);
if($customname!=''){
$name = time().'____'.$customname.'.'.$ext;
}else{
$name = time().'____'.$random.'.'.$ext;
}
$upload_path = $path;
$image_url = $upload_path.$name;

if($width=='' && $height==''){

    $img = Image::make($Image);
}else{

    $img = Image::make($Image)->resize($width, $height);
}



 $img->save(env('FILE_PATH').$image_url);
 return asset($image_url);

    // separate file server
// $url = env('FILE_SERVER');
// $curl = curl_init($url);
// curl_setopt($curl, CURLOPT_URL, $url);
// curl_setopt($curl, CURLOPT_POST, true);
// curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
// // $headers = array(
// //    "Content-Type: application/json",
// // );
// // curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
// $data = ["files"=> $Image,'customname'=>$customname,'path'=>$path,'width'=>$width,'height'=>$height];
// curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
// curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
// curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
// $resp = curl_exec($curl);
// curl_close($curl);
// return json_decode($resp);











}

 function tasklevelCommistion($level, $amount)
{
    $level = Level::where(['name' => $level])->first();
    $commisition = $level->task_commisition;
    return   $commisitionAmount = (($amount * $commisition) / 100);
}
 function levelCommistion($level, $amount)
{
    $level = Level::where(['name' => $level])->first();
    $commisition = $level->comission;
    return   $commisitionAmount = (($amount * $commisition) / 100);
}
 function balanceIncrease($old, $new)
{
    if ($old == '' || $old == null) $old = 0;
    if ($new == '' || $new == null) $new = 0;
    return number_format($old + $new, 2, '.', '');
}

 function balanceDecrease($old, $new)
{
    if ($old == '' || $old == null) $old = 0;
    if ($new == '' || $new == null) $new = 0;
    return number_format($old - $new, 2, '.', '');
}

 function transitionCreate($userid=1,$amount=0,$charge=0,$post_balance=0,$trx_type='',$trx='',$remark='',$details='')
{
    $transitiondata = [
        'user_id'=>$userid,
        'amount'=>$amount,
        'charge'=>$charge,
        'post_balance'=>$post_balance,
        'trx_type'=>$trx_type,
        'trx'=>$trx,
        'remark'=>$remark,
        'details'=>$details,
    ];

    Transition::create($transitiondata);
}

function planId($balance){
    $balance = (int)$balance;

     $planscount = Plan::where('start_balance', '<=', $balance)->where('end_balance', '>=', $balance)->where('status', 'active')->count();
    if($planscount){
        $plans = Plan::where('start_balance', '<=', $balance)->where('end_balance', '>=', $balance)->where('status', 'active')->first();
        return $plans->id;
    }else{
        return 0;
    }
}
 function quickRandom($length = 16)
{
    $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

    return substr(str_shuffle(str_repeat($pool, 5)), 0, $length);
}




function SmsNocSmsSend($deccription = '', $applicant_mobile = '1909756552')
{

    $smsnocapikey = '179|WNYLhDrRxgrKVsTwWtklf4YHxT8ZiSzCHHJoPdRS ';
    $smsnocsenderid = '8809617611559';

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://app.smsnoc.com/api/v3/sms/send',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
"recipient":"880'.$applicant_mobile.'",
"sender_id":"'.$smsnocsenderid.'",
"type":"plain",
"message":"'.$deccription.'"
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json',
    'Accept: application/json',
    'Authorization: Bearer '.$smsnocapikey.''
  ),
));

$response = curl_exec($curl);

curl_close($curl);
// echo $response;

}



function SmsNocSmsSendGroup($deccription = '', $applicant_mobile = '8801909756552')
{

    $smsnocapikey = '179|WNYLhDrRxgrKVsTwWtklf4YHxT8ZiSzCHHJoPdRS ';
    $smsnocsenderid = '8809617611559';

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://app.smsnoc.com/api/v3/sms/send',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
"recipient":"'.$applicant_mobile.'",
"sender_id":"'.$smsnocsenderid.'",
"type":"plain",
"message":"'.$deccription.'"
}',
  CURLOPT_HTTPHEADER => array(
    'Content-Type: application/json',
    'Accept: application/json',
    'Authorization: Bearer '.$smsnocapikey.''
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;

}


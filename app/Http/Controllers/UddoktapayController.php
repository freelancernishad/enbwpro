<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\Order;
use App\Library\UddoktaPay;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class UddoktapayController extends Controller {

    /**
     * Show the payment view
     *
     * @return void
     */
    public function show() {
        return view( 'uddoktapay.payment-form' );
    }

    /**
     * Initializes the payment
     *
     * @param Request $request
     * @return void
     */
    public function pay( Request $request ) {



  $amount =$request->amount;
  $userid =$request->userid;
  $user = User::find($userid);
 $metadata = json_encode($request->all());
 $panel_url = env('UDDOKTAPAY_PAYMENT_DOMAIN');
    $Api_Key = env('UDDOKTAPAY_API_KEY');
    $curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "$panel_url",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'POST',
  CURLOPT_POSTFIELDS =>'{
    "full_name": "'.$user->name.'",
    "email": "'.$user->email.'",
    "amount": "'.$amount.'",
    "metadata": '.$metadata.',
     "redirect_url": "'.route( 'uddoktapay.success' ).'",
     "cancel_url": "'.route( 'uddoktapay.cancel' ).'",
     "webhook_url": "'.env( "UDDOKTAPAY_WEBHOOK_DOMAIN" ).'"
}',
  CURLOPT_HTTPHEADER => array(
    "Content-Type: application/json",
    "RT-UDDOKTAPAY-API-KEY: $Api_Key"

  ),
));

  $response = curl_exec($curl);

curl_close($curl);
return json_decode($response)->payment_url;















  $amount =$request->amount;

$metadata = json_encode($request->all());
$curl = curl_init();
$panel_url = env('UDDOKTAPAY_PAYMENT_DOMAIN');
$Api_Key = env('UDDOKTAPAY_API_KEY');

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
     "redirect_url": "'.route( 'uddoktapay.success' ).'",
     "cancel_url": "'.route( 'uddoktapay.cancel' ).'",
     "webhook_url": "'.env( "UDDOKTAPAY_WEBHOOK_DOMAIN" ).'"
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












        $amount =$request->amount;
        $metadata = $request->all();
        $requestData = [
            'full_name'    => 'Freelancer Nishad',
            'email'        => 'freelancernishad123@gmail.com',
            'amount'       => $amount,
            'metadata'     => $metadata,
            'redirect_url' => route( 'uddoktapay.success' ),
            'cancel_url'   => route( 'uddoktapay.cancel' ),
            'webhook_url'  => env( "UDDOKTAPAY_WEBHOOK_DOMAIN" ),
        ];

        try {
         return   $paymentUrl = UddoktaPay::init_payment( $requestData );
            return redirect ( $paymentUrl );
        } catch (Exception $e) {
            dd($e->getMessage());
        }
    }

    /**
     * Reponse from sever
     *
     * @param Request $request
     * @return void
     */
    public function webhook( Request $request ) {

        $headerApi = isset( $_SERVER['HTTP_RT_UDDOKTAPAY_API_KEY'] ) ? $_SERVER['HTTP_RT_UDDOKTAPAY_API_KEY'] : null;

        if ( $headerApi == null ) {
            return response( "Api key not found", 403 );
        }

        if ( $headerApi != env( "UDDOKTAPAY_API_KEY" ) ) {
            return response( "Unauthorized Action", 403 );
        }

        $validatedData = $request->validate( [
            'full_name'      => 'required',
            'email'          => 'required',
            'amount'         => 'required',
            'invoice_id'     => 'required',
            'metadata'       => 'required',
            'payment_method' => 'required',
            'sender_number'  => 'required',
            'transaction_id' => 'required',
            'status'         => 'required',
        ] );

        Order::findOrFail( $validatedData['metadata']['order_id'] )->update( [
            'status'         => $validatedData['status'],
            'payment_method' => $validatedData['payment_method'],
            'sender_number'  => $validatedData['sender_number'],
            'transaction_id' => $validatedData['transaction_id'],
            'invoice_id'     => $validatedData['invoice_id'],
        ] );

        return response( 'Database Updated' );
        Log::info($data);
    }

    /**
     * Success URL
     *
     * @return void
     */
    public function success() {
        return 'Payment is successful, Thanks for using Uddokta Pay- Regards <a href="https://codecstasy.com">Code Ecstasy</a>';
    }

    /**
     * Cancel URL
     *
     * @return void
     */
    public function cancel() {
        return redirect('/dashboard/user/Recharge');
    }

}

<?php

namespace App\Library;

use Exception;
use Illuminate\Support\Facades\Http;

class UddoktaPay {
    
    /**
     * Send payment request
     *
     * @param array $requestData
     * @return void
     */
    public static function init_payment($requestData) {
        $response = Http::withHeaders( [
            'Content-Type'          => 'application/json',
            'RT-UDDOKTAPAY-API-KEY' => env( "UDDOKTAPAY_API_KEY" ),
        ] )
            ->asJson()
            ->withBody( json_encode( $requestData ), "JSON" )
            ->post( env( "UDDOKTAPAY_PAYMENT_DOMAIN" ) . "/api/checkout" );
            
        if ( $response->successful() ) {

            $result=$response->json();

            if($result['status']){
                return $response->collect()['payment_url'];
            }else{
                throw new Exception($result['message']);
            }
        } 
        
        throw new Exception("Please recheck env configurations");
    }
}

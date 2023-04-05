<?php

use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DepositController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\UddoktapayController;
use Daaner\TikTok\Models\DiscoverInfo;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/sql', function (Request $request) {

    $sql = '';

    for ($i=1; $i < 192; $i++) {
        // echo $i;
        $sql .="INSERT INTO `blogs`(`title`, `price`) VALUES ('$i.mp4','".asset('/video/'.$i.'.mp4')."');";
    }
return  $sql;


});

Route::get('/tiktok', function (Request $request) {

    $tt = new DiscoverInfo;
  return  $discover = $tt->getDiscover();



});

Route::get('/ip/check', function (Request $request) {
    $clientIP = request()->ip();
    dd($clientIP);
});
Route::post('addvideo', function (Request $request) {
$arrayvalue =  $request->all();
    $makearray = [];
    for ($i=0; $i < count($arrayvalue['id']); $i++) {
        array_push($makearray,[
            'id'=>$arrayvalue['id'][$i],
            'video'=>$arrayvalue['video'][$i],
        ]);
    }



// read json file
$data = file_get_contents('tiktoks.json');

// decode json
$json_arr = json_decode($data, true);

// add data
// $json_arr[] = $makearray;

// encode json and save to file
 file_put_contents('tiktoks.json', json_encode($makearray));


return redirect()->back();





});

Route::get('/titok/json', function (Request $request) {
    $jsonString = file_get_contents('tiktoks.json');
    $data = json_decode($jsonString, true);


    return view('titok',compact('data'));

    $data[0]['video'] = "TENNIS";
    // or if you want to change all entries with activity_code "1"
    foreach ($data as $key => $entry) {
            $data[$key]['video'] = "TENNIS";
    }

    return $data;


});


Route::get( 'pay', [UddoktapayController::class, 'show'] )->name( 'uddoktapay.payment-form' );

Route::get( 'success', [DepositController::class, 'paymentSuccess'] )->name( 'uddoktapay.success' );
Route::get( 'cancel', [UddoktapayController::class, 'cancel'] )->name( 'uddoktapay.cancel' );

// Auth::routes();

Route::post('login',[LoginController::class,'login']);
Route::post('logout',[LoginController::class,'logout']);

// Route::group(['middleware' => ['is_admin']], function() {
// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
// });

// Route::group(['middleware' => ['CustomerMiddleware']], function() {
// Route::get('/sub', [App\Http\Controllers\HomeController::class, 'sub'])->name('sub');
// });

Route::group(['prefix' => 'dashboard','middleware' => ['auth']], function() {
    Route::get('/{vue_capture?}', function () {
        // return   Auth::user()->roles->permission;

        $roles = Role::all();

        return view('layout',compact('roles'));
    })->where('vue_capture', '[\/\w\.-]*')->name('dashboard');

});


Route::get('/{vue_capture?}', function () {
    return view('frontlayout');
})->where('vue_capture', '[\/\w\.-]*')->name('frontend');

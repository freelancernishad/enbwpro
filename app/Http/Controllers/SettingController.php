<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return  Setting::first();




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
        $data = $request->except(['bkash','nagad','rocket']);
        $data['bkash'] = json_encode($request->bkash);
        $data['nagad'] = json_encode($request->nagad);
        $data['rocket'] = json_encode($request->rocket);
        return Setting::create($data);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function show(Setting $setting)
    {
        $data =  $setting;
        $data['bkash'] = json_decode($data->bkash);
        $data['nagad'] = json_decode($data->nagad);
        $data['rocket'] = json_decode($data->rocket);
        return $data;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function edit(Setting $setting)
    {
        return $setting;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Setting $setting)
    {

         $data = $request->except(['bkash','nagad','rocket','slide1','slide2','slide3','slide4']);

     $data['bkash'] = json_encode($request->bkash);
     $data['nagad'] = json_encode($request->nagad);
     $data['rocket'] = json_encode($request->rocket);

     $slide1Count =  count(explode(';',$request->slide1));
     $slide2Count =  count(explode(';',$request->slide2));
     $slide3Count =  count(explode(';',$request->slide3));
     $slide4Count =  count(explode(';',$request->slide4));


         if($slide1Count>1){
             $data['slide1'] =  fileupload($request->slide1,"slider/",1000,450);
         }
         if($slide2Count>1){
             $data['slide2'] =  fileupload($request->slide2,"slider/",1000,450);
         }
         if($slide3Count>1){
             $data['slide3'] =  fileupload($request->slide3,"slider/",1000,450);
         }
         if($slide4Count>1){
             $data['slide4'] =  fileupload($request->slide4,"slider/",1000,450);
         }




        return $setting->update($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Setting  $setting
     * @return \Illuminate\Http\Response
     */
    public function destroy(Setting $setting)
    {
        $setting->delete();
    }
}

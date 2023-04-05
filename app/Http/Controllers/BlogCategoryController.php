<?php

namespace App\Http\Controllers;

use App\Models\Blog_category;
use Illuminate\Http\Request;

class BlogCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Blog_category::all();
    }
    public function updatecategory(Request $request)
    {

        $id = $request->id;
        if($id){
            $name = $request->name;
            $Blog_category = Blog_category::find($id);
            $slug = strtolower(str_replace(" ","_",$request->slug));
            return $Blog_category->update(['name'=>$name,'slug'=>$slug]);
        }
        $name = $request->name;
        $slug = strtolower(str_replace(" ","_",$request->slug));
        $random  = sprintf("%06d", mt_rand(1, 999999));
        return Blog_category::create(['name'=>$name,'slug'=>$slug,'category_id'=>$random]);


    }
        public function getcategory(Request $request,$id)
        {
           return Blog_category::find($id);
        }
        public function deletecategory(Request $request,$id)
        {
           $Blog_category =  Blog_category::find($id);
           return $Blog_category->delete();
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
        $request->validate([
            'name' => 'required|unique:blog_categories',
            'slug' => 'required|unique:blog_categories',

        ]);



        $data = request()->except(['_token']);

        // echo '<pre>';
        // print_r($data);

        Blog_category::create($data);

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Blog_category  $blog_category
     * @return \Illuminate\Http\Response
     */
    public function show(Blog_category $blog_category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Blog_category  $blog_category
     * @return \Illuminate\Http\Response
     */
    public function edit(Blog_category $blog_category)
    {
        $count =  Blog_category::where('id',$blog_category->id)->count();

        if($count>0){


                $random  = sprintf("%06d", mt_rand(1, 999999));
                $data['category_id'] = $random;
                $rows = Blog_category::paginate(10);
                $edit_data =  $blog_category;
                $data['form_type'] = 'edit';

                return view('dashboard/blogs/categories.list',compact('edit_data','rows'),$data);

            }else{
                return redirect(route('blog-category.index'));
            }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Blog_category  $blog_category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Blog_category $blog_category)
    {

        $request->validate([
            'name' => 'required|unique:blog_categories,name,'.$blog_category->id,
            'slug' => 'required|unique:blog_categories,slug,'.$blog_category->id,

        ]);
        $data = request()->except(['_token','_method']);
        $blog_category->update($data);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Blog_category  $blog_category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Blog_category $blog_category)
    {
        $blog_category->delete();
    }
}

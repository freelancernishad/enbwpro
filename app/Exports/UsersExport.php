<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\FromCollection;

// use Illuminate\Contracts\View\View;
// use Maatwebsite\Excel\Concerns\FromView;
// class ExCommitteesExport implements FromView
class UsersExport implements FromCollection
{



    // public function view(): View
    // {
    //     return view('admin/committee.activeexcel', [
    //         'activecommittee' => committee::where('status','ex')->get()
    //     ]);
    // }



class UsersExport implements FromCollection
{

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return User::all();
    }
}

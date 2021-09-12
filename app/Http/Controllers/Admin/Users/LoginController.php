<?php

namespace App\Http\Controllers\Admin\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    public function index()
    {
        return view('admin.users.login');
    }
    public function store(Request $request)
    {
        $email = $request->input('email');
        $password = $request->input('password');
        $remember = $request->input('remember');
        $validated = $request->validate([
            'email' => 'required|email:filter',
            'password' => 'required'
        ]);
        // $this->validate($request,[
        //     'email'=>'required|email:filter',
        //     'password'=>'required'   
        // ]);

        // Check xem email va pass hop le k
        if (Auth::attempt(['email' => $email, 'password' => $password]  )) {
            return redirect()->route('admin');
        }
        // Session::flash('error','Email hoặc password không hợp lệ, vui lòng kiểm tra lại');
        $request->session()->flash('error', 'Email hoặc password không hợp lệ, vui lòng kiểm tra lại');
        return redirect()->back();
    }

}

<?php


namespace App\Http\Services\Slider;


use App\Models\Slider;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;

class SliderService
{
    public function insert($request)
    {
        try {
            Slider::create($request->all());
            Session::flash('success', 'Thêm slider thành công');

        } catch (\Exception $error) {
            Session::flash('error', 'Thêm slider thất bại');
            Log::info($error->getMessage());
            return false;
        }
        return true;
    }

    public function get()
    {
        return Slider::orderByDesc('id')->paginate(15);
    }

    public function update($request, $slider)
    {
        try {
            $slider->fill($request->all());
            $slider->save();
            Session::flash('success', "Cập nhật slider thành công");
        } catch (\Exception $error) {
            Session::flash('error', "Cập nhật slider thất bại");
            Log::info($error->getMessage());
            return false;
        }

        return true;
    }

    public function destroy($request)
    {
        $slider = Slider::where('id', $request->input('id'))->first();
        if ($slider) {
            $path = str_replace('storage', 'public', $slider->thumb);
            Storage::delete($path);
            $slider->delete();
            return true;
        }
        return false;
    }

    public function show()
    {
        return Slider::where('active', 1)->orderByDesc('sort_by')->get();

    }
}

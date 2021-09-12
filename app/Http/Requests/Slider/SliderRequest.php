<?php

namespace App\Http\Requests\Slider;

use Illuminate\Foundation\Http\FormRequest;

class SliderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required',
            'thumb' => 'required',
            'url'=>'required'
        ];
    }
    public function messages ()
    {
        return [
            'name.required' => 'Vui lòng nhập tên sản phẩm',
            'thumb.required' => 'Ảnh đại diện không được trống',
            'url.required' => 'Đường dẫn không được để trống'
        ];
    }
}

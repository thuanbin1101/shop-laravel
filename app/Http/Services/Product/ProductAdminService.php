<?php

namespace App\Http\Services\Product;

use App\Models\Menu;
use App\Models\Product;
use Illuminate\Support\Facades\Log;

class ProductAdminService
{
    const LIMIT = 16;

    public function getMenu()
    {
        return Menu::where('active', 1)->get();
    }

    protected function isValidPrice($request)
    {
        $price = $request->input('price');
        $price_sale = $request->input('price_sale');
        if ($price != 0 && $price_sale != 0 && $price <= $price_sale) {
            $request->session()->flash('error', 'Giá giảm phải nhỏ hơn giá gốc ');
            return false;
        }
        if ((int)$price == 0 && $price_sale != 0) {
            $request->session()->flash('error', 'Vui lòng nhập giá gốc ');
            return false;
        }
        return true;
    }

    public function insert($request)
    {
        $isValidPrice = $this->isValidPrice($request);
        if ($isValidPrice === false) {
            return false;
        }
        try {
            $request->except('_token');
            Product::create($request->all());
            $request->session()->flash('success', 'Thêm sản phẩm thành công');
        } catch (\Exception $err) {
            $request->session()->flash('error', 'Thêm sản phẩm lỗi');
            Log::info($err->getMessage());
            return false;
        }
        return true;
    }

    public function get()
    {
        return Product::with('menu')->orderbyDesc('id')->paginate(15);
    }

    public function update($request, $product)
    {
        $isValidPrice = $this->isValidPrice($request);
        if ($isValidPrice === false) {
            return false;
        }
        try {
            $product->fill($request->input());
            $product->save();
            $request->session()->flash('success', 'Edit sản phẩm thành công');
        } catch (\Exception $err) {
            $request->session()->flash('error', 'Edit sản phẩm lỗi');
            Log::info($err->getMessage());
            return false;
        }
        return true;
    }

    public function delete($request)
    {
        $product = Product::where('id', $request->input('id'))->first();
        if ($product) {
            $product->delete();
            return true;
        }
        return false;
    }



}

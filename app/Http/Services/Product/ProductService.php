<?php

namespace App\Http\Services\Product;

use App\Models\Menu;
use App\Models\Product;
use Illuminate\Support\Facades\Log;

class ProductService
{
    const LIMIT = 16;

    public function get($page = null)
    {
        return Product::select('id', 'name', 'price', 'price_sale', 'thumb')
            ->orderByDesc('id')
            ->limit(self::LIMIT) // Chỉ lấy 16 sản phẩm
            ->when($page != null, function ($query) use ($page) {
                $query->offset($page * self::LIMIT);
                /* Giải thích cái offset: Lúc này đang có 24 sản phẩm
                    1. $page = 0
                    => $page * limit = 0 => offset bắt đầu từ 0.
                    2. $page = 1;
                    => $page * limit = 16 => offset bắt đầu từ 16 (load more tiếp từ vị trí 16).
                    3. $page = 2;
                    => $page * limit = 32 => offset bắt đầu từ 32 (Hết sản phẩm vì lúc này chỉ có 24                      sản phẩm, mà cái offset bắt đầu từ 32 nghĩa là cần phải có <= 32 sản phẩm mới cho                     load more tiếp)
                    4. ...
                */
            })
            ->get();
    }

    public function show($id)
    {
        return Product::where('id', $id)->where('active', 1)->with('menu')->firstOrFail();
    }

    public function more($id)
    {
        return Product::select('id', 'name', 'price', 'price_sale', 'thumb')->where('active', 1)
            ->where('id', '!=', $id)
            ->orderByDesc('id')
            ->limit(8)
            ->get();
    }
}

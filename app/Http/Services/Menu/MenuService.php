<?php

namespace App\Http\Services\Menu;

use App\Models\Menu;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class MenuService
{
    protected $htmlSelected = '';

    public function create($request)
    {
        try {
            Menu::create([
                'name' => (string)$request->input('name'),
                'parent_id' => (string)$request->input('parent_id'),
                'description' => (string)$request->input('description'),
                'content' => (string)$request->input('content'),
                'active' => (string)$request->input('active'),
                // 'slug' => Str::slug($request->input('name'), '-'),
            ]);
            $request->session()->flash('success', 'Tạo danh mục thành công');
        } catch (\Exception $e) {
            $request->session()->flash('error', $e->getMessage());
            return false;
        }
        return true;
    }

    public function getMenus($id, $text = '')
    {
        $menus = Menu::all();
        foreach ($menus as $menu) {
            if ($menu->parent_id == $id) {
                $this->htmlSelected .= "<option value='$menu->id'>" . $text . $menu->name . "</option>";
                $this->getMenus($menu->id, $text . '-');
            }
        }
        return $this->htmlSelected;
    }

    public function getAll()
    {
        return Menu::orderByDesc('id')->paginate(20);
    }

    public function destroy($request)
    {
        $id = (int)$request->input('id');
        $menu = Menu::where('id', $id)->first();
        if ($menu) {
            return Menu::where('id', $id)->orWhere('parent_id', $id)->delete();
        }
        return false;
    }

    public function update($menu, $request)
    {
        // $menu->fill($request->input());
        // $menu->save();

        if ($request->input('parent_id') != $menu->id) {
            $menu->parent_id = (string)$request->input('parent_id');
        }
        $menu->name = (string)$request->input('name');
        $menu->description = (string)$request->input('description');
        $menu->content = (string)$request->input('content');
        $menu->active = (string)$request->input('active');
        $menu->save();
        $request->session()->flash('success', "Cập nhật thành công danh mục");
        return true;
    }

    public function show()
    {
        return Menu::select('name', 'id')->where('parent_id', 0)->orderByDesc('id')->limit(3)->get();

    }

    public function getId($id)
    {
        return Menu::where('id', $id)->where('active', 1)->firstOrFail(); // firstOrFail la k co thi tra ve 404 not found
    }

    public function getProduct($menu, $request)
    {
        $query = $menu->products()
            ->select('id','name', 'price', 'price_sale', 'thumb')
            ->where('active', 1);
        if ($request->input('price')) {
            $query->orderBy('price', $request->input('price'));
        }
          return $query->orderByDesc('id')
              ->paginate(12)->withQueryString();
    }

}

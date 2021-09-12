<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Menu\CreateFormRequest;
use Illuminate\Http\Request;
use App\Http\Services\Menu\MenuService;
use App\Models\Menu;
use Illuminate\Http\JsonResponse;

class MenuController extends Controller
{

    protected $menuService;

    public function __construct(MenuService $menuService)
    {
        $this->menuService = $menuService;
    }

    public function create()
    {
        $menus = $this->menuService->getMenus(0);
        return view('admin.menu.add', [
            'title' => 'Thêm danh mục mới',
            'menus' => $menus
        ]);
//        $menus = Menu::all();
//
//        $this->menuRecusive(0);
    }

    public function menuRecusive($id,$text = '')
    {
        $menus = Menu::all();
        foreach ($menus as $menu) {
            if ($menu->parent_id == $id) {
                echo $text . $menu->name . '<br>';
                $this->menuRecusive($menu->id, $text . '-');
            }
        }
    }

    public function store(CreateFormRequest $request)
    {
        $result = $this->menuService->create($request);
        return redirect()->back();
    }

    public function index()
    {
        return view('admin.menu.list', [
            'title' => 'Danh sách danh mục mới nhất',
            'menus' => $this->menuService->getAll(),
        ]);
    }

    public function destroy(Request $request): JsonResponse
    {
        $result = $this->menuService->destroy($request);
        if ($result) {
            return response()->json([
                'error' => false,
                'message' => 'Xoá thành công danh mục'
            ]);
        }
        return response()->json([
            'error' => true
        ]);
    }

    public function show(Menu $menu)
    {
        return view('admin.menu.edit', [
            'title' => 'Chỉnh sửa danh mục: ' . $menu->name,
            'menu' => $menu,
            'menus' => $this->menuService->getAll(),
        ]);
    }

    public function update(Menu $menu, CreateFormRequest $request)
    {
        $this->menuService->update($menu, $request);
        return redirect('/admin/menus/list');
    }
}

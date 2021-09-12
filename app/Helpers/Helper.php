<?php

namespace App\Helpers;

use Illuminate\Support\Str;

class Helper
{
    public static function menu($menus, $parent_id = 0, $char = '')
    {
        $html = '';
        foreach ($menus as $key => $menu) {
            if ($menu->parent_id == $parent_id) {
                $html .= '
                <tr>
                <td scope="col">' . $menu->id . '</td>
                <td scope="col">' . $char . $menu->name . '</td>
                <td scope="col">' . self::active($menu->active) . '</td>
                <td scope="col">' . $menu->updated_at . '</td>
                <td>
                    <a class="btn btn-primary btn-sm" href="/admin/menus/edit/' . $menu->id . '">
                    <i class="fas fa-edit"></i>
                    </a>

                    <a class="btn btn-danger btn-sm" onclick="removeRow(' . $menu->id . ',\'/admin/menus/destroy\')" href="">
                    <i class="fas fa-trash"></i>
                    </a>
                </td>
                </tr>
                ';
                unset($menus[$key]);

                $html .= self::menu($menus, $menu->id, $char . '--');
            }
        }
        return $html;
    }

    public static function active($active = 0): string
    {
        return $active == 0 ? '<span class="btn btn-danger btn-xs">NO</span>' : '<span class="btn btn-success btn-xs">YES</span>';
    }

    public static function menusDesktop($menus, $parent_id = 0)
    {
        $html = '';
        foreach ($menus as $key => $menu) {
            if ($menu->parent_id == $parent_id) {
                $html .= '
                <li>
                    <a href="/danh-muc/' . $menu->id . '/' . Str::slug($menu->name, '-') . '.html">
                    ' . $menu->name . '
                    </a>';
                if (self::isChild($menus, $menu->id)) {
                    $html .= '<ul class="sub-menu">';
                    $html .= self::menusDesktop($menus, $menu->id);
                    $html .= '</ul>';
                }
                $html .= '</li>';
            }
        }
        return $html;
    }

    public static function menusMobile($menus, $parent_id = 0)
    {
        $html = '';
        foreach ($menus as $key => $menu) {
            if ($menu->parent_id == $parent_id) {
                $html .= '
                <li>
                    <a href="/danh-muc/' . $menu->id . '/' . Str::slug($menu->name, '-') . '.html">
                    ' . $menu->name . '
                    </a>';
                if (self::isChild($menus, $menu->id)) {
                    $html .= '<ul class="sub-menu-m">';
                    $html .= self::menusMobile($menus, $menu->id);
                    $html .= '</ul>';
                }
                $html .= '</li>';
            }
        }
        return $html;
    }

    public static function isChild($menus, $id)
    {
        foreach ($menus as $k => $menu) {
            if ($menu->parent_id == $id) {
                return true;
            }
        }
        return false;
    }

    public static function price($price = 0, $price_sale = 0)
    {
        if ($price_sale != 0) {
            return number_format($price_sale) ;
        }
        if ($price != 0) {
            return number_format($price);
        }
        return '<a href ="/lien-he.html">Liên hệ</a>';
    }
    public static function product_price($priceFloat){
        $symbol = 'đ';
        $symbol_thousand = '.';
        $decimal_place = 0;
        $price = number_format($priceFloat, $decimal_place, '', $symbol_thousand);
        return $price.$symbol;
    }
}

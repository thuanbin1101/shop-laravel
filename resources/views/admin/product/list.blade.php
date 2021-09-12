@extends('admin.main')
@section('content')
    <table class="table">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">TÊN SẢN PHẨM</th>
                <th scope="col">Danh mục</th>
                <th scope="col">Giá gốc</th>
                <th scope="col">Giá khuyến mãi</th>
                <th scope="col">Active</th>
                <th scope="col">Update</th>
                <th scope="col">Action</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            @foreach ($products as $product)

                <tr>
                    <td scope="col">{{ $product->id }}</td>
                    <td scope="col">{{ $product->name }}</td>
                    <td scope="col">{{ $product->menu->name }}</td>
                    <td scope="col">{{ $product->price }}</td>
                    <td scope="col">{{ $product->price_sale }}</td>
                    <td scope="col">{!! \App\Helpers\Helper::active($product->active) !!}</td>
                    <td scope="col">{{ $product->updated_at }}</td>

                    <td>
                        <a class="btn btn-primary btn-sm" href="/admin/products/edit/{{ $product->id }}">
                            <i class="fas fa-edit"></i>
                        </a>

                        <a class="btn btn-danger btn-sm" onclick="removeRow({{ $product->id }},'/admin/products/destroy')"
                            href="">
                            <i class="fas fa-trash"></i>
                        </a>
                    </td>
                </tr>
            @endforeach

        </tbody>
    </table>
    {{  $products->links() }}
@endsection

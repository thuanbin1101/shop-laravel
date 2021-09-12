@extends('admin.main')
@section('content')
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Tên tiêu đề</th>
            <th scope="col">Link</th>
            <th scope="col">Ảnh</th>
            <th scope="col">Active</th>
            <th scope="col">Update</th>
            <th scope="col">Action</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        @foreach ($sliders as $slider)

            <tr>
                <td scope="col">{{ $slider->id }}</td>
                <td scope="col">{{ $slider->name }}</td>
                <td scope="col">{{ $slider->url }}</td>
                <td scope="col"><img src="{{$slider->thumb}}" alt="" width="100px"></td>
                <td scope="col">{!! \App\Helpers\Helper::active($slider->active) !!}</td>
                <td scope="col">{{ $slider->updated_at }}</td>

                <td>
                    <a class="btn btn-primary btn-sm" href="/admin/sliders/edit/{{ $slider->id }}">
                        <i class="fas fa-edit"></i>
                    </a>

                    <a class="btn btn-danger btn-sm" onclick="removeRow({{ $slider->id }},'/admin/sliders/destroy')"
                       href="">
                        <i class="fas fa-trash"></i>
                    </a>
                </td>
            </tr>
        @endforeach

        </tbody>
    </table>
    {{  $sliders->links() }}
@endsection

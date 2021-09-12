@extends('admin.main')
@section('head')
    <script src="/ckeditor/ckeditor.js"></script>
@endsection
@section('content')
    <div class="card card-primary">

        <!-- /.card-header -->
        <!-- form start -->
        <form method="POST" action="" enctype="multipart/form-data">
            @csrf
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="menu">Tên tiêu đề </label>
                            <input name="name" value="{{ $slider->name}}" type="text" class="form-control"
                                   id="exampleInputEmail1" placeholder="Nhập tên tiêu đề">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleInputPassword1">Đường dẫn</label>
                            <input type="text" name="url" value="{{$slider->url}}" class="form-control">
                        </div>
                    </div>

                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Sắp xếp</label>
                    <input type="number" class="form-control" name="sort_by" placeholder=""
                           value="{{$slider->sort_by}}">
                </div>
                <div class="form-group">
                    <label for="menu">Ảnh sản phẩm</label>
                    <input type="file" class="form-control" id="upload">
                    <div id="image_show">
                        <a href="{{$slider->thumb}}">
                            <img src="{{$slider->thumb}}" alt="">
                        </a>
                    </div>
                    <input type="hidden" name="thumb" id="thumb">
                </div>


                <label for="">Kích hoạt</label>
                <div class="custom-control custom-radio">
                    <input checked value="1" type="radio" id="customRadio1" name="active"
                           class="custom-control-input" {{ $slider->active == 1 ? 'checked=""' : '' }}>>
                    <label class="custom-control-label" for="customRadio1">Có</label>
                </div>
                <div class="custom-control custom-radio">
                    <input value="0" type="radio" id="customRadio2" name="active"
                           class="custom-control-input" {{ $slider->active == 0 ? 'checked=""' : '' }}>>
                    <label class="custom-control-label" for="customRadio2">Không</label>
                </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Cập nhật slider</button>
            </div>
        </form>
    </div>
@endsection
@section('footer')
    <script>
        CKEDITOR.replace('content');
    </script>
@endsection

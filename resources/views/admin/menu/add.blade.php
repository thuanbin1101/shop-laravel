@extends('admin.main')
@section('head')
    <script src="/ckeditor/ckeditor.js"></script>
@endsection
@section('content')
    <div class="card card-primary">

        <!-- /.card-header -->
        <!-- form start -->
        <form method="POST" action="">
            @csrf
            <div class="card-body">

                <div class="form-group">
                    <label for="menu">Tên danh mục</label>
                    <input name="name" type="text" class="form-control" id="exampleInputEmail1"
                        placeholder="Nhập tên danh mục">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Danh mục</label>
                    <select class="custom-select rounded-0" name="parent_id" id="exampleSelectRounded0">
                        <option value="0">Danh mục cha</option>
                           {!! $menus !!}
                    </select>
                </div>
                <div class="form-group">
                    <label for="menu">Mô tả</label>
                    <textarea name="description" class="form-control" id="" cols="10" rows="5"></textarea>
                </div>
                <div class="form-group">
                    <label for="menu">Mô tả chi tiết</label>
                    <textarea name="content" class="form-control" id="content" cols="30" rows="10"></textarea>
                </div>

                <div class="custom-control custom-radio">
                    <input value="1" type="radio" id="customRadio1" checked name="active" class="custom-control-input">
                    <label class="custom-control-label" for="customRadio1">Có</label>
                </div>
                <div class="custom-control custom-radio">
                    <input value="0" type="radio" id="customRadio2" name="active" class="custom-control-input">
                    <label class="custom-control-label" for="customRadio2">Không</label>
                </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Tạo danh mục</button>
            </div>
        </form>
    </div>
@endsection
@section('footer')
    <script>
        CKEDITOR.replace('content');
    </script>
@endsection

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
                            <label for="menu">Tên sản phẩm</label>
                            <input name="name" value="{{ old('name') }}" type="text" class="form-control"
                                id="exampleInputEmail1" placeholder="Nhập tên danh mục">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleInputPassword1">Danh mục</label>
                            <select class="custom-select rounded-0" name="menu_id" id="exampleSelectRounded0">
                                @foreach ($menus as $menu)
                                    <option value="{{ $menu->id }}">{{ $menu->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleInputPassword1">Giá</label>
                            <input type="number" class="form-control" name="price" placeholder="Điền giá sản phẩm"
                                value="{{ old('price') }}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleInputPassword1">Giá khuyến mãi</label>
                            <input type="number" class="form-control" placeholder="Điền giá khuyến mãi sản phẩm"
                                value="{{ old('price_sale') }}" name="price_sale">
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="menu">Ảnh sản phẩm</label>
                    <input type="file"  class="form-control" id="upload">
                    <div id="image_show">

                    </div>
                    <input type="hidden" name="thumb" id="thumb">
                </div>
                <div class="form-group">
                    <label for="menu">Mô tả</label>
                    <textarea name="description" class="form-control" id="" cols="10"
                        rows="5"> {{ old('description') }}</textarea>
                </div>
                <div class="form-group">
                    <label for="menu">Mô tả chi tiết</label>
                    <textarea name="content"  class="form-control" id="content" cols="30"
                        rows="10">{{ old('content') }}</textarea>
                </div>


                <label for="">Kích hoạt</label>
                <div class="custom-control custom-radio">
                    <input checked value="1" type="radio" id="customRadio1" name="active" class="custom-control-input">
                    <label class="custom-control-label" for="customRadio1">Có</label>
                </div>
                <div class="custom-control custom-radio">
                    <input value="0" type="radio" id="customRadio2" name="active" class="custom-control-input">
                    <label class="custom-control-label" for="customRadio2">Không</label>
                </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Tạo sản phẩm</button>
            </div>
        </form>
    </div>
@endsection
@section('footer')
    <script>
        CKEDITOR.replace('content');
    </script>
@endsection

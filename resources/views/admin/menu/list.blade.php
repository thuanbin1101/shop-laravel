@extends('admin.main')
@section('content')
<table class="table">
    <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">NAME</th>
        <th scope="col">ACTIVE</th>
        <th scope="col">Update</th>
      </tr>
    </thead>
    <tbody>
      {!! \App\Helpers\Helper::menu($menus) !!}

    </tbody>
  </table>
@endsection

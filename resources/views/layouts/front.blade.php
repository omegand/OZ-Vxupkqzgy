<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Šokių klubas </title>
    <link rel="stylesheet" href="{{asset('css/main.css')}}">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.4/css/selectize.min.css">
</head>
<body >
<div id="app" >
@include('layouts.partials.navbar')
<div class="container">
    @include('layouts.partials.error')
    @include('layouts.partials.success')
    <div class="row">
        <h2> Šokių forumas, susirask partneri!</h2>
        <br>
        @section('category')
            @include('layouts.partials.categories')
        @show
        <div class="col-md-9">
            <div class="content-wrap ">
                @yield('content')
            </div>
        </div>
    </div>
</div>
</div>
<script src="{{asset('js/app.js')}}"></script>
@yield('js')
</body>
</html>

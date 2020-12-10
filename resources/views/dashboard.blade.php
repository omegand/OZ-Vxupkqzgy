<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <title>Dashboard </title>
  <link rel="stylesheet" href="{{asset('css/app.css')}}">
</head>

<body>
  <div id="app">
    @include('layouts.partials.navbar')
    <div class="container">
      @include('layouts.partials.error')
      @include('layouts.partials.success')
    </div>
  </div>
  <script src="{{asset('js/app.js')}}"></script>
  <h3> Sukurti įviki </h3>
  <form action="{{ route('tasks.store') }}" method="post">
    {{ csrf_field() }}
    Pavadinimas
    <br />
    <input type="text" name="name" />
    <br /><br />
    Aprašymas
    <br />
    <textarea name="description"></textarea>
    <br /><br />
    Pradžios laikas
    <br />
    <input type="text" name="task_date" class="date" />
    <br /><br />
    <input type="submit" value="Kurti" />
  </form>
  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.3/jquery-ui.min.js"></script>
  <script>
    $('.date').datepicker({
      autoclose: true,
      dateFormat: "yy-mm-dd"
    });
  </script>
  <h3> Išsiūsti Newsletter </h3>
  <form action="/dashboard/mail" method="post">
    {{ csrf_field() }}
    <button type="submit">Send Newsletter</button>
  </form>
<br>
<br>
<h3> Įkėlti nuotrauka</h3>

  <div class="card-body">
    <form action="/upload" method="POST" enctype="multipart/form-data">
      <input type="file" name="image" />
      {{ csrf_field() }} 
      <input type="submit" value="upload" />
    </form>
  </div>

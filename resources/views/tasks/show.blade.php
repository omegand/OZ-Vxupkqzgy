<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Registravimas į renginius </title>
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <!-- Scripts -->
    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
        ]) !!};
    </script>
</head>
<body>
<div id="app">
@include('layouts.partials.navbar')
    <div class="container">
        @include('layouts.partials.error')
        @include('layouts.partials.success')
    </div>
</div>


<table border="1" class="styled-table">
<tr>
        <td>Renginys</td>
        <td>Laikas</td>
        <td>Aprašymas</td>
        <td>Panaikinti</td>
</tr>
@foreach($tasks as $t)
<tr>    
        <td>{{$t->name}}</td>
        <td>{{$t->task_date}}</td>
        <td>{{$t->description}}</td>
       <td> <a href="{{ route('allt',$t->id) }}">&check;</a></td>
</tr>
@endforeach
</table>
<script src="{{asset('js/app.js')}}"></script>
</body>
</html>
<style>
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    margin-left: auto; 
  margin-right: auto;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
    text-align: center; 
    vertical-align: middle;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
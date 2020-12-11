<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Registravimas į renginius </title>
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
</body>
</html>



<link href='CAL/main.min.css' rel='stylesheet' />
<script src='CAL/main.js'></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment.min.js'></script>
<script src='CAL/lt.js'></script>
<div id='calendar'></div>
<script>

        document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            locale: 'lt',
            events : [
                @foreach($tasks as $task)
                {
                    title : '{{ $task->name }}',
                    start : '{{ $task->task_date }}',
                    url : '{{ route('tasks.show', $task->id) }}'
                },
                @endforeach
            ]
        });
        calendar.render();
      });
</script>
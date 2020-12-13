<!doctype html>
  <html lang='lt'>
  <head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Registravimas į renginius </title>
    <meta charset='utf-8' />
    <link href='{{ URL::asset('fullcalendar/main.css') }}' rel='stylesheet' />
    <script src='{{ URL::asset('fullcalendar/main.js') }}'></script>
    <script src='fullcalendar/lt.js'></script>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          locale: 'lt',
          events: [
            @foreach($tasks as $task) {
              title: '{{ $task->name }}',
              start: '{{ $task->task_date }}',
              url: '{{ route('tasks.show', $task->id) }}'
            },
            @endforeach
          ]
        });
        calendar.render();
      });
    </script>
  </head>
  <body>
    <div id="app">
      @include('layouts.partials.navbar')
      <div class="container">
        @include('layouts.partials.success')
      </div>
    </div>
    <div id='calendar'></div>
  </body>
  </html>
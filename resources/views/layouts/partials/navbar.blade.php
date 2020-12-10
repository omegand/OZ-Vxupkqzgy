<nav class="navbar navbar-inverse navbar-static-top">
    <div class="container">
        <div class="navbar-header">
         <!-- Branding Image -->
        <a class="navbar-brand" href="{{ url('/') }}">
        Pradinis
        </a>
            <!-- Right Side Of Navbar -->
            <ul class="nav navbar-nav navbar-right">
                <!-- Authentication Links -->
                @if (Auth::guest())
                    <li><a href="{{ route('login') }}">Prisijungti</a></li>
                    <li><a href="{{ route('register') }}">Registruotis</a></li>
                @else
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            {{ Auth::user()->name }} <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="{{ route('logout') }}"
                                   onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                    Atsijungti
                                </a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                      style="display: none;">
                                    {{ csrf_field() }}
                                </form>
                            </li>
                        </ul>
                        <li><a href="{{ route('tasks.index') }}">Registracija į užsiemimus</a></li>
                        <li><a href="{{ route('allt') }}">Registracijų redagavimas</a></li>


                    </li>
                @endif
            </ul>
        </div>
    </div>
</nav>
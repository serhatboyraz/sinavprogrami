<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/Sinav/Liste">Sınav Programı</a>
        </div>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="nav navbar-nav">
                <li><a href="/Sinav/Liste">Sınav Takvimi</a></li>

                {% if hoca.admin=='X' %}
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Hoca İşlemleri
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/Hoca/Liste">Hocalar</a></li>
                        <li><a href="/Hoca/Ekle">Hoca Ekle</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Ders İşlemleri
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/Ders/Liste">Dersler</a></li>
                        <li><a href="/Ders/Ekle">Ders Ekle</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Derslik İşlemleri
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/Derslik/Liste">Derslikler</a></li>
                        <li><a href="/Derslik/Ekle">Derslik Ekle</a></li>
                    </ul>
                </li>
                {% endif %}
                <li>
                    <a href="/Index/Cikis">Çıkış</a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                {% if hoca != null%}
                <li><a href="#">Hoşgeldiniz {{hoca.adsoyad}}</a></li>
                {% endif %}
            </ul>
        </div>
    </div>
</nav>
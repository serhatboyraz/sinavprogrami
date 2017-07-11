{% include "layouts/header.volt" %}
{% include "layouts/topmenu.volt" %}

<h1>Hocalar</h1>
<table class="table table-striped">
    <tr>
        <td>Id</td>
        <td>Ad Soyad</td>
        <td>Mail</td>
        <td width="20%">#</td>
    </tr>
    {% for hocaVeri in Hocalar %}
        <tr>
            <td>{{ hocaVeri.id }}</td>
            <td>{{ hocaVeri.adsoyad }}</td>
            <td>{{ hocaVeri.mail }}</td>
            <td>
                {% if hocaVeri.id!=hoca.id %}
                    <a class="btn btn-danger" href="/Hoca/Sil/{{ hocaVeri.id }}">Sil</a> |
                {% endif %}
                <a class="btn btn-warning" href="/Hoca/Duzenle/{{ hocaVeri.id }}">Duzenle</a>
            </td>
        </tr>
    {% endfor %}

</table>
{% include "layouts/footer.volt" %}
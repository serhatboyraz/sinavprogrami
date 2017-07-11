{% include "layouts/header.volt" %}
{% include "layouts/topmenu.volt" %}

<h1>Dersler</h1>
<table class="table table-striped">
    <tr>
        <td>Kod</td>
        <td>Ad</td>
        <td width="20%">#</td>

    </tr>
    {% for ders in Dersler %}
    <tr>
        <td>{{ders.kod}}</td>
        <td>{{ders.ad}}</td>
        <td>
            <a class="btn btn-danger" href="/Ders/Sil/{{ders.kod}}">Sil</a>
        </td>
    </tr>
    {% endfor %}

</table>
{% include "layouts/footer.volt" %}
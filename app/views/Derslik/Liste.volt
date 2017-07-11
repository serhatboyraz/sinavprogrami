{% include "layouts/header.volt" %}
{% include "layouts/topmenu.volt" %}

<h1>Derslikler</h1>
<table class="table table-striped">
    <tr>
        <td>Kod</td>
        <td width="20%">#</td>

    </tr>
    {% for derslik in Derslikler %}
        <tr>
            <td>{{ derslik.kod }}</td>
            <td>
                <a class="btn btn-danger" href="/Derslik/Sil/{{ derslik.kod }}">Sil</a>
            </td>
        </tr>
    {% endfor %}
</table>
{% include "layouts/footer.volt" %}
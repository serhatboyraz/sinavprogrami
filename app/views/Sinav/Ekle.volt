{% include "layouts/header.volt" %}
{% include "layouts/topmenu.volt" %}

<center><h1>Sınav Ekle</h1></center>
{% if message %}
<p class="alert alert-danger">
    {{message}}
</p>
{% endif %}
<form action="/Sinav/Ekle" method="post">
    <table align="center" cellpadding="5">
        <tr>
            <td>Ders</td>
            <td>
                <select name="ders" class="form-control">
                    {% for ders in Dersler%}
                    <option value="{{ders.kod}}">{{ders.ad}}
                    </option>
                    {% endfor %}
                </select>
            </td>
        </tr>
        <tr>
            <td>Derslik</td>
            <td>
                <select name="derslik" class="form-control">
                    {% for derslik in Derslikler%}
                    <option value="{{derslik.kod}}">{{derslik.kod}}
                    </option>
                    {% endfor %}
                </select>
            </td>
        </tr>
        <tr>
            <td>Hocalar</td>
            <td>
                <select name="hocalar[]" multiple class="form-control">
                    {% for hoca in Hocalar %}
                    <option value="{{hoca.id}}" >{{hoca.adsoyad}}
                    </option>
                    {% endfor %}
                </select>
            </td>
        </tr>
        <tr>
            <td>Tarih</td>
            <td><input type="date" name="tarih" class="form-control"></td>
        </tr>
        <tr>
            <td>Başlangıç Saati</td>
            <td><input type="time" name="baslangicsaat" class="form-control"></td>
        </tr>
        <tr>
            <td>Bitiş Saati</td>
            <td><input type="time" name="bitissaat" class="form-control"></td>
        </tr>
        <tr>
            <td colspan="2" align="right"><input type="submit" value="Kaydet" class="btn btn-primary"></td>
        </tr>
    </table>
</form>

{% include "layouts/footer.volt" %}
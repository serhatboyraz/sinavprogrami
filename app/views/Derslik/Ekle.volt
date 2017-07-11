{% include "layouts/header.volt" %}
{% include "layouts/topmenu.volt" %}

<form class="form-horizontal col-lg-4 col-lg-offset-4" action="/Derslik/Ekle" method="post">
    <h1 class="text-center">Derslik Ekle</h1>
    <div class="form-group">
        <label for="kod">Derslik Kodu :</label>
        <input type="text" class="form-control" id="kod" name="kod">
    </div>
    <button type="submit" class="btn btn-default">Kaydet</button>
</form>

{% include "layouts/footer.volt" %}
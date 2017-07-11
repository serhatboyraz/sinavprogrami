{% include "layouts/header.volt" %}
{% include "layouts/topmenu.volt" %}
<form class="form-horizontal col-lg-4 col-lg-offset-4" action="/Hoca/Ekle" method="post">
    <h1 class="text-center">Hoca Ekle</h1>
    <div class="form-group">
        <label for="adsoyad">Ad Soyad:</label>
        <input type="text" class="form-control" id="adsoyad" name="adsoyad">
    </div>
    <div class="form-group">
        <label for="mail">EPosta:</label>
        <input type="text" class="form-control" id="mail" name="mail">
    </div>
    <div class="form-group">
        <label for="sifre">Şifre:</label>
        <input type="password" class="form-control" id="sifre" name="sifre">
    </div>
    <div class="checkbox">
        <label><input type="checkbox" name="admin" value="X"> Yönetici</label>
    </div>
    <button type="submit" class="btn btn-default">Kaydet</button>
</form>
{% include "layouts/footer.volt" %}
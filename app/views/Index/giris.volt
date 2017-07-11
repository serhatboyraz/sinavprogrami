{% include "layouts/header.volt" %}
<div class="loginmodal-container">
    <h1>Giriş</h1><br>
    <form action="/Index/Giris" method="post">
        <input type="text" name="mail" placeholder="Mail">
        <input type="password" name="sifre" placeholder="Şifre">
        <input type="submit" name="login" class="login loginmodal-submit" value="Giriş">
        {% if hataMesaji != null %}
        <div class="alert alert-danger">
            {{ hataMesaji }}
        </div>
        {% endif %}
    </form>
</div>
{% include "layouts/footer.volt" %}
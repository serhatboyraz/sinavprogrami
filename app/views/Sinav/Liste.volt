{% include "layouts/header.volt" %}
{% include "layouts/topmenu.volt" %}
<button class="btn btn-primary yazdirBtn" onclick="window.print();">Yazdır</button>
{% if hoca.admin=='X' %}
    <div id="sinavEkleFormDiv" class="sinavEkleForm">
        <div id="sinavEkleFormBaslik">Sinav Ekle</div>
        <div id="sinavEkleFormAnaForm">
            {% if message %}
                <p class="alert alert-danger">
                    {{ message }}
                </p>
            {% endif %}
            <form id="sinavEkleForm">
                <table align="center" cellpadding="5">
                    <tr>
                        <td>Ders</td>
                        <td>
                            <select name="ders" class="form-control">
                                {% for ders in Dersler %}
                                    <option value="{{ ders.kod }}">{{ ders.ad }}
                                    </option>
                                {% endfor %}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Derslik</td>
                        <td>
                            <select name="derslik" class="form-control">
                                {% for derslik in Derslikler %}
                                    <option value="{{ derslik.kod }}">{{ derslik.kod }}
                                    </option>
                                {% endfor %}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Sorumlu Hoca</td>
                        <td>
                            <select name="sorumluHoca" class="form-control">
                                {% for hoca in Hocalar %}
                                    <option value="{{ hoca.id }}">{{ hoca.adsoyad }}
                                    </option>
                                {% endfor %}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Gözetmen Hoca</td>
                        <td>
                            <select name="gozetmenHoca" class="form-control">
                                {% for hoca in Hocalar %}
                                    <option value="{{ hoca.id }}">{{ hoca.adsoyad }}
                                    </option>
                                {% endfor %}
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Tarih</td>
                        <td><input type="date" name="tarih" class="form-control" id="yeniTarih"></td>
                    </tr>
                    <tr>
                        <td>Başlangıç Saati</td>
                        <td><input type="time" name="baslangicsaat" class="form-control" id="yeniBaslangicSaat"></td>
                    </tr>
                    <tr>
                        <td>Bitiş Saati</td>
                        <td><input type="time" name="bitissaat" class="form-control" id="yeniBitisSaat"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right"><a class="btn btn-danger"
                                                         id="sinavFormIptal">Iptal</a><input type="submit"
                                                                                             class="btn btn-primary"
                                                                                             id="sinavEkleFormKaydet"
                                                                                             value="Kaydet"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
{% endif %}
<div id='takvim'></div>
<div id="detayPenceresi" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Sınav Detayları</h4>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>Ders Kodu</td>
                        <td>
                            <div id="detayDersKodu"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Ders Adı</td>
                        <td>
                            <div id="detayDers"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Derslik</td>
                        <td>
                            <div id="detayDerslik"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Sorumlu Hoca</td>
                        <td>
                            <div id="detaySorumluHoca"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Gözetmen Hoca</td>
                        <td>
                            <div id="detayGozetmenHoca"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Tarih</td>
                        <td>
                            <div id="detayTarih"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Başlangıç Saati</td>
                        <td>
                            <div id="detayBaslangicSaat"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Bitiş Saati</td>
                        <td>
                            <div id="detaybitisSaati"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <a id="detaySilLink" class="btn btn-danger" href="">Sil</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    </div>
</div>
{{ javascript_include("js/fullcalendar.min.js") }}
{{ javascript_include("js/tr.js") }}


<script>
    $(document).ready(function () {

        $('#sinavFormIptal').click(function () {
            $('#sinavEkleFormAnaForm').slideUp();
        });
        $('#takvim').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'agendaWeek,agendaDay,listWeek'
            },
            defaultDate: moment().format("YYYY-MM-DD"),
            allDaySlot: false,
            navLinks: true,
            editable: false,
            minTime: "08:00:00",
            maxTime: "22:00:00",
            defaultView: 'agendaWeek',
            eventLimit: true,
            selectable: true,
            height: 'auto',
            events: [
                {% for sinav in Sinavlar %}
                {
                    start: moment({{ sinav.sinavtarih }}{{ sinav.sinavbaslangicsaat }}, "YYYYMMDDHHmm"),
                    end: moment({{ sinav.sinavtarih }}{{ sinav.sinavbitissaat }}, "YYYYMMDDHHmm"),
                    title: "{{ sinav.dersAd }} / {{ sinav.derslikkod }}",
                    id: '{{ sinav.id }}',
                    gozetmenhocaAd: '{{ sinav.gozetmenhocaAd }}',
                    sorumluhocaAd: '{{ sinav.sorumluhocaAd }}',
                    dersAd: '{{ sinav.dersAd }}',
                    derskod: '{{ sinav.derskod }}',
                    derslikkod: '{{ sinav.derslikkod }}',
                    sinavtarih: '{{ sinav.sinavtarih }}',
                    sinavbaslangicsaat: '{{ sinav.sinavbaslangicsaat }}',
                    sinavbitissaat: '{{ sinav.sinavbitissaat }}'
                },
                {% endfor %}
            ],
            eventClick: function (calEvent, jsEvent, view) {
                $('#detaySilLink').attr('href', '/Sinav/sil/' + calEvent.id);
                $('#detayId').html(calEvent.id);
                $('#detayDersKodu').html(calEvent.derskod);
                $('#detayDers').html(calEvent.dersAd);
                $('#detayDerslik').html(calEvent.derslikkod);
                $('#detaySorumluHoca').html(calEvent.sorumluhocaAd);
                $('#detayGozetmenHoca').html(calEvent.gozetmenhocaAd);
                $('#detayTarih').html(moment(calEvent.sinavtarih, "YYYYMMDD").format('DD/MM/YYYY'));
                $('#detayBaslangicSaat').html(moment(calEvent.sinavbaslangicsaat, "HHmm").format('HH:mm'));
                $('#detaybitisSaati').html(moment(calEvent.sinavbitissaat, "HHmm").format('HH:mm'));
                $('#detayPenceresi').modal();
            },
            select: function (start, end, jsEvent, view) {
                $('#yeniTarih').val(moment(start).format('YYYY-MM-DD'));
                $('#yeniBaslangicSaat').val(moment(start).format('HH:mm'));
                if (moment(end).format('mm').toString() == '00') {
                    $('#yeniBitisSaat').val(moment(end).add(-10, 'minutes').format('HH:mm'));
                } else {
                    $('#yeniBitisSaat').val(moment(end).format('HH:mm'));
                }

                $('#sinavEkleFormAnaForm').slideDown();
            }
        });

        $('#sinavEkleFormBaslik').click(function () {
            $('#sinavEkleFormAnaForm').slideToggle();
        });
        $('#sinavEkleForm').submit(function (e) {
            var formVerisi = $('#sinavEkleForm').serialize();
            $.ajax({
                type: 'POST',
                url: '/Sinav/Ekle',
                data: formVerisi,
                success: function (gelenVeri) {
                    if (gelenVeri.sonuc) {
                        window.location = '/Sinav/Liste';
                    } else {
                        alert(gelenVeri.mesaj);
                    }
                }
            });
            e.preventDefault();
        });
    });
</script>

<style>
    .yazdirBtn{
        z-index: 999;
        position: absolute;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        border: 1px solid #ddd;
        left: 13%;
    }
    .sinavEkleForm {
        z-index: 999;
        width: 286px;
        position: absolute;
        background: #f5f5f5;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        border: 1px solid #ddd;
        right: 14%;

    }

    #sinavEkleFormBaslik {
        border-bottom: 1px solid #ddd;
        border-radius: 3px 3px 0 0;
        color: #fff;
        cursor: pointer;
        margin-bottom: 5px;
        text-align: center;
        background: #337ab7;
        height: 30px;
        padding: 5px;

    }

    #sinavEkleFormAnaForm {
        display: none;

    }
</style>
{% include "layouts/footer.volt" %}
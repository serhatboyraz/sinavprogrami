<?php

class SinavController extends ControllerBase
{

    public function ListeAction()
    {
        $this->GirisiKontrolEt();

        $builder = new \Phalcon\Mvc\Model\Query\Builder();
        $builder->from([
            "Sinavlar"
        ]);

        $builder->join("Hocalar", "Sinavlar.sorumluhoca = sorumluhoca.id", "sorumluhoca", "LEFT");
        $builder->join("Hocalar", "Sinavlar.gozetmenhoca = gozetmenhoca.id", "gozetmenhoca", "LEFT");
        $builder->join("Dersler", "Sinavlar.derskod = ders.kod", "ders", "LEFT");
        $builder->columns([
            "gozetmenhocaAd" => "gozetmenhoca.adsoyad",
            "sorumluhocaAd" => "sorumluhoca.adsoyad",
            "dersAd" => "ders.ad",
            "derskod" => "ders.kod",
            "sinavtarih" => "Sinavlar.sinavtarih",
            "derslikkod" => "Sinavlar.derslikkod",
            "id" => "Sinavlar.id",
            "sinavbaslangicsaat" => "Sinavlar.sinavbaslangicsaat",
            "sinavbitissaat" => "Sinavlar.sinavbitissaat",

        ]);
        $sinavlar = $builder->getQuery()->execute();

        $this->view->Sinavlar = $sinavlar;


        $hocalarView = Hocalar::find();
        $this->view->Hocalar = $hocalarView;

        $derslikler = Derslikler::find();
        $this->view->Derslikler = $derslikler;

        $dersler = Dersler::find();
        $this->view->Dersler = $dersler;
        $this->view->message = "";
    }

    public function EkleAction()
    {
        $this->GirisiKontrolEt();
        $this->view->message = "";

        $hocalarView = Hocalar::find();
        $this->view->Hocalar = $hocalarView;

        $derslikler = Derslikler::find();
        $this->view->Derslikler = $derslikler;

        $dersler = Dersler::find();
        $this->view->Dersler = $dersler;

        $this->view->SecilenDerslik = '';
        $this->view->SecilenTarih = '';
        $this->view->SecilenBaslangicSaat = '';
        $this->view->SecilenBitisSaat = '';
        $this->view->SecilenHocalar = array();
        $this->view->SecilenDers = '';

        $this->SinavEkle();
        $this->view->disable();

    }

    private function SinavEkle()
    {
        $this->response->setHeader('Content-Type', 'application/json');
        if ($this->request->isPost()) {
            $ders = $this->request->getPost('ders');
            $this->view->SecilenDers = $ders;

            $derslik = $this->request->getPost('derslik');
            $this->view->SecilenDerslik = $derslik;

            $tarih = $this->request->getPost('tarih');
            $this->view->SecilenTarih = $tarih;

            $baslangicsaat = $this->request->getPost('baslangicsaat');
            $this->view->SecilenBaslangicSaat = $baslangicsaat;

            $bitissaat = $this->request->getPost('bitissaat');

            $this->view->SecilenBitisSaat = $bitissaat;

            $tarih = str_replace('-', '', $tarih);
            $baslangicsaat = str_replace(':', '', $baslangicsaat);
            $bitissaat = str_replace(':', '', $bitissaat);

            $sorumluHoca = $this->request->getPost('sorumluHoca');
            $gozetmenHoca = $this->request->getPost('gozetmenHoca');
            if (!(strlen($ders) > 0 &&
                strlen($derslik) > 0 &&
                strlen($sorumluHoca) > 0 &&
                strlen($gozetmenHoca) > 0 &&
                strlen($tarih) == 8 &&
                strlen($baslangicsaat) == 4 &&
                strlen($bitissaat) == 4
            )
            ) {
                echo json_encode(array("sonuc" => false, "mesaj" => "Lutfen tum alanlari doldurun."));
                return;
            }

            if (date('Ymd') > $tarih) {
                echo json_encode(array("sonuc" => false, "mesaj" => "Sınav tarihi bu günden daha eski olamaz"));
                return;
            }

            if (date('Ymd') == $tarih && date('H1m') > $baslangicsaat) {
                echo json_encode(array("sonuc" => false, "mesaj" => "Sınav baslangic saati simdiden daha eski olamaz"));
                return;
            }

            if ($bitissaat < $baslangicsaat) {

                echo json_encode(array("sonuc" => false, "mesaj" => "Bitiş saati başlangıç saatinden küçük olamaz."));
                return;
            }
//            if ($sorumluHoca == $gozetmenHoca) {
//                echo json_encode(array("sonuc" => false, "mesaj" => "Sorumlu hoca ile gözetmen hocanın farklı olması gerekiyor."));
//                return;
//            }


            $sinavKontrol = Sinavlar::findFirst([
                "conditions" => "derslikkod=?1 AND  sinavtarih=?2 AND 
                 (
                (sinavbaslangicsaat>=?3 AND sinavbaslangicsaat<=?4 AND sinavbitissaat>=?4) OR 
                (sinavbaslangicsaat<=?3 AND sinavbitissaat>=?3 AND sinavbitissaat<=?4) OR 
                (sinavbaslangicsaat<=?3 AND sinavbitissaat>=?4) OR 
                (sinavbaslangicsaat>=?3 AND sinavbitissaat<=?4) 
                ) ",
                "bind" => [
                    1 => $derslik,
                    2 => $tarih,
                    3 => $baslangicsaat,
                    4 => $bitissaat
                ]
            ]);

            if ($sinavKontrol != null) {
                $mesaj = $tarih . " tarihinde " . $derslik . " dersliğinde " .
                    stringInsert($sinavKontrol->sinavbaslangicsaat, 2, ':') . "-" . stringInsert($sinavKontrol->sinavbitissaat, 2, ':') .
                    " saatinde sinav oldugu icin bu sinav kaydedilmedi !";
                echo json_encode(array("sonuc" => false, "mesaj" => $mesaj));
                return;
            }

            $tumSinavlar = Sinavlar::find([
                "sinavtarih=?1 AND 
                 (
              (sinavbaslangicsaat>=?2 AND sinavbaslangicsaat<=?3 AND sinavbitissaat>=?3) OR 
                (sinavbaslangicsaat<=?2 AND sinavbitissaat>=?2 AND sinavbitissaat<=?3) OR 
                (sinavbaslangicsaat<=?2 AND sinavbitissaat>=?3) OR 
                (sinavbaslangicsaat>=?2 AND sinavbitissaat<=?3) 
                )",
                "bind" => [
                    1 => $tarih,
                    2 => $baslangicsaat,
                    3 => $bitissaat
                ]
            ]);

            foreach ($tumSinavlar as $tSinav) {
                //hocalar burada kontrol edilecek.
                if ($tSinav->sorumluhoca == $sorumluHoca || $tSinav->sorumluhoca == $gozetmenHoca) {
                    $hoca = Hocalar::findFirst($tSinav->sorumluhoca);
                    $mesaj = $hoca->adsoyad . " isimli sorumlu hocanın seçilen saatte sınavı olduğu için sınav kaydedilemedi.";
                    echo json_encode(array("sonuc" => false, "mesaj" => $mesaj));
                    return;
                } else if ($tSinav->gozetmenhoca == $gozetmenHoca || $tSinav->gozetmenhoca == $sorumluHoca) {
                    $hoca = Hocalar::findFirst($tSinav->gozetmenhoca);
                    $mesaj = $hoca->adsoyad . " isimli gözetmen hocanın seçilen saatte sınavı olduğu için sınav kaydedilemedi.";
                    echo json_encode(array("sonuc" => false, "mesaj" => $mesaj));
                    return;
                }
            }


            $sinav = new Sinavlar();
            $sinav->derskod = $ders;
            $sinav->derslikkod = $derslik;
            $sinav->sinavbaslangicsaat = $baslangicsaat;
            $sinav->sinavbitissaat = $bitissaat;
            $sinav->sinavtarih = $tarih;
            $sinav->sorumluhoca = $sorumluHoca;
            $sinav->gozetmenhoca = $gozetmenHoca;
            if ($sinav->save() == false) {
                foreach ($sinav->getMessages() as $message) {
                    echo $message, "\n";
                }
            } else {
                echo json_encode(array("sonuc" => true, "mesaj" => "Sinav eklendi"));
                return;
            }
        } else {
            echo json_encode(array("sonuc" => false, "mesaj" => "Bu istek post olmali."));
            return;
        }
    }

    public function silAction($sinavId)
    {
        $this->GirisiKontrolEt();

        $sinav = Sinavlar::findFirst([
            "id=:id:",
            "bind" => [
                "id" => $sinavId
            ]
        ]);

        if (!$sinav) {
            $this->response->redirect('/Sinav/Liste');
            return;
        }
        $sinav->delete();
        $this->response->redirect('/Sinav/Liste');
    }

}


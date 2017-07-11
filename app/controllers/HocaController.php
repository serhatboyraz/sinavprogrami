<?php

class HocaController extends ControllerBase
{

    public function EkleAction()
    {
        $this->GirisiKontrolEt();

        if ($this->request->isPost()) {
            $adsoyad = $this->request->getPost('adsoyad');
            $sifre = $this->request->getPost('sifre');
            $mail = $this->request->getPost('mail');
            $admin = $this->request->getPost('admin');

            $sifre = $this->security->hash($sifre);
            $hoca = new Hocalar();
            $hoca->mail = $mail;
            $hoca->sifre = $sifre;
            $hoca->adsoyad = $adsoyad;
            $hoca->admin = $admin;

            if ($hoca->save() == false) {

            } else {
                //basarili.
                $this->response->redirect('/Hoca/Liste');
            }
        }


    }

    public function ListeAction()
    {
        $this->GirisiKontrolEt();

        $hocalar = Hocalar::find();
        $this->view->Hocalar = $hocalar;
    }

    public function silAction($hocaId)
    {
        $this->GirisiKontrolEt();

        $hoca = Hocalar::findFirst([
            "id=:id:",
            "bind" => [
                "id" => $hocaId
            ]
        ]);
        if (!$hoca) {
            $this->response->redirect('/Hoca/Liste');
            return;
        }
        $hoca->delete();
        $this->response->redirect('/Hoca/Liste');
    }

    public function duzenleAction($hocaId)
    {
        $this->GirisiKontrolEt();
        $hoca = Hocalar::findFirst([
            "id=:id:",
            "bind" => [
                "id" => $hocaId
            ]
        ]);
        if (!$hoca) {
            $this->response->redirect('/Hoca/Liste');
            return;
        }

        if ($this->request->isPost()) {
            $adsoyad = $this->request->getPost('adsoyad');
            $sifre = $this->request->getPost('sifre');
            $admin = $this->request->getPost('admin');

            $hoca->adsoyad = $adsoyad;
            $hoca->admin = $admin;

            if (strlen($sifre) > 0)
                $hoca->sifre = $this->security->hash($sifre);

            if ($hoca->save() == false) {

            } else {
                //basarili.
                $this->response->redirect('/Hoca/Liste');
            }
        }

        $this->view->hocaVeri = $hoca;
    }

}


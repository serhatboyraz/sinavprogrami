<?php
use Phalcon\Filter;

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $this->GirisiKontrolEt();
        $this->dispatcher->forward(array(
            'controller' => 'Sinav',
            'action' => 'Liste'
        ));
    }

    public function GirisAction()
    {
        $this->view->hataMesaji = null;
        if ($this->request->isPost()) {
            $mail = $this->request->getPost('mail');
            $sifre = $this->request->getPost('sifre');

            if (strlen($mail) < 3 || strlen($sifre) < 3) {
                $this->view->hataMesaji = "Mail ve şifre 4 karakterden fazla olmalı";
                return;
            }
            $filter = new Filter();
            $mail = $filter->sanitize($mail, "email");
            $hoca = Hocalar::findFirst([
                "mail=:mail:",
                "bind" => [
                    "mail" => $mail
                ]
            ]);

            if ($hoca !== false) {
                if ($this->security->checkHash($sifre, $hoca->sifre)) {
                    //hoca giris yapti
                    $hocaArr = array(
                        'id' => $hoca->id,
                        'adsoyad' => $hoca->adsoyad,
                        'admin' => $hoca->admin,
                        'mail' => $hoca->mail
                    );
                    $this->session->set("hoca", $hoca);
                    $this->response->redirect('./Sinav/Liste');

                }else{
                    $this->view->hataMesaji = "Şifre hatalı!";
                    return;
                }
            }else{
                $this->view->hataMesaji = "Mail hatalı!";
                return;
            }
        }
    }

    public function CikisAction()
    {
        $this->GirisiKontrolEt();
        $this->session->destroy();

        $this->response->redirect('Index/giris');
    }
}


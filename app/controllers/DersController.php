<?php

class DersController extends ControllerBase
{

    public function EkleAction()
    {
        $this->GirisiKontrolEt();

        if ($this->request->isPost()) {
            $kod = $this->request->getPost('kod');
            $ad = $this->request->getPost('ad');


            $ders = new Dersler();
            $ders->ad = $ad;
            $ders->kod = $kod;

            if ($ders->save() == false) {

            } else {
                //basarili.
                $this->response->redirect('/Ders/Liste');
            }
        }


    }

    public function ListeAction()
    {
        $this->GirisiKontrolEt();

        $dersler = Dersler::find();
        $this->view->Dersler = $dersler;
    }

    public function silAction($dersId)
    {
        $this->GirisiKontrolEt();

        $ders = Dersler::findFirst([
            "kod=:kod:",
            "bind" => [
                "kod" => $dersId
            ]
        ]);
        if (!$ders) {
            $this->response->redirect('/Ders/Liste');
            return;
        }
        $ders->delete();
        $this->response->redirect('/Ders/Liste');
    }


}


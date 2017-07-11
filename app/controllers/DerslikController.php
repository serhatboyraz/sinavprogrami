<?php

class DerslikController extends ControllerBase
{

    public function EkleAction()
    {
        $this->GirisiKontrolEt();

        if ($this->request->isPost()) {
            $kod = $this->request->getPost('kod');
            $derslik = new Derslikler();
            $derslik->kod = $kod;
            if ($derslik->save() == false) {

            } else {
                //basarili.
                $this->response->redirect('/Derslik/Liste');
            }
        }
    }

    public function ListeAction()
    {
        $this->GirisiKontrolEt();

        $derslikler = Derslikler::find();
        $this->view->Derslikler = $derslikler;
    }

    public function silAction($derslikId)
    {
        $this->GirisiKontrolEt();

        $derslik = Derslikler::findFirst([
            "kod=:kod:",
            "bind" => [
                "kod" => $derslikId
            ]
        ]);
        if (!$derslik) {
            $this->response->redirect('/Derslik/Liste');
            return;
        }
        $derslik->delete();
        $this->response->redirect('/Derslik/Liste');
    }

}


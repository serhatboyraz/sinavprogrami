<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{

    public function onConstruct()
    {
        if ($this->session->has("hoca")) {
            $this->view->hoca = $this->session->get("hoca");
        } else {
            $this->view->hoca = null;
        }
    }

    public function GirisiKontrolEt()
    {
        if ($this->session->has("hoca")) {
            return $this->session->get("hoca");
        }
        $this->dispatcher->forward(array(
            'controller' => 'Index',
            'action' => 'giris'
        ));
    }
}

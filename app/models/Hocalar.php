<?php

class Hocalar extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $mail;

    /**
     *
     * @var string
     * @Column(type="string", length=32, nullable=true)
     */
    public $sifre;

    /**
     *
     * @var string
     * @Column(type="string", length=1, nullable=true)
     */
    public $admin;

    /**
     *
     * @var string
     * @Column(type="string", length=150, nullable=true)
     */
    public $adsoyad;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'Hoca2sinav', 'hocaid', ['alias' => 'Hoca2sinav']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'hocalar';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Hocalar[]|Hocalar
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Hocalar
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}

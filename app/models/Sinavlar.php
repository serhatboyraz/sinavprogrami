<?php

class Sinavlar extends \Phalcon\Mvc\Model
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
     * @Column(type="string", length=30, nullable=true)
     */
    public $derskod;

    /**
     *
     * @var string
     * @Column(type="string", length=30, nullable=true)
     */
    public $derslikkod;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=true)
     */
    public $sinavtarih;

    /**
     *
     * @var string
     * @Column(type="string", length=6, nullable=true)
     */
    public $sinavbaslangicsaat;

    /**
     *
     * @var string
     * @Column(type="string", length=6, nullable=true)
     */
    public $sinavbitissaat;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $sorumluhoca;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $gozetmenhoca;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('id', 'Hoca2sinav', 'sinavid', ['alias' => 'Hoca2sinav']);
        $this->belongsTo('derslikkod', '\Derslikler', 'kod', ['alias' => 'Derslikler']);
        $this->belongsTo('derskod', '\Dersler', 'kod', ['alias' => 'Dersler']);
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Sinavlar[]|Sinavlar
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Sinavlar
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'sinavlar';
    }

}

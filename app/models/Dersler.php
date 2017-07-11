<?php

class Dersler extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     * @Primary
     * @Column(type="string", length=30, nullable=false)
     */
    public $kod;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $ad;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('kod', 'Sinavlar', 'derskod', ['alias' => 'Sinavlar']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'dersler';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Dersler[]|Dersler
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Dersler
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}

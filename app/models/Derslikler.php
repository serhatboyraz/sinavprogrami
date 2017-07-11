<?php

class Derslikler extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var string
     * @Primary
     * @Column(type="string", length=30, nullable=false)
     */
    public $kod;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->hasMany('kod', 'Sinavlar', 'derslikkod', ['alias' => 'Sinavlar']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'derslikler';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Derslikler[]|Derslikler
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Derslikler
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}

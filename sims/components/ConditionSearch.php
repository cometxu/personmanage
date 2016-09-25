<?php
/**
 * Created by PhpStorm.
 * User: locky
 * Date: 2016/9/3
 * Time: 16:37
 */
namespace sims\components;
use Yii;
use yii\base\Widget;
use sims\models\Admin;
class ConditionSearch extends Widget{
    public $fields;
    public $button_list;
    public $chosen_list;
    public $search_obj;
    public function init(){
        parent::init();
    }

    public function run(){
        return $this -> render('search',[
            'fields' => $this->fields,
            'button_list' => $this->button_list,
            'chosen_list' => $this->chosen_list,
            'search_obj' => $this->search_obj
        ]);
    }
}
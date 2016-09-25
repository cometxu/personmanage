<?php
namespace sims\components;
use Yii;
use yii\base\Widget;
use sims\models\Admin;
class TopWidget extends Widget{
    public function init(){
        parent::init();
    }

    public function run(){
        $admin = Admin::findById(Yii::$app -> user -> id);
        return $this -> render('top',['admin' => $admin]);
    }
}

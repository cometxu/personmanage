<?php

namespace sims\controllers;

use Yii;
use sims\components\CController;
use sims\models\Admin;
use sims\models\Menu;

class ShortcutController extends CController
{
    public function actionIndex()
    {
        $request = Yii::$app->request;
        $admin = new Admin();
        $id = \Yii::$app -> user -> id;
        $adminData = $admin ->findOne(['id'=>$id]);
        $menu = new Menu();
        $menuList = $menu ->getUserLeftMenu($id);
        if($request->isPost){
            $ckbox = $request->post('ckbox');
            if(!empty($ckbox)){
                $allMenuData = $menu ->getAllMenuData();
                $my_quickentry = [];
                foreach($ckbox as $k => $v){
                    $my_quickentry[$v] = $allMenuData[$v];
                }
                $adminData ->my_quickentry = json_encode($my_quickentry);
                $adminData->save();
            }
            return $this->redirect(['index']);
        }
        return $this->render('index',[
            'adminData'     => $adminData,
            'menuList'      => $menuList,
        ]);
    }

    public function init(){
        $this -> subject = '设置快捷方式';
    }
}

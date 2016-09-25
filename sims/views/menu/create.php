<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model sims\models\Menu */

$this->title = 'Create Menu';
$this->params['breadcrumbs'][] = ['label' => 'Menus', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
    <?= $this->render('_form', [
        'model' => $model,
        'menuList' => $menuList,
    ]) ?>


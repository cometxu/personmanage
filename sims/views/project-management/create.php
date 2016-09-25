<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model sims\models\ProjectManagement */

$this->title = 'Create Project Management';
$this->params['breadcrumbs'][] = ['label' => 'Project Managements', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<?= $this->render('_form', ['model' => $model, 'nameList' => $nameList,'member'=>$member])
?>


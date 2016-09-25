<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model sims\models\ProjectManagement */

$this->title = 'Update Project Management: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Project Managements', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<?= $this->render('_form', ['model' => $model, 'nameList' => $nameList,'member'=>$member])
?>
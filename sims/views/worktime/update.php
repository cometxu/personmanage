<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model sims\models\Worktime */

$this->title = 'Update Worktime: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Worktimes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>

<?= $this->render('_form', [
    'model' => $model,
    'projectList' =>$projectList,
]) ?>

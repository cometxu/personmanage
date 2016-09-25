<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model sims\models\Worktime */

$this->title = 'Create Worktime';
$this->params['breadcrumbs'][] = ['label' => 'Worktimes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?= $this->render('_form', [
    'model' => $model,
    'projectList' =>$projectList,
]) ?>
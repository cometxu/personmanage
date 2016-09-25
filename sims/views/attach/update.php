<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model sims\models\Attach */

$this->title = 'Update Attach: ' . ' ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Attaches', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="attach-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

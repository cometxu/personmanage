<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model sims\models\ProjectManagement */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Project Managements', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="project-management-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'pr_name',
            'person',
            'pro_describe',
            'pro_information',
            'member',
            'state',
        ],
    ]) ?>

</div>

<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model sims\models\Attach */

$this->title = 'Create Attach';
$this->params['breadcrumbs'][] = ['label' => 'Attaches', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="attach-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

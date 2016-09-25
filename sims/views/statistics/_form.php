<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model sims\models\Statistics */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="statistics-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'y_month')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pr_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'contain')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

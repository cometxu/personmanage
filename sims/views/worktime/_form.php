<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use sims\components\DateTimePicker;
//use dosamigos\daterange ;
//use dosamigos\date

/* @var $this yii\web\View */
/* @var $model sims\models\Worktime */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="page-header">
    <h1><?=($model -> isNewRecord)?'添加工时':'修改工时';?></h1>
</div>
<div class="col-xs-12">
<?php ?>
    <?php $form = ActiveForm::begin([
        'id' => 'my_form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-3\">{input}</div>\n<div class=\"col-lg-8\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-1 control-label'],
        ],
    ]); ?>

    <?= $form->field($model, 'pr_id')->dropDownList($projectList,['prompt'=>'请选择']) ?>

    <?= $form->field($model, 'day_time')->textInput(['onfocus' => 'WdatePicker({dateFmt:"yyyy-MM-dd"})',
                                                     'readonly' => true,
                                                     'value' =>empty($model->day_time)?date('Y-m-d',time()+60*60*6):date('Y-m-d',$model->day_time+60*60*6)]) ?>

    <?= $form->field($model, 'worktime')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'notes')->textarea(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>



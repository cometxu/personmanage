<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model sims\models\ProjectManagement */
/* @var $form yii\widgets\ActiveForm */
?>
<style type="text/css">
    .txt{
        height:34px; border:1px solid #cdcdcd; width:180px;
    }
    .btn{
        background-color:#FFF; border:1px solid #CDCDCD;height:34px; width:70px;
    }
    .projectmanagement-pro_information-file{
        position:absolute; top:0; right:10px; height:34px; filter:alpha(opacity:0);opacity: 0;width:270px
    }
</style>
<div class="page-header">
    <h1><?=($model -> isNewRecord)?'添加项目':'修改项目';?></h1>
</div>

<div class="col-xs-12">

    <?php $form = ActiveForm::begin([
        'id' => 'my_form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-3\">{input}</div>\n<div class=\"col-lg-8\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-1 control-label'],
        ],
        'options' => ['enctype' => "multipart/form-data"],
    ]); ?>


    <?= $form->field($model, 'pr_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'person')->dropDownList($nameList, ['prompt'=>'请选择','style'=>'width:278px']) ?>

    <?= $form->field($model, 'pro_describe')->textarea(['maxlength' => true,['style'=>'row:3']]) ?>

    <div class="form-group field-projectmanagement-pro_information required">
        <p class="col-lg-1 control-label" for="projectmanagement-pro_information">项目压缩包</p>
        <div class="col-lg-3">
            <input type="hidden" name="ProjectManagement[pro_information]" >
            <input type='text' id='textfield' class='txt' value="<?=$model->pro_information?$model->pro_information:'';?>"/>
            <input type='button' class='btn' value='浏览' />
            <input type="file" name="ProjectManagement[pro_information]" class="projectmanagement-pro_information-file" id="projectmanagement-pro_information" size="28" onchange="document.getElementById('textfield').value=this.value" />
        </div>
        <div class="col-lg-8"><div class="help-block"></div></div>
    </div>

    <?= $form->field($model, 'member')->checkboxList($member) ?>

    <?= $form->field($model, 'state')->dropDownList(['1'=>'进行中','2'=>'未完成','3'=>'暂停','4'=>'已完成'], ['prompt'=>'请选择','style'=>'width:278px']) ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '添加' : '修改', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>



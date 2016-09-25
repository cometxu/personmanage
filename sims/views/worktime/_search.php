<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use sims\models\Userbc;
use sims\models\RoleForm;

/* @var $this yii\web\View */
/* @var $model sims\models\WorktimeSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="widget-box widget_tableDiv">
    <div class="widget-header widget-header-small"><h5 class="lighter">查询条件</h5></div>
    <div id="filter_show" class="widget-body">
        <div class="widget-main">
            <?php $form = ActiveForm::begin([
                'action' => ['index'],
                'method' => 'get',
                'fieldConfig' => [
                    //'template' => "<div class=\"col-lg-3\">{label}{input}</div>",
                    //'template' => "<span class='col-sm-3'><span class='col-sm-3'>{label}</span><span>{input}</span></span>",
                    'template' => "<div class='form-group' style='float: left;width:200px;'>{label} {input}</div>",
                    'labelOptions' => ['style' => 'width:200px;'],
                ],
            ]);
            ?>
    <?= $form->field($model, 'pr_name')->input('text',['class'=>'input-small','style'=>'width:150px']) ?>

    <?= $form->field($model, 'person_id')->dropDownList($nameList,['prompt'=>'请选择','style'=>'width:200px']) ?>

            <table style="width: 100%;">
                <tr><td>
                        <div class="form-group">
                            <?= Html::submitButton("查询", ["class" =>"btn btn-primary btn-sm"])?>
                            <?= Html::a("重置", ['index'], ["class" =>"btn btn-primary btn-sm"])?>
                            <?php
                            //判断权限需要用到的参数
                            $auth = Yii::$app->authManager;
                            $userid = Yii::$app->user->identity->id;
                            if($auth->checkAccess($userid,'worktime_create')) {
                                echo Html::a('添加', ['create'], ['class' => 'btn btn-sm btn-success']);
                            }
                            ?>
                        </div>
                    </td></tr>
            </table>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>

<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use sims\models\Userbc;
use sims\models\RoleForm;
?>

<div class="widget-box widget_tableDiv">
    <div class="widget-header widget-header-small"><h5 class="lighter">查询条件</h5></div>
    <div id="filter_show" class="widget-body">
        <div class="widget-main">
            <?php $form = ActiveForm::begin([
                'action' => ['index'],
                'method' => 'get',
                'fieldConfig' => [
                    'template' => "<div class='form-group' style='float:left;width:200px;'>{label} {input}</div>",
                    'labelOptions' => ['style' => 'width:200px;'],
                ],
            ]);
            ?>

    <?= $form->field($model, 'pr_name') ?>
    <p style="color:red">时间段查询</p>
    <div class="form-group field-statisticssearch">
        <div class="form-group" style="float:left;width:200px">
            <label style="width:200px" >开始时间</label>
            <input id="'statisticssearch-start_time" class="form-control" name="StatisticsSearch[start_time]" type="'text" />
        </div>
    </div>
    <div class="form-group field-statisticssearch">
        <div class="form-group" style="float:left;width:200px">
            <label style="width:200px" >截止时间</label>
            <input id="'statisticssearch-end_time" class="form-control" name="StatisticsSearch[end_time]" type="'text" />
        </div>
    </div>

            <table style="width: 100%;">
                <tr><td>
                        <div class="form-group">
                            <?= Html::submitButton("查询", ["class" =>"btn btn-primary btn-sm"])?>
                            <?= Html::a("重置", ['index'], ["class" =>"btn btn-primary btn-sm"])?>
                        </div>
                    </td></tr>
            </table>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>







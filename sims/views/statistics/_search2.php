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
                'action' => ['look'],
                'method' => 'get',
                'fieldConfig' => [
                    'template' => "<div class='form-group' style='float:left;width:200px;'>{label} {input}</div>",
                    'labelOptions' => ['style' => 'width:200px;'],
                ],
            ]);
            ?>
    <div class="form-group field-id">
        <div class='form-group' style='float:left;width:200px;'>
            <input name="id" value="<?=$id?>" type="hidden">
        </div>
    </div>
    <?= $form->field($model, 'person_id')->dropDownList($nameList,['prompt'=>'请选择','style'=>'width:200px']) ?>
            <table style="width: 100%;">
                <tr><td>
                        <div class="form-group">
                            <?= Html::submitButton("查询", ["class" =>"btn btn-primary btn-sm"])?>
                        </div>
                    </td></tr>
            </table>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>







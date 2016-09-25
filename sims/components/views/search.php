<?php
/**
 * Created by PhpStorm.
 * User: locky
 * Date: 2016/9/3
 * Time: 16:42
 */

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use sims\models\Userbc;
use sims\models\RoleForm;

/* @var $this yii\web\View */
/* @var $model sims\models\AdminSearch */
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
                    'template' => "<div class='form-group' style='float: left;width:200px;'>{label} {input}</div>",
                    'labelOptions' => ['style' => 'width:60px;'],
                ],
            ]);
            foreach($fields as $key=>$param){
                switch($param['type']){
                    case 'text':
//                        echo $form->field($model, $key)->input('text',['class'=>'input-small']);
                        break;
                    case 'dropdown':
//                        $form->field($model, $key)->dropDownList($param['list'],['style'=>'width:100px;']);
                        break;
                    default:
                        break;
                }
            }
            ?>

            <table style="width: 100%;">
                <tr><td>
                        <div class="form-group">
                            <?php
                            //判断权限需要用到的参数
                            $auth = Yii::$app->authManager;
                            $userid = Yii::$app->user->identity->id;
                            foreach ($button_list as $auth=>$button) {
                                if($auth->checkAccess($userid,$auth)) {
                                    echo $button;
                                }
                            }
                            ?>
                        </div>
                    </td></tr>
            </table>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
<script type="text/javascript">
    <?php foreach ($chosen_list as $row) {?>
        $("#<?= $search_obj?>-"<?= $row?>).chosen();
    <?php }
    ?>
</script>

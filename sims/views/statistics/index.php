<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
use job\lib\JobGridView;



$this->title = 'Statistics';
$this->params['breadcrumbs'][] = $this->title;
?>
<?php  echo $this->render('_search', ['model' => $searchModel]); ?>
<?= JobGridView::widget([
    'dataProvider' => $dataProvider,
    'summary'=>'',
//        'filterModel' => $searchModel,
    'columns' => [
        ['class' => 'yii\grid\SerialColumn','header'=>'序号'],
        'pr_name',
        'y_month',
        [
            'header'=>'总工时',
            'value'=>function($model){
                return $model->getAlltime();
            }
        ],
        [
            'class' => 'yii\grid\ActionColumn',
            'header' => '详情',
            'template' => '{look}',
            'buttons' => [
                'look' => function ($url, $model, $key) {
                    $options = [
                        'title' => '查看',
                        'aria-label' => Yii::t('yii', 'look'),
                        'data-pjax' => '0',
                        'class' => 'btn btn-xs btn-info',
                    ];
                    //判断权限需要用到的参数
                    $auth = Yii::$app->authManager;
                    $userid = Yii::$app->user->identity->id;
                    if ($auth->checkAccess($userid, 'statistics_look')) {
                        return Html::a('<i class="icon-edit bigger-120"></i>', $url, $options);
                    }
                },
            ],
        ],
    ],
]); ?>

<div>
    <?php $form = ActiveForm::begin([
        'action' => ['export'],
        'method' => 'post',
        'fieldConfig' => [
            'template' => "<div class='form-group' style='float:left;width:200px;'>{label} {input}</div>",
            'labelOptions' => ['style' => 'width:200px;'],
        ],
    ]);
    ?>
        <div class="form-group">
            <input type="hidden" id="pr_name1" name="pr_name"  value="<?=$condition['pr_name'];?>" >
            <input type="hidden" id="start_time1" name="start_time"  value="<?=$condition['start_time'];?>" >
            <input type="hidden" id="end_time1"  name ="end_time"  value="<?=$condition['end_time'];?>" >
            <input type="submit" id="button1" class="btn btn-primary btn-sm" value="导出">

        </div>
    <?php ActiveForm::end(); ?>
</div>


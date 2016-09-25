<?php

use yii\helpers\Html;
use yii\helpers\Url;
use job\lib\JobGridView;


/* @var $this yii\web\View */
/* @var $searchModel sims\models\WorktimeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Worktimes';
$this->params['breadcrumbs'][] = $this->title;
?>
<?php  echo $this->render('_search', ['model' => $searchModel,'nameList' => $nameList]); ?>
<?= JobGridView::widget([
    'dataProvider' => $dataProvider,
    'summary'      => '',
    //'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn','header' => '序号'],
            'pr_name',
            [
                'header' => '提交人',
                'value'  =>function($model){
                        return  $model->getPerson();
//                    return 1;
                }
            ],
//            'start_time:datetime',
            [
                'header' =>'工时日期',
                'value' => function($model){
                    return date('Y-m-d',$model->day_time+60*60*6);
                }
            ],
            [
                'header' =>'工时时间',
                'value' => function($model){
                    return $model->worktime;
                }
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{update} {delete}',
                'buttons' => [
                    'update' => function ($url, $model, $key) {
                        $options = [
                            'title' => '修改',
                            'aria-label' => Yii::t('yii', 'Update'),
                            'data-pjax' => '0',
                            'class' =>'btn btn-xs btn-info',
                        ];
                        //判断权限需要用到的参数
                        $auth = Yii::$app->authManager;
                        $userid = Yii::$app->user->identity->id;
                        if($auth->checkAccess($userid,'worktime_update')) {
                            return Html::a('<i class="icon-edit bigger-120"></i>', $url, $options);
                        }
                    },
                    'delete' => function ($url, $model, $key) {
                        $options = [
                            'title' => Yii::t('yii', 'Delete'),
                            'aria-label' => Yii::t('yii', 'Delete'),
                            //'data-confirm' => Yii::t('yii', '你确定要删除吗?'),
                            'data-method' => 'post',
                            'data-pjax' => '0',
                        ];
                        //判断权限需要用到的参数
                        $auth = Yii::$app->authManager;
                        $userid = Yii::$app->user->identity->id;
                        if($auth->checkAccess($userid,'worktime_delete')) {
                            //return Html::a('<button class="btn btn-xs btn-danger"><i class="icon-trash bigger-120"></i></button>', $url, $options);
                            $url = Url::to(['worktime/dodelete','id'=>$model->id]);
                            return Html::a('<button class="btn btn-xs btn-danger"><i class="icon-trash bigger-120"></i></button>', '#', ['onclick'=>'javascript:sweetConfirmChange(\'你确定要删除吗?\',\''.$url.'\')']);
                        }
                    },
                ],
            ],
        ],
    ]); ?>


<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;
use job\lib\JobGridView;

/* @var $this yii\web\View */
/* @var $searchModel sims\models\ProjectManagementSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Project Managements';
$this->params['breadcrumbs'][] = $this->title;
?>
<?php echo $this->render('_search',['model'=>$searchModel,'name' => $nameList]);
?>

    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'summary'=>'',
        'columns' => [
            [   'class' => 'yii\grid\SerialColumn','header'=>'序号'],
            'pr_name',
            'pro_describe',
            [   'header' => '负责人',
                'value' => function($model){
                    return $model->getPerson();
                },
            ],
            [   'header' => '项目成员',
                'value' => function($model){
                    return $model->getMember();
                },
            ],
            [   'header' => '项目进度',
                'value' => function($model){
                    return $model->getState($model->state);
//                    return \sims\models\ProjectManagement::getStatuses();
                },
            ],

            ['class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{update}{delete}',
                'buttons' => [
                    'update' => function ($url,$model,$key)
                    {
                        $options = [
                            'title' => '修改',
                            'aria-label' =>Yii::t('yii','Update'),
                            'data-pjax' => '0',
                            'class' => 'btn btn-xs btn-info',
                        ];
                        $auth = Yii::$app->authManager;
                        $userid = Yii::$app->user->identity->id;
                        if($auth->checkAccess($userid,'project_update')){
                            return Html::a('<i class="icon-edit bigger-120"></i>',$url,$options);
                        }
                    },
                    'delete' => function ($url,$model,$key){
                        $options = [
                            'title' => Yii::t('yii','Delete'),
                            'aria-label' => Yii::t('yii','Delete'),
                            'data-method' => 'post',
                            'data-pjax' => '0',
                        ];
                        $auth = Yii::$app->authManager;
                        $userid = Yii::$app->user->identity->id;
                        if($auth->checkAccess($userid,'project_delete')){
                            $url = Url::to(['project-management/dodelete','id' => $model->id]);
                            return Html::a('<button class="btn btn-xs btn-danger"><i class="icon-trash bigger-120"></i></button>','#',['onclick' => 'javascript:sweetConfirmChange(\'你确定要删除吗？\',\''.$url.'\')']);
                        }
                    }
                ]
            ],
        ],
    ]); ?>

</div>

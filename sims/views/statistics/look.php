<?php

use yii\helpers\Html;
use yii\helpers\Url;
use job\lib\JobGridView;


$this->title = 'look';
$this->params['breadcrumbs'][] = $this->title;
?>
<?php  echo $this->render('_search2', ['model' => $searchModel1,'nameList'=>$nameList,'id'=>$id]); ?>
<div class="widget-box widget_tableDiv">
    <div class="widget-header widget-header-small"><h5 class="lighter">详细信息</h5></div>
    <div id="filter_show" class="widget-body">
        <div class="widget-main">
            <?= JobGridView::widget([
                'dataProvider' => $dataProvider,
                'summary'=>'',
            //        'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn','header'=>'序号'],
                    'pr_name',
                    [
                        'header'=>'提交人',
                        'value' =>function($model){
                                return $model->person;
                        }
                    ],
            //        'person',
                    'worktime',
                    'notes',
                    [
                        'header'=>'提交时间',
                        'value' =>function($model) {
                            return date('Y-m-d', $model->day_time + 60 * 60 * 6);
                        }
                    ],
                ],
            ]); ?>
        </div>
    </div>
</div>


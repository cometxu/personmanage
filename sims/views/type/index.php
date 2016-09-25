<?php

use yii\helpers\Html;
use yii\grid\GridView;
use job\lib\JobGridView;

/* @var $this yii\web\View */
/* @var $searchModel sims\models\TypeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Menus';
$this->params['breadcrumbs'][] = $this->title;
?>
<?php  echo $this->render('_search', ['model' => $searchModel,'pid_list' => $pid_list]); ?>
<div class="type-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= JobGridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'pid',
            'name',
            'note:ntext',
            'order',
            // 'is_delete',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>

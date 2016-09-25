<?php

namespace sims\controllers;

use sims\models\Statistics;
use Yii;
use sims\models\Worktime;
use sims\models\WorktimeSearch;
use sims\components\CController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * WorktimeController implements the CRUD actions for Worktime model.
 */
class WorktimeController extends CController
{
    private $nameList = [];
    private $projectList =[];
    public function init()
    {
        parent::init();
        $worktime = new Worktime();
        $this->nameList = $worktime->getName();
        $this->projectList =$worktime->getProject();
        $this->subject = '工时管理';
    }

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all Worktime models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new WorktimeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index', [
            'searchModel'  => $searchModel,
            'dataProvider' => $dataProvider,
            'nameList'     =>$this->nameList,
        ]);
    }

    /**
     * Displays a single Worktime model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Worktime model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Worktime();
        if ($model->load(Yii::$app->request->post())) {
            $model->day_time = strtotime($model->day_time)-60*60*6;
            if($model->validate())
            {
                $model->pr_name = $this->projectList[$model->pr_id];
                $model->person_id = $_SESSION['__id'];
                $model->commit_time =time();
            }
            if($model->save())
            {
                $link_time=date('Y-m',$model->day_time+60*60*6);          //工时时间日期
                $exa = Statistics::findOne(['y_month'=>$link_time,'pr_name'=>$model->pr_name]);
                if($exa!==null)          //月份亦存在
                {
                    if($exa->contain!=='0'){
                        $exa->contain = $exa->contain . ',' . $model->id . ',';
                    }else{
                        $exa->contain = $model->id . ',';
                    }
                }
                else                                                      //月份不存在，创建
                {
                    $exa =new Statistics();
                    $exa->y_month = $link_time;
                    $exa->pr_name = $model->pr_name;
                    $exa->contain = (string)$model->id.',';
                }
                $exa->save();
                return $this->redirect(['index']);
            }
        }
        return $this->render('create', [
            'model' => $model,
            'projectList' => $this->projectList,
        ]);

    }

    /**
     * Updates an existing Worktime model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post())) {
            $model->day_time = strtotime($model->day_time)-60*60*6;
            if($model->validate()){
                $model->pr_name = $this->projectList[$model->pr_id];
                $model->commit_time =time();
            }
            if($model->save()){
                return $this->redirect(['index']);
            }
        }
        return $this->render('update', [
            'model' => $model,
            'projectList' => $this->projectList,
        ]);
    }

    /**
     * Deletes an existing Worktime model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }
    /*
 * 实际删除方法（用了sweetalert后，上面那个有问题，一模一样的地址404错误，找不到原因，用这个代替）
 */
    public function actionDodelete(){
        $params = Yii::$app->request->get();
        if($params['id']){
            $id = $params['id'];
            $model = $this->findModel($id);
            $model->delete();

            $res = Statistics::find()->where(['pr_name'=>$model->pr_name])->All();
            foreach($res as $value){
                $string = strpos($value['contain'],($model->id.','));
                if($string!==false){
                    $value['contain'] = str_replace(($model->id.','),'',$value['contain']) ;
                    $stat = Statistics::find()->where(['id'=>$value['id']])->one();
                    $stat->contain = !empty($value['contain'])?$value['contain']:'0';
                    $stat->save();
                }
            };
        }
        return $this->redirect(['index']);
    }

    /**
     * Finds the Worktime model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Worktime the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Worktime::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

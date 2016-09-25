<?php

namespace sims\controllers;

use Yii;
use sims\models\ProjectManagement;
use sims\models\ProjectManagementSearch;
use sims\components\CController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * ProjectManagementController implements the CRUD actions for ProjectManagement model.
 */
class ProjectManagementController extends CController
{
    private $nameList = [];
    private $memberList = [];
    public function init(){
        parent::init();
        $project = new ProjectManagement();
        $this->nameList = $project->getName();
        $this->memberList = $project ->getmemberName();
        $this->subject = '用户管理';
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
     * Lists all ProjectManagement models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ProjectManagementSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'nameList'    => $this->nameList,
        ]);
    }

    /**
     * Displays a single ProjectManagement model.
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
     * Creates a new ProjectManagement model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new ProjectManagement();
        $condition = Yii::$app->request->post();
        if ($model->load($condition)) {
            $C_package = UploadedFile::getInstance($model, 'pro_information');             // 获取文件上传文件信息
            if (!empty($C_package)) {
//                /*设置文件类型、名称，文件上传路径,判断文件路径是否存在，若不存在，创建路径*/
                $C_package->type = 'rar/zip';
                $now_time = date("Y-m-d", time() + 60 * 60 * 6);
                $folder_url = dirname(__DIR__) . "/uploads/" . $now_time;
                if (!file_exists($folder_url)) {
                    mkdir($folder_url);
                }
                $C_package->saveAs('../uploads/' . $now_time . '/' . time()."-".$C_package->name);
                $model->pro_information = '/uploads/' . $now_time . '/' . time()."-".$C_package->name;
            }
            if(is_string($condition['ProjectManagement']['member'])){          //没勾选
                if(!empty($model->person)){                                    // 项目负责人存在
                    $model->member = $model->person;
                }
            }
            else{                                                             //有勾选,传值为数组
                if(!empty($model->person)){                                   //项目负责人存在
                    if(in_array($model->person,$condition['ProjectManagement']['member'])){
                        $model->member = implode(",",$condition['ProjectManagement']['member']);
                    }
                    else{
                        $model->member = implode(",",$condition['ProjectManagement']['member']).",".$model->person;
                    }
                }
                else{                                                            //不存在项目负责人
                    $model->member = implode(",",$condition['ProjectManagement']['member']);
                }
            }
            if ($model->save()) {
                return $this->redirect(['index']);
            }else{
                $model->member = explode(',', $model->member);
                if (!empty($model->pro_information)) {
                    $last = explode('/', $model->pro_information);
                    $model->pro_information = end($last);
                }
                return $this->render('create', [
                    'model' => $model,
                    'nameList' => $this->nameList,
                    'member' => $this->memberList,
                ]);
            }
        }
        else{
                return $this->render('create', [
                    'model' => $model,
                    'nameList' => $this->nameList,
                    'member' => $this->memberList,
                ]);
            }
    }

    /**
     * Updates an existing ProjectManagement model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $session = Yii::$app->session;
        $_SESSION['pro_information'] = $model->pro_information   ;
        $condition = Yii::$app->request->post();
        if ($model->load($condition)) {
            $C_package = UploadedFile::getInstance($model,'pro_information');             // 获取文件上传文件信息
            if(!empty($C_package)) {                                                      //重新上传了文件
                $C_package->type = 'rar/zip';
                $now_time = date("Y-m-d", time()+60*60*6);
                $folder_url = dirname(__DIR__) . "/uploads/" . $now_time;
                if (!file_exists($folder_url)) {
                    mkdir($folder_url);
                }
                $C_package->saveAs('../uploads/' . $now_time . '/' . time()."-".$C_package->name);
                $model->pro_information = '/uploads/' . $now_time . '/' . time()."-".$C_package->name;
            }
            $model ->pro_information = (!empty($C_package))?($model->pro_information):($_SESSION['pro_information']);
            if(is_string($condition['ProjectManagement']['member'])){          //没勾选
                if(!empty($model->person)){                                    // 项目负责人存在
                    $model->member = $model->person;
                }
            }
            else{                                                             //有勾选,传值为数组
                if(!empty($model->person)){                                   //项目负责人存在
                    if(in_array($model->person,$condition['ProjectManagement']['member'])){
                        $model->member = implode(",",$condition['ProjectManagement']['member']);
                    }
                    else{
                        $model->member = implode(",",$condition['ProjectManagement']['member']).",".$model->person;
                    }
                }
                else{                                                            //不存在项目负责人
                    $model->member = implode(",",$condition['ProjectManagement']['member']);
                }
            }
            if($model->save()){
                return $this->redirect(['index']);
            }else
            {
                $model->member = explode(',', $model->member);
                if(!empty($model->pro_information)){
                    $last = explode('/',$model->pro_information);
                    $model->pro_information = end($last);
                }
                return $this->render('update', [
                    'model' => $model,
                    'nameList' => $this->nameList,
                    'member' => $this->memberList,
                ]);
            }
        }
        else {
            if(is_string($model->member)) {
                $model->member = explode(',', $model->member);
            }
            if(!empty($model->pro_information)){
                $last = explode('/',$model->pro_information);
                $model->pro_information = end($last);
            }
            return $this->render('update', [
                'model' => $model,
                'nameList' => $this-> nameList,
                'member' => $this->memberList,
            ]);
        }
    }

    /**
     * Deletes an existing ProjectManagement model.
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
//        var_dump($params);
        if($params['id']){
            $id = $params['id'];
            //PermissionForm::deleteAll(['name' => $params['id']]);
            $this->findModel($id)->delete();
        }
        return $this->redirect(['index']);
        //print_r($params);
    }
    /**
     * Finds the ProjectManagement model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ProjectManagement the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ProjectManagement::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

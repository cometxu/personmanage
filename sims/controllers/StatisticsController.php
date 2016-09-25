<?php

namespace sims\controllers;

use sims\models\Admin;
use sims\models\ProjectManagement;
use sims\models\Worktime;
use sims\models\WorktimeSearch;
use Yii;
use sims\models\Statistics;
use sims\models\StatisticsSearch;
use sims\components\CController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

require dirname(dirname(dirname(__FILE__))).'/vendor/phpoffice/phpexcel/Classes/PHPExcel.php';
//require dirname(dirname(__FiLE__)).'/excel/PHPExcel.php';

/**
 * StatisticsController implements the CRUD actions for Statistics model.
 */
class StatisticsController extends CController
{

    public function init()
    {
        parent::init();
        $this->subject = '统计管理';
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

    public function actionIndex()
    {
        $searchModel = new StatisticsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $condition = Yii::$app->request->queryParams;
        if(empty($condition['StatisticsSearch'])){
            $pr_name = null;
            $start_time = null;
            $end_time = null;
        }else{
            $pr_name = empty($condition['StatisticsSearch']['pr_name'])?'':$condition['StatisticsSearch']['pr_name'];
            $start_time = empty($condition['StatisticsSearch']['start_time'])?'': $condition['StatisticsSearch']['start_time'];
            $end_time = empty($condition['StatisticsSearch']['end_time'])?'':$condition['StatisticsSearch']['end_time'];
        }
        $condition = [
            'pr_name'=>$pr_name,
            'start_time'=>$start_time,
            'end_time'=>$end_time,
        ];
            return $this->render('index', [
                'searchModel'  => $searchModel,
                'dataProvider' => $dataProvider,
                'condition' =>$condition,
            ]);
    }

    public function actionExport(){                     //一个名字所需的空格数为$a
                                                        //$b[]存储需要多少月份
        $condition = Yii::$app->request->post();
        if($condition['pr_name'] == null && $condition['start_time'] ==null && $condition['end_time']==null){
            $conditions = [];
        }
        else{
            $conditions = ['StatisticsSearch'=>$condition];
        }
        $searchModel = new StatisticsSearch();
        $dataProvider = $searchModel->search($conditions);
        $datas = ArrayHelper::toArray($dataProvider->query->OrderBy(['pr_name'=>SORT_ASC,'y_month'=>SORT_ASC])->All());


        $dir =dirname(dirname(__FILE__)).'\uploads\export';
        $time = $this->getTime($datas);             //时间段
        $Admin_names = $this->getAdmin();                 //登录名字
        $a = 0;
        $i = 3;
        $j = 3;
        $s = 0;
        foreach($time as $key=>$value){
            $b[$key] =count($value);
            $a = $a + $b[$key];
        }
        $data = $this->getData($datas);

        $objectPHPExcel = new \PHPExcel();
        $objectPHPExcel->setActiveSheetIndex(0);
        $objSheet = $objectPHPExcel->getActiveSheet();
        $objSheet->getDefaultStyle()->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER)->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        /*设置默认的样式*/
        $objSheet->getDefaultStyle()->getFont()->setName('宋体')->setSize('11');
        $objSheet->getStyle('1')->getFont()->setSize(11)->setBold(True);
        $objSheet->getStyle('2')->getFont()->setSize(11)->setBold(True);
        $objSheet->getStyle('3')->getFont()->setSize(11)->setBold(True);
        $objSheet->getStyle('A1:C3')->getAlignment()->setWrapText(true);
        $objSheet->setCellValue('A1',"人员/月份\n项目")->setCellValue('B1',"完成情况")->setCellValue('C1',"人员/月份/周\n工时总计(天)");
        $objSheet->getColumnDimension('A')->setWidth(25);
        $objSheet->getColumnDimension('B')->setWidth(20);
        $objSheet->getColumnDimension('C')->setWidth(20);
        $objSheet->getRowDimension('1')->setRowHeight(30);
        $objSheet->mergeCells('A1:A3')->mergeCells('B1:B3')->mergeCells('C1:C3');
        $styleThinBlackBorderOutline = array(
            'borders' => array (
                'outline' => array (
                    'style' => \PHPExcel_Style_Border::BORDER_THIN,   //设置border样式
                    'color' => array ('argb' => 'FF000000'),          //设置border颜色
                ),
            ),
        );
        /*填充固定数据*/
        foreach($Admin_names as $key =>$value){
            $objSheet->setCellValue($this->getCells($i).'1',$value);             //设置A单元格属性
            $sentence = $this->getCells($i).'1:'.$this->getCells($i+$a-1)."1";    //B1:G1
            $objSheet->mergeCells($sentence);
            if($s%2 == 0){
                $objSheet->getStyle($sentence)->getFill()->setFillType(\PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('8DB4E2');
                $objSheet->getStyle($sentence)->applyFromArray($styleThinBlackBorderOutline);
            }
            else{
                $objSheet->getStyle($sentence)->getFill()->setFillType(\PHPExcel_Style_Fill::FILL_SOLID)->getStartColor()->setRGB('B1A0C7');
                $objSheet->getStyle($sentence)->applyFromArray($styleThinBlackBorderOutline);
            }
            foreach($time as $ym =>$ym_value){
                $objSheet->setCellValue($this->getCells($j).'2',$ym);
                $sentence2 =$this->getCells($j).'2:'.$this->getCells($j+count($ym_value)-1)."2";
                $objSheet->mergeCells($sentence2);
                $k =$j;
                foreach($ym_value as $m=>$m_value){
                    $objSheet->setCellValue($this->getCells($k).'3',$m_value);
                    $k++;
                }
                $j =$j+count($ym_value);
            }
            $i = $i+$a;
            $s++;
        }
        /*填充数据库数据*/
        $j=4;
        foreach($data as $key=>$a_value){             //项目3
            $i =3;
            $total_time = 0;
            $states = ProjectManagement::find()->where(['pr_name'=>$key])->One();
            $state = new ProjectManagement();
            $objSheet->setCellValue('A'.$j,$key);
            $objSheet->setCellValue('B'.$j,$state->getState($states->state));
            foreach($a_value as $b_value){       //超级管理员
                foreach($b_value as  $c_value){
                    foreach($c_value as $d_value){
                        $total_time = $total_time+$d_value;
                        if($d_value == 0){
                            $d_value = null;
                        }
                        $objSheet->setCellValue($this->getCells($i).$j,$d_value);
                        $i++;
                    }
                }
            }
            $objSheet->setCellValue('C'.$j,$total_time);
            $j++;
        }

        ob_end_clean();
        $filename = date('Y-m-d',time()).rand(100,999);
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'.$filename.'.xls"');
        header('Cache-Control: max-age=0');

        $objWriter = \PHPExcel_IOFactory::createWriter($objectPHPExcel,'Excel5');
        $objWriter->save('php://output');
        exit;
    }

    protected function getData($datas){
        $res= [];
        $time = $this->getTime($datas);             //时间段
        $names = $this->getAdmin();                 //登录名字
        $projects = $this->getProject($datas);      //项目名称
        $names = array_flip($names);

        foreach($time as $key=>$value){
            $time[$key] = array_flip($value);
            foreach($time[$key] as $keys =>$values){
                $time[$key][$keys] = 0;
            }
        }

        for($i=0;$i<count($projects);$i++) {          //构造拼接数组，
            $res[$projects[$i]] = $names;
            foreach($res[$projects[$i]] as $key=> $value){
                $res[$projects[$i]][$key] = $time;
            }
        }
        foreach($datas as $key => $value) {           //传输的datas数据进行循环判断
            foreach ($res as $a => $a_value) {      //预先定义的数组$res
                if($value['pr_name'] === $a )        //如果项目名称与$res相符
                {
                    $m =(int)substr($value['y_month'],5);
                    $y =substr($value['y_month'],0,4);
                    $contains = explode(',',substr($value['contain'],0,-1));
                    foreach($contains as $b => $b_value){
                        $res_time = Worktime::find()->where(['id'=>$b_value])->asArray()->One();
                        $res_person = Admin::find()->where(['id'=>$res_time['person_id']])->asArray()->One();
                        $worktime=$res_time['worktime'];
                        $person = $res_person['name'];
                        if(!empty($res[$a][$person][$y][$m])) {
                            $res[$a][$person][$y][$m] = $res[$a][$person][$y][$m] + $worktime;
                        }else{
                            $res[$a][$person][$y][$m] = $worktime;
                        }
                    }
                }
            }
        }
        return $res;
    }

    protected function getProject($datas){
        $projects = [];
        $projects[0] = $datas[0]['pr_name'];
        if(count($datas)>1){
            for($i=0,$j=1;$i<count($datas)-1;$i++,$j++){
                if($datas[$i]['pr_name']!== $datas[$j]['pr_name']){
                    $projects[$j]=$datas[$j]['pr_name'];
                }
            }
        }
        return array_merge($projects);
    }

    protected function getTime($datas){
        foreach($datas as $key=>$value)
        {
            $times[$key] = $value['y_month'];
        }
        sort($times);
        $a = (int)explode('-',$times[0])[0];
        $b = (int)explode('-',$times[$key])[0];
        if($a !== $b)
        {
            for($i=(int)explode('-',$times[0])[1],$j=0;$i<=12;$i++,$j++){
                $res1[$j] = $i ;
            }
            for($i=(int)explode('-',$times[$key])[1],$j=0;$i>=1;$i--,$j++){
                $res2[$j] = $i ;
            }
            sort($res2);
            if(($b-$a)!=1)
            {
                $res1 = [$a=>$res1];
                for(;$a<$b-1;$a++){
                    $res1 = $res1+ [$a+1=>[1,2,3,4,5,6,7,8,9,10,11,12]];
                }
                $res2 = [$b=>$res2];
                $res = $res1 +$res2;
            }
            else
            {
                $res = [$a=>$res1,$b=>$res2];
            }
        }
        else
        {
            for($i=(int)explode('-',$times[0])[1],$j=(int)explode('-',$times[$key])[1],$k=0;$i<=$j;$i++,$k++){
                $res4[$k] = $i;
            }
            $res = [$a=>$res4];
        }
        return $res;
    }

    protected function getCells($index){
        $res = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
            'AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ',
            'BA','BB','BC','BD','BE','BF','BG','BH','BI','BJ','BK','BL','BM','BN','BO','BP','BQ','BR','BS','BT','BU','BV','BW','BX','BY','BZ',
            'CA','CB','CC','CD','CE','CF','CG','CH','CI','CJ','CK','CL','CM','CN','CO','CP','CQ','CR','CS','CT','CU','CV','CW','CX','CY','CZ',
        ];
        return $res[$index];
    }

    protected function getAdmin(){
        $results =[];
        $result = Admin::find()->where(['role_name'=>['test','zongadming']])->OrderBy(['role_name'=>SORT_DESC])->asArray()->all();
        foreach($result as $key=>$value){
            $results[$key] = $value['name'];
        }
        return $results;
    }

    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }


    public function actionLook($id=null){

        $condition = Yii::$app->request->queryParams;

        $model = $this->findModel($id);
        $res  = ProjectManagement::find()->where(['pr_name'=>$model->pr_name])->One();
        $ids=explode(',',$res->member);
        foreach($ids as $value){
            $result = Admin::find()->where(['id'=>$value])->One();
            $nameList[$value]= $result->name;
        }                                                                                          //项目成员列表

        if(empty($condition['WorktimeSearch']['person_id'])){
           $condition =[
               'r'=>$condition['r'],
               'id'=>$condition['id'],
           ];
        }
        if(isset($condition['WorktimeSearch'])){
            $conditions =$condition;
            $model = $this->findModel($condition['id']);
            $results = explode(',',$model->contain);
            $searchModel1 = new WorktimeSearch();
            $dataProvider = $searchModel1->search($conditions);
            $dataProvider->query->where =['and', ['in','id',$results],$dataProvider->query->where];      //数据data
        }else{
            $conditions = ['1'=>1];
            $model = $this->findModel($id);
            $results = explode(',',$model->contain);
            $searchModel1 = new WorktimeSearch();
            $dataProvider = $searchModel1->search($conditions);
            $dataProvider->query->where = ['in','id',$results];      //数据data
        }
        return $this->render('look', [
            'searchModel1' => $searchModel1,
            'dataProvider' => $dataProvider,
            'nameList' => $nameList,
            'id' =>$id,
        ]);
    }

    protected function findModel($id)
    {
        if (($model = Statistics::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}

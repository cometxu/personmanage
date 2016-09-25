<?php

namespace sims\controllers;
use sims\components\CController;
use sims\models\Site;
use Yii;


/**
 * AdminController implements the CRUD actions for Admin model.
 */
class ImportDataController extends CController
{
    private $sims_load="upload_files/public";
    public function actionGlobals($id){
        $site=Site::find()->where(['is_delete'=>0,'id'=>$id])->one();
        if($site&&$site->id>0){
            $database_info=json_decode($site->database_info,true);
            $database_info_old=json_decode($site->database_info_old,true);
            $error=array();
            if(!$database_info_old)
                $error[]='原数据库连接信息没设置';
            if(!$database_info)
                $error[]='新数据库连接信息没设置';
            if(!empty($error)){
                $message=$site->name.'迁移数据失败，'.implode($error, '和').'!';
                Yii::$app->session->setFlash('importerror', $message);
                return $this->redirect(['site/index']);
            }
            $connection1 = new \yii\db\Connection([
                'dsn' => 'mysql:host='.$database_info_old['host'].';dbname='.$database_info_old['database'],
                'username' => $database_info_old['login'],
                'password' => $database_info_old['password'],
                'charset'=> $database_info_old['charset'],
            ]);

            //新数据库连接信息
            $connection2 = new \yii\db\Connection([
                'dsn' => 'mysql:host='.$database_info['host'].';dbname='.$database_info['database'],
                'username' => $database_info['login'],
                'password' => $database_info['password'],
                'charset'=> $database_info['charset'],
            ]);  

            /* //旧数据库连接信息
             $connection1 = new \yii\db\Connection([
                'dsn' => 'mysql:host=10.82.97.41;dbname=cjnew_nuc_db',
                'username' => 'cj_scadmin',
                'password' => 'Rmc2zQ7yKHJhPHzVdb',
                'charset'=> 'utf8',
            ]);

            //新数据库连接信息
             $connection2 = new \yii\db\Connection([
                'dsn' => 'mysql:host=10.82.97.41;dbname=new_db',
                'username' => 'cj_scadmin',
                'password' => 'Rmc2zQ7yKHJhPHzVdb',
                'charset'=> 'utf8',

             //旧数据库连接信息
             $connection1 = new \yii\db\Connection([
                'dsn' => 'mysql:host=localhost;dbname=cjnew_nuc_db',
                'username' => 'root',
                'password' => 'root',
                'charset'=> 'utf8',
            ]);

            //新数据库连接信息
             $connection2 = new \yii\db\Connection([
                'dsn' => 'mysql:host=localhost;dbname=new_db',
                'username' => 'root',
                'password' => 'root',
                'charset'=> 'utf8',
            ]);
            ]);*/

             //站点上传目录
             if($site['sims_info']){
                $temp=json_decode($site['sims_info'],true)['upload_file'];
                if($temp)
                    $this->sims_load=$temp;
             }

             $tables=array(
                array('old_table'=>'core_user','new_table'=>'crjy_core_user', //学生表
                'change_arr'=>array('birth birthday','education edu_level','stuno stu_no','eid adult_test_id','training_id correspondence_id'),
                'remove_arr'=>array('regid','lastenter','birth','education','stuno','eid','training_id','firstname','lastname','avatar','signature','level','lastenter','valid','pwd_expire_at','force_change',
                'register_date','facebook_id','twitter_id','linkedin_id','google_id','privacy_policy','sims_lev','hasdegree','dazhuan',
                'finish','debate','unlockdebate','ondebate','mclassids','lnum','cnum','rbnum','p_cnum','p_lnum','p_rbnum','nickname','course_ids')), 

                array('old_table'=>'core_user_before_check','new_table'=>'crjy_core_user_before_check', //学生before表
                'change_arr'=>array('birth birthday','education edu_level','stuno stu_no','eid adult_test_id','training_id correspondence_id'),
                'remove_arr'=>array('xzm','birth','education','stuno','eid','training_id','hasdegree','dazhuan','update_id','update_date','audit_id','audit_date',
                'dazhuan','nickname','yjbyrq','byrq','bjyjl','zsbh','xm')), 

                array('old_table'=>'sms_enroll','new_table'=>'crjy_grade', //入学批次
                'change_arr'=>array('isdelete is_delete','note node'),
                'remove_arr'=>array('isdelete','note')), 

                array('old_table'=>'sms_org','new_table'=>'crjy_correspondence', //学习中心
                'change_arr'=>array('contactman contact','contactphone contact_phone','note memo','isdelete is_delete'),
                'remove_arr'=>array('pid','type','contactman','contactphone','note','isdelete','logoinfo','template','examscale','update_id','update_date')),  
                
                 array('old_table'=>'sms_discipline','new_table'=>'crjy_discipline', //专业
                'change_arr'=>array('note memo','isdelete is_delete'),
                'remove_arr'=>array('isdelete','note','course_count','college_id','dis_lev')),  
               
                array('old_table'=>'sms_class','new_table'=>'crjy_class_info', //班级
                'change_arr'=>array('enroll_id grade_id','training_id corre_id','discipline_id disc_id','isdelete is_delete'),
                'remove_arr'=>array('enroll_id','training_id','discipline_id','isdelete','college_id','sb_flag','back_only')),  
             
                array('old_table'=>'lc_course','new_table'=>'crjy_course', //课程
                'change_arr'=>array('desc_short s_note','desc_long d_note','class_time hour','teacher_names teacher_name','credit score','classtype course_type','isdelete is_delete'),
                'remove_arr'=>array('desc_short','desc_long','class_time','teacher_names','credit','classtype','isdelete','course_tag','course_lecturer','iscomp','memo','type','liberty_type','tnum')),  
             
                 array('old_table'=>'lc_course_type','new_table'=>'crjy_course_type', //课程类别
                'change_arr'=>array('memo remark'),
                'remove_arr'=>array('memo')),

                array('old_table'=>'lc_message','new_table'=>'crjy_notice', //消息中心
                'change_arr'=>array('notif_type msgtype'),
                'remove_arr'=>array('notif_type','priority')),

                array('old_table'=>'lc_message_user','new_table'=>'crjy_notice_user', //消息中心2
                'change_arr'=>array('msgid noticeid'),
                'remove_arr'=>array('msgid')), 

                //直接复制
                array('old_table'=>'lc_items_bug','new_table'=>'lc_items_bug','change_arr'=>null,'remove_arr'=>null), //课程纠错
                array('old_table'=>'lc_course_resource','new_table'=>'lc_course_resource','change_arr'=>null,'remove_arr'=>null), //资源管理
                array('old_table'=>'course_talk','new_table'=>'crjy_course_talk','change_arr'=>null,'remove_arr'=>array('replyer','reply_dt','reply_txt')), //课堂讨论
                array('old_table'=>'lc_question','new_table'=>'lc_question','change_arr'=>null,'remove_arr'=>null),     //问答管理
                array('old_table'=>'lc_question_new','new_table'=>'lc_question_new','change_arr'=>null,'remove_arr'=>null),  //华西大学独有
               /* array('old_table'=>'exam_generation_strategy','new_table'=>'exam_generation_strategy','change_arr'=>null,'remove_arr'=>null), //题库管理
                array('old_table'=>'exam_knowledge','new_table'=>'exam_knowledge','change_arr'=>null,'remove_arr'=>null), 
                array('old_table'=>'exam_questions','new_table'=>'exam_questions','change_arr'=>null,'remove_arr'=>null),
                array('old_table'=>'exam_question_type','new_table'=>'exam_question_type','change_arr'=>null,'remove_arr'=>null),
                array('old_table'=>'exam_stu_page','new_table'=>'exam_stu_page','change_arr'=>null,'remove_arr'=>null),
                array('old_table'=>'exam_stu_pitem','new_table'=>'exam_stu_pitem','change_arr'=>null,'remove_arr'=>null),
                array('old_table'=>'exam_stu_question','new_table'=>'exam_stu_question','change_arr'=>null,'remove_arr'=>null),
                array('old_table'=>'exam_stu_questionwrong','new_table'=>'exam_stu_questionwrong','change_arr'=>null,'remove_arr'=>null),
                array('old_table'=>'exam_template_page','new_table'=>'exam_template_page','change_arr'=>null,'remove_arr'=>null),
                array('old_table'=>'exam_template_question','new_table'=>'exam_template_question','change_arr'=>null,'remove_arr'=>null),*/
                );
            $this->actionChangeData($connection1,$connection2,$tables);

            //完全复制表及数据
            $tables_num=array(
                array('old_table'=>'lc_courseuser','new_table'=>'lc_courseuser','primary_key'=>'id','type'=>1),
                array('old_table'=>'lc_items_tracking','new_table'=>'lc_items_tracking','primary_key'=>'id','type'=>1),
                array('old_table'=>'lc_items_tracking_history','new_table'=>'lc_items_tracking_history','primary_key'=>'id','type'=>1),

                array('old_table'=>'exam_generation_strategy','new_table'=>'exam_generation_strategy','primary_key'=>'','type'=>2), //题库管理
                array('old_table'=>'exam_knowledge','new_table'=>'exam_knowledge','primary_key'=>'','type'=>2), 
                array('old_table'=>'exam_questions','new_table'=>'exam_questions','primary_key'=>'','type'=>2),
                array('old_table'=>'exam_question_type','new_table'=>'exam_question_type','primary_key'=>'','type'=>2),
                array('old_table'=>'exam_stu_page','new_table'=>'exam_stu_page','primary_key'=>'','type'=>2),
                array('old_table'=>'exam_stu_pitem','new_table'=>'exam_stu_pitem','primary_key'=>'','type'=>2),
                array('old_table'=>'exam_stu_question','new_table'=>'exam_stu_question','primary_key'=>'','type'=>2),
                array('old_table'=>'exam_stu_questionwrong','new_table'=>'exam_stu_questionwrong','primary_key'=>'','type'=>2),
                array('old_table'=>'exam_template_page','new_table'=>'exam_template_page','primary_key'=>'','type'=>2),
                array('old_table'=>'exam_template_question','new_table'=>'exam_template_question','primary_key'=>'','type'=>2),


            );
            //$this->actionCopy($connection2,'cjnew_nuc_db','new_db',$tables_num);
            $this->actionCopy($connection2,$database_info_old['database'],$database_info['database'],$tables_num);

            //教学计划
            $this->insertPlan($connection1,$connection2);

             //更新数据
            $update_arr=array(
                'update lc_items_bug c,crjy_core_user u  set c.stu_id=u.userid   where c.stu_id=u.idst', //课程纠错
            );
            $this->actionUpdatedata($connection2,$update_arr);
            
            $connection1->close();
            $connection2->close();
            
            Yii::$app->session->setFlash('importerror',$site->name.'迁移数据成功！');
            return $this->redirect(['site/index']);
        }
        Yii::$app->session->setFlash('importerror','导入失败'.$site->name.'站点不存在！');
        return $this->redirect(['site/index']);
         
    }

    //少量数据处理
    public function doData($connection1,$connection2,$old_table,$new_table,$change_arr,$remove_arr){
        
        //echo $old_table.'--start--'.time().'       ';
        
        //查询旧表数据
        $add_select='';
        if(!empty($change_arr)){
            $add_select.=','.implode(',', $change_arr);
        }
        $select='select *'.$add_select.' from '.$old_table;
        $posts=$connection1->createCommand($select)->queryAll();

        //清除新表数据
        $delete='delete from '.$new_table;
        $connection2->createCommand($delete)->execute();

        //新表插入新数据
        $arr=array();
        foreach ($posts as $key => $value){
            //清除新表不存在的字段
            if(!empty($remove_arr)){
                foreach ($remove_arr as $key2 => $value2){
                   
                        unset($value[$value2]);
                }
            }
            //学生表status为审核通过状态
            if($old_table=='core_user')
                $value['status']=1;

            //修改课程图片路径
            if($old_table=='lc_course'&&$value['img'])
                $value['img']=str_replace('uploads/tempcourse',$this->sims_load.'/course',$value['img']);

            $arr[]=$value;
            
        }
        if(!empty($arr)){
            $keys=array_keys($arr[0]);
            $connection2->createCommand()->batchInsert($new_table,$keys,$arr)->execute();
        }

        //echo $old_table.'--end--'.time();

    }

    /*处理少量数据*/
    public function actionChangeData($connection1,$connection2,$tables){
        if(!empty($tables)){
            foreach ($tables as $key => $value) {
                $this->doData($connection1,$connection2,$value['old_table'],$value['new_table'],$value['change_arr'],$value['remove_arr']);
            }
        }
    }

    /*处理大量数据，且新老表结构基本一致
     *先删除，然后直接复制，最后修改字段类型
    */
    public function actionCopy($connection,$old_database,$new_database,$tables_num){
        if(!empty($tables_num)){
             $connection->createCommand('use '.$new_database)->execute();
            foreach ($tables_num as $key => $value){
                $old_table=$value['old_table'];
                $new_table=$value['new_table'];
                $primary_key=$value['primary_key'];
                $type=$value['type'];
                //删除表
                $delete='drop table  if EXISTS '.$new_table;
                $connection->createCommand($delete)->execute();
               /* if($primary_key)
                    $create='create table '.$new_table.'  ('.$primary_key.' int not null auto_increment, primary key ('.$primary_key.') ) select o.*,u.userid userid2 from '.$old_database.'.'.$old_table.' o left join '.$old_database.'.core_user u on u.idst=o.userid';
                else
                    $create='create table  '.$new_table.' select o.*,u.userid userid2 from '.$old_database.'.'.$old_table.' o left join '.$old_database.'.core_user u on u.idst=o.userid';
                */ 
                /*$sqlCreate[$tkey] = 'create table if not exists '.$tval.' like '.$modelDb.'.'.$tval;
                $sqlTemp[$tkey] = 'insert into '.$tval.' (select * from '.$modelDb.'.'.$tval.')';*/
                if($type==1){
                    $create='create table '.$new_table.' like '.$old_database.'.'.$old_table;
                    $connection->createCommand($create)->execute();
                    $connection->createCommand('alter table '.$new_table.' add userid2 varchar(255)')->execute();

                    $insert='insert into '.$new_table.' select o.*,u.userid userid2 from '.$old_database.'.'.$old_table.' o left join '.$old_database.'.core_user u on u.idst=o.userid'; 
                    $connection->createCommand($insert)->execute();

                    $connection->createCommand('alter table '.$new_table.' drop column userid')->execute();
                    $connection->createCommand('alter table '.$new_table.' change  userid2  userid varchar(255)')->execute();
                }else{
                    $connection->createCommand('create table '.$new_table.' like '.$old_database.'.'.$old_table)->execute();
                    $connection->createCommand('insert into '.$new_table.' select * from '.$old_database.'.'.$old_table)->execute();

                }
              
                //加字段
                if($old_table=='lc_courseuser')
                    $connection->createCommand('alter table '.$new_table.' ADD  task_id int(11)')->execute();
            }
        }
    }

    //更新userid
    public function actionUpdatedata($connection,$update_arr){
        if(!empty($update_arr)){
            foreach ($update_arr as $key => $value) {
                $connection->createCommand($value)->execute();
            }
        }
    }

    //迁移教学计划相关数据
    public function insertPlan($connection1,$connection2){
        //插入教学计划
        $term_list     = [1 => '第一学期',2 => '第二学期',3 => '第三学期',4 => '第四学期',5 => '第五学期',6 => '第六学期',7 => '第七学期',8 => '第八学期'];
        $term_list = array_flip($term_list);
        //print_r($term_list);
        $sql_class_term = "select id,term from lc_class_term";
        $classTermList = $connection1->createCommand($sql_class_term)->queryAll();
        $classTermData = [];
        //print_r($classTermList);
        foreach($classTermList as $k => $v){
            $classTermData[$v['id']] = $v['term'];
        }
        //print_r($classTermData);
        $sql = "select a.classid,enroll_id as grade_id,training_id as correspondence_id,discipline_id,a.courseid as course_id,a.open_term,a.classid as tpn_id from lc_learningplan a ,sms_class b where a.classid = b.id and b.isdelete = 0";
        $planData = $connection1->createCommand($sql)->queryAll();

        foreach($planData as $k => $v){
            $sql_count = "select a.userid,a.class_id,b.idst,b.classid,a.openflag from lc_courseuser a,core_user b
where a.userid = b.idst and b.classid = '".$v['classid']."' and a.openflag = 1";
            $count = count($connection1->createCommand($sql_count)->queryAll());
            if($count){
                $planData[$k]['is_open'] = 1;
            }else{
                $planData[$k]['is_open'] = 0;
            }
			$sql_count = "select a.userid,a.class_id,b.idst,b.classid,a.openflag from lc_courseuser a,core_user b
where a.userid = b.idst and b.classid = '".$v['classid']."' and a.back_only = 0";
            $count_back_only = count($connection1->createCommand($sql_count)->queryAll());
            if($count_back_only){
                $planData[$k]['back_only'] = 0;
            }else{
                $planData[$k]['back_only'] = 1;
            }
            $planData[$k]['class_term'] = $term_list[trim($classTermData[$v['open_term']])];
            unset($planData[$k]['open_term']);
        }
        //print_r($planData);
        //清除新表数据
        $delete='delete from crjy_teaching_task';
        $connection2->createCommand($delete)->execute();
        //foreach($planData as $k => $value){
        //    $connection2->createCommand()->insert('crjy_teaching_task',$value)->execute();
        //}
        $insertKey = ['classid','grade_id','correspondence_id','discipline_id','course_id','tpn_id','is_open','back_only','class_term'];
        /*dump($insertKey);
        dump($planData);die;*/
        $connection2->createCommand()->batchInsert('crjy_teaching_task',$insertKey,$planData)->execute();
		$update = "update lc_courseuser a,crjy_teaching_task b set a.task_id = b.id where a.class_id = b.classid and a.courseid = b.course_id";
        $this->actionUpdatedata($connection2,array($update));
        //专业属于所有的函授站
        $sql_corre = "select id from crjy_correspondence";
        $correData = $connection2->createCommand($sql_corre)->queryAll();
        //print_r($correData);
        $correDataId = [];
        foreach($correData as $k => $v){
            $correDataId[$k] = $v['id'];
        }
        //print_r($correDataId);
        $correspondence_id = implode(',',$correDataId);
        //跟新专业的函授站字段
        $update = "update crjy_discipline  set correspondence_id = '$correspondence_id'";
        $this->actionUpdatedata($connection2,array($update));
        //echo $correspondence_id;

        //根据班级课程计划构造专业教学计划
        $sql = "select a.id,a.grade_id,a.corre_id as correspondence_id,a.disc_id as discipline_id,CONCAT(b.shortname,c.name,d.name,'教学计划') as name,6 as verify_flag
from crjy_class_info a,crjy_grade b,crjy_correspondence c,crjy_discipline d
where a.grade_id = b.id and a.corre_id = c.id and a.disc_id = d.id and a.is_delete = 0 ";
        $teachPlanData = $connection2->createCommand($sql)->queryAll();
        //print_r($teachPlanData);
        //清除新表数据
        $delete='delete from crjy_teach_plan';
        $connection2->createCommand($delete)->execute();
        $insertKey = ['id','grade_id','correspondence_id','discipline_id','name','verify_flag'];

        $connection2->createCommand()->batchInsert('crjy_teach_plan',$insertKey,$teachPlanData)->execute();
        $sql = "select classid as pid,course_id,class_term as term_num from crjy_teaching_task";
        $teachPlanDetailData = $connection2->createCommand($sql)->queryAll();
        //print_r($teachPlanData);
        //清除新表数据
        $delete='delete from crjy_teach_plan_detail';
        $connection2->createCommand($delete)->execute();
        $insertKey = ['pid','course_id','term_num'];
        $connection2->createCommand()->batchInsert('crjy_teach_plan_detail',$insertKey,$teachPlanDetailData)->execute();
        //exit();
    }

}

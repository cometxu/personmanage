<?php

namespace sims\models;

use Yii;
use sims\models\Admin;

/**
 * This is the model class for table "{{%worktime}}".
 *
 * @property integer $id
 * @property integer $pr_id
 * @property string $pr_name
 * @property integer $person_id
 * @property integer $day_time
 * @property string $worktime
 * @property string $notes
 * @property integer $commit_time
 */
class Worktime extends \yii\db\ActiveRecord
{
    public $nameList = [];
    public $projectList = [];
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%worktime}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pr_id', 'person_id','commit_time'], 'integer'],
            [['pr_id', 'day_time','worktime','notes'], 'required','message'=>'{attribute}不能为空'],
            [['worktime'], 'number','message'=>'{attribute}必须为数字'],
            [['pr_name'], 'string', 'max' => 100],
            [['notes'], 'string', 'max' => 225]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pr_id' => '项目ID',
            'pr_name' => '项目名称',
            'person_id' => '提交人',
            'day_time' => '工时日期',
            'worktime' => '工作时间',
            'notes' => '备注',
            'commit_time' => '提交时间',
        ];
    }

    public function getPerson(){
        $person = '';
        $admin = new Admin();

        $myData = $admin ->findOne($this->person_id);
            if(!empty($myData)){
                $person = $myData -> name ;
            }
        return $person;
    }

    public function getName(){                  //获取下拉框人员姓名
        $names ='';
        $names = Admin::find()->asArray()->all();
        foreach($names as $value){
            $this->nameList[$value['id']] = $value['name'];
        }
        return $this->nameList;
    }

    public function getProject(){                     //获取登陆者参加的项目名称
        $projectList='';
        $projectList =ProjectManagement::find()->asArray()->all();
        foreach($projectList as $value)
        {
            $member=explode(',',$value['member']);
            if(in_array($_SESSION['__id'],$member)||($_SESSION['__id']==$value['person'])) {
                $this->projectList[$value['id']] = $value['pr_name'];
            }
        }
        return $this->projectList;
    }
}

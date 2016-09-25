<?php

namespace sims\models;

use Yii;
use sims\models\Admin;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%project_management}}".
 *
 * @property integer $id
 * @property string $pr_name
 * @property integer $person
 * @property string $pro_describe
 * @property string $pro_information
 * @property string $member
 * @property integer $state
 */
class ProjectManagement extends \yii\db\ActiveRecord
{
    public $nameList = [];
    public $memberList = [];

    const STATUS_ING = '1';
    const STATUS_UNFINISH ='2';
    const STATUS_SUSPEND ='3';
    const STATUS_FINISH = '4';

    public static function getStatuses()
    {
        return [
            self::STATUS_ING =>'进行中',
            self::STATUS_UNFINISH => '未完成',
            self::STATUS_SUSPEND => '暂停',
            self::STATUS_FINISH =>'已完成',
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%project_management}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pr_name', 'pro_describe'], 'required','message'=>'{attribute}不能为空'],
            [['person', 'state'], 'required','message'=>'请选择{attribute}'],
//            [['pro_information'],'required','message'=>'请上传压缩文件'],
            [['person', 'state'], 'integer'],
            [['pr_name'], 'string', 'max' => 100],
            [['pro_describe'], 'string', 'max' => 255],
//            [['pro_information'],'file','skipOnEmpty' => false,'extensions'=>'rar,zip'],
        ];
    }


//    public function upload(){
//        if($this->validate()){
//            $now_time = date('Y-m-d',time()+60*60*6);
//            $this->pro_information->saveAs('../uploads/' . $now_time . '/' . $this->pro_information->baseName.$this->pro_information->extension);
//        }
//
//    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pr_name' => '项目名称',
            'person' => '项目负责人',
            'pro_describe' => '项目描述',
            'pro_information' => '项目压缩包',
            'member' => '项目成员',
            'state' => '项目状态',
        ];
    }

    public function getMemberName(){        //获取有资格的成员
        $members ='';
        $members = Admin::find()->where(['role_name' => ['zongadming','test']])->asArray()->all();
        foreach($members as $value){
            $this->memberList[$value['id']] = $value['name'];
        }
        return $this->memberList;
    }

    public function getName(){                  //获取下拉框项目负责人列表
        $names ='';
        $names = Admin::find()->where(['role_name' => ['zongadming','test']])->asArray()->all();
        foreach($names as $value){
            $this->nameList[$value['id']] = $value['name'];
        }
        return $this->nameList;
    }

    public function getPerson(){               //获取列表中项目负责人
        $person = '';
        $admin = new Admin();

        $myData = $admin ->findOne($this->person);
        if(!empty($myData)){
            $person = $myData -> name ;
        }
        return $person;
    }

    public function getMember(){               //项目成员
        $member = '';
        $admin = new Admin();
        $id=explode(',',$this->member);

        $myData = $admin -> findAll($id);
        $rows = ArrayHelper::toArray($myData);          //将对象转化为数组格式
        if(!empty($myData)){
            foreach($rows as $value){
                $member[] = $value['name'] ;
            }
        }
        $member=implode(',',$member);
        return $member;
    }

    public function getState($index)
    {
        $state = '';
        if ($index === 1) {
            $state = "进行中";
        } elseif ($index === 2) {
            $state = "未完成";
        }elseif($index === 3){
            $state = "暂停";
        }elseif($index === 4) {
            $state = "已完成";
        }
        return $state;
    }
}

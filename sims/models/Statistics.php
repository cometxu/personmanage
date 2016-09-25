<?php

namespace sims\models;

use Yii;

/**
 * This is the model class for table "{{%statistics}}".
 *
 * @property integer $id
 * @property string $y_month
 * @property string $pr_name
 * @property string $contain
 */
class Statistics extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return '{{%statistics}}';
    }

    public function rules()
    {
        return [
            [['y_month', 'pr_name', 'contain'], 'required'],
            [['y_month', 'pr_name'], 'string', 'max' => 100],
            [['contain'], 'string', 'max' => 225]
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'y_month' => '工时日期',
            'pr_name' => '项目名称',
            'contain' => '记录',
        ];
    }

    public function getAlltime(){
        $total_time ='';
        $statistics = new Statistics();
        $res = explode(',',$this->contain);
        foreach($res as $value){
            $model = Worktime::find()->where(['id'=>$value])->asArray()->one();
            $total_time = $total_time + $model['worktime'] ;
        }
        return $total_time;
    }

}

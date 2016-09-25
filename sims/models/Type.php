<?php

namespace sims\models;

use Yii;

/**
 * This is the model class for table "{{%type}}".
 *
 * @property integer $id
 * @property integer $pid
 * @property string $name
 * @property string $note
 * @property integer $order
 * @property integer $is_delete
 */
class Type extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%type}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid', 'order', 'is_delete'], 'integer'],
            [['name'], 'required'],
            [['note'], 'string'],
            [['name'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pid' => '父类',
            'name' => '类型名称',
            'note' => 'Note',
            'order' => '排序',
            'is_delete' => 'Is Delete',
        ];
    }
}

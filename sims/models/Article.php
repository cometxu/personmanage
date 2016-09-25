<?php

namespace sims\models;

use Yii;

/**
 * This is the model class for table "{{%article}}".
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property integer $type_id
 * @property string $attach_id
 * @property integer $date
 * @property integer $update_dt
 * @property integer $hits
 * @property integer $notice_dt
 * @property integer $review
 * @property integer $is_delete
 */
class Article extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%article}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content', 'type_id'], 'required'],
            [['content'], 'string'],
            [['type_id', 'date', 'update_dt', 'hits', 'notice_dt', 'review', 'is_delete'], 'integer'],
            [['title'], 'string', 'max' => 255],
            [['attach_id'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => '文章标题',
            'content' => '文章内容',
            'type_id' => '类型',
            'attach_id' => '附件',
            'date' => '创建时间',
            'update_dt' => '更新时间',
            'hits' => '点击数',
            'notice_dt' => '提醒时间',
            'review' => '是否复习',
            'is_delete' => 'Is Delete',
        ];
    }
}

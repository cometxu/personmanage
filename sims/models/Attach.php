<?php

namespace sims\models;

use Yii;

/**
 * This is the model class for table "{{%attach}}".
 *
 * @property integer $id
 * @property string $name
 * @property string $path
 * @property string $size
 * @property integer $type
 * @property string $mime
 */
class Attach extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%attach}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['path'], 'string'],
            [['type'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['size', 'mime'], 'string', 'max' => 50]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => '名称',
            'path' => '路径',
            'size' => '大小',
            'type' => '格式',
            'mime' => '类型',
        ];
    }
}

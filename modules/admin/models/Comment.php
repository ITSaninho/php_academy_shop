<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "comment".
 *
 * @property integer $id
 * @property string $text
 * @property integer $user_id
 * @property integer $product_id
 * @property integer $status
 * @property integer $date
 */
class Comment extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'comment';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'product_id', 'status', 'date'], 'integer'],
            [['date'], 'required'],
            [['text'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '№',
            'text' => 'Текст',
            'user_id' => '№ користувача',
            'product_id' => '№ продукту',
            'status' => 'Статус',
            'date' => 'Дата',
        ];
    }
}

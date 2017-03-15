<?php

namespace app\models;

use Yii;


class Products extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'products';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'alias', 'parent', 'content', 'price'], 'required'],
            [['parent'], 'integer'],
            [['content'], 'string'],
            [['price'], 'number'],
            [['title', 'alias', 'image'], 'string', 'max' => 255],
            [['alias'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'alias' => 'Alias',
            'parent' => 'Parent',
            'content' => 'Content',
            'image' => 'Image',
            'price' => 'Price',
        ];
    }
}

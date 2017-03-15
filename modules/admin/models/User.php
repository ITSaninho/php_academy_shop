<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property integer $id
 * @property string $username
 * @property string $email
 * @property string $password_hash
 * @property string $first_name
 * @property string $second_name
 * @property string $middle_name
 * @property string $address
 * @property integer $rols
 * @property integer $status
 * @property string $auth_key
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $secret_key
 *
 * @property Profile $profile
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['username', 'email', 'password_hash', 'first_name', 'second_name', 'middle_name', 'address', 'status', 'auth_key', 'created_at', 'updated_at'], 'required'],
            [['address'], 'string'],
            [['rols', 'status', 'created_at', 'updated_at'], 'integer'],
            [['username', 'email', 'password_hash', 'first_name', 'second_name', 'middle_name', 'secret_key'], 'string', 'max' => 255],
            [['auth_key'], 'string', 'max' => 32],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '№',
            'username' => 'Логін',
            'email' => 'Почта',
            'password_hash' => 'Пароль',
            'first_name' => 'Імя',
            'second_name' => 'Прізвище',
            'middle_name' => 'По батькові',
            'address' => 'Адресса',
            'rols' => 'Роль',
            'status' => 'Статус',
            'auth_key' => 'Авто ключ',
            'created_at' => 'Зареєстрований',
            'updated_at' => 'Оновлення',
            'secret_key' => 'Секретний ключ',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProfile()
    {
        return $this->hasOne(Profile::className(), ['user_id' => 'id']);
    }
}

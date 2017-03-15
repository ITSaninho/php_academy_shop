<?php

namespace app\models;

use yii\base\Model;
use Yii;
use yii\web\UploadedFile;

class RegForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $status;
    public $first_name;
    public $second_name;
    public $middle_name;
    //public $avatar;
    public $rols;
    public $address;

    public function rules()
    {
        return [
            [['username', 'email', 'password','first_name', 'second_name', 'middle_name', 'address'],'filter', 'filter' => 'trim'],
            [['username', 'email', 'password','first_name', 'second_name', 'middle_name', 'address'],'required'],
            ['username', 'string', 'min' => 2, 'max' => 255],
            ['password', 'string', 'min' => 6, 'max' => 255],
            ['username', 'unique',
                'targetClass' => User::className(),
                'message' => 'Это имя уже занято.'],
            ['email', 'email'],
            ['email', 'unique',
                'targetClass' => User::className(),
                'message' => 'Эта почта уже занята.'],
            ['status', 'default', 'value' => User::STATUS_ACTIVE, 'on' => 'default'],
            ['status', 'in', 'range' =>[
                User::STATUS_NOT_ACTIVE,
                User::STATUS_ACTIVE
            ]],
            ['status', 'default', 'value' => User::STATUS_NOT_ACTIVE, 'on' => 'emailActivation'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'username' => 'Логін',
            'email' => 'Емаил',
            'password' => 'Пароль',
            'id' => 'ID',
            'status' => 'Статус',
            'auth_key' => 'Auth Key',
            'created_at' => 'Дата реєстрації',
            'updated_at' => 'Дата змін',
            //'avatar' => 'Аватар',
            'first_name' => 'Імя',
            'second_name' => 'Прізвище',
            'middle_name' => 'По батькові',
            'address' => 'Адреса',
            'rols' => 'Роль',
        ];
    }

    public function reg()
    {
        //$user = new UploadForm();

        $user = new User();
        $user->username = $this->username;
        $user->email = $this->email;
        //$user->avatar = $this->avatar;
        //$user->file = UploadedFile::getInstance($user, 'avatar');
        //$user->file->saveAs('uploads/user' . $user->file->baseName . '.' . $user->file->extension);
        $user->first_name = $this->first_name;
        $user->second_name = $this->second_name;
        $user->middle_name = $this->middle_name;
        $user->address = $this->address;
        $user->status = $this->status;
        $user->setPassword($this->password);
        $user->generateAuthKey();
        if($this->scenario === 'emailActivation')
            $user->generateSecretKey();
        return $user->save() ? $user : null;
    }

    public function sendActivationEmail($user)
    {
        return Yii::$app->mailer->compose('activationEmail', ['user' => $user])
            ->setFrom([Yii::$app->params['supportEmail'] => Yii::$app->name.' (отправлено автоматично).'])
            ->setTo($this->email)
            ->setSubject('Активація для '.Yii::$app->name)
            ->send();
    }
}
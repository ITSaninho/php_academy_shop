<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 26.08.2015
 * Time: 11:42
 * @var $this yii\web\View
 * @var $user app\models\User
 */
use yii\helpers\Html;

echo 'Привет '.Html::encode($user->username).'.';
echo Html::a('Для активації облікового запису перейдіть за цим посиланням.',
    Yii::$app->urlManager->createAbsoluteUrl(
        [
            '/main/activate-account',
            'key' => $user->secret_key
        ]
    ));

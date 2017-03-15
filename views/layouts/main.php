<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use app\assets\ltAppAsset;

AppAsset::register($this);
ltAppAsset::register($this);
?>
<?php $this->beginPage() ?>
    <!DOCTYPE html>
    <html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>

        <link rel="shortcut icon" href="images/ico/favicon.ico">
    </head><!--/head-->

    <body>
    <?php $this->beginBody() ?>
    <header id="header"><!--header-->


        <div class="header-middle"><!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="logo pull-left">
                            <a href="<?= \yii\helpers\Url::home()?>"><?= Html::img('@web/images/home/logo.png', ['alt' => 'Магаз'])?></a>
                        </div>
                        <div class="btn-group pull-right">
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href="<?= \yii\helpers\Url::home()?>"><i class="fa fa-crosshairs"></i> Головна</a></li>
                                <?php if(!Yii::$app->user->isGuest): ?>
                                <li><a href="<?= \yii\helpers\Url::to(['/site/account'])?>"><i class="fa fa-crosshairs"></i> Акаунт</a></li>
                                <?php endif;?>
                                <li><a href="<?= \yii\helpers\Url::to(['/site/contact'])?>"><i class="fa fa-crosshairs"></i> Контакти</a></li>
                                <li><a href="<?= \yii\helpers\Url::to(['/site/about'])?>"><i class="fa fa-crosshairs"></i> Про сайт</a></li>
                                <li><a href="#" onclick="return getCart()"><i class="fa fa-shopping-cart"></i> Корзина</a></li>
                                <?php if(!Yii::$app->user->isGuest): ?>
                                    <li><a href="<?= \yii\helpers\Url::to(['/site/logout'])?>"><i class="fa fa-user"></i> <?= Yii::$app->user->identity['username']?> (Вихід)</a></li>
                                <?php else :?>
                                    <li><a href="<?= \yii\helpers\Url::to(['/site/login'])?>"><i class="fa fa-lock"></i> Вхід</a></li>
                                    <li><a href="<?= \yii\helpers\Url::to(['/site/reg'])?>"><i class="fa fa-lock"></i> Реєстрація</a></li>
                                <?php endif;?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-middle-->

        <div class="header-bottom"><!--header-bottom-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="search_box">
                            <form method="get" action="<?= \yii\helpers\Url::to(['category/search'])?>">
                                <input type="text" placeholder="Search" name="q">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->
    </header><!--/header-->

    <?= $content ?>

    <footer id="footer"><!--Footer-->


        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <p class="pull-left">Sani Shop © 2017</p>
                </div>
            </div>
        </div>

    </footer><!--/Footer-->
    <?php
    if (Yii::$app->user->isGuest):
        $menuItems[] = [
            'label' => 'Регистрація',
            'url' => ['/site/reg']
        ];
        $menuItems[] = [
            'label' => 'Увійти',
            'url' => ['/site/login']
        ];
    endif;
    ?>

    <?php
    \yii\bootstrap\Modal::begin([
        'header' => '<h2>Кошик</h2>',
        'id' => 'cart',
        'size' => 'modal-lg',
        'footer' => '<button type="button" class="btn btn-default" data-dismiss="modal">Продовжити покупки</button>
        <a href="' . \yii\helpers\Url::to(['cart/view']) . '" class="btn btn-success">Оформити замовлення</a>
        <button type="button" class="btn btn-danger" onclick="clearCart()">Очистити кошик</button>'
    ]);

    \yii\bootstrap\Modal::end();
    ?>

    <?php $this->endBody() ?>
    </body>
    </html>
<?php $this->endPage() ?>
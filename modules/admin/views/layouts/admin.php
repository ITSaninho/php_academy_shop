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
        <title>Админка | <?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>

        <?php
        //        $this->registerJsFile('js/html5shiv.js', ['position' => \yii\web\View::POS_HEAD, 'condition' => 'lte IE9']);
        //        $this->registerJsFile('js/respond.min.js', ['position' => \yii\web\View::POS_HEAD, 'condition' => 'lte IE9']);
        ?>

        <link rel="shortcut icon" href="images/ico/favicon.ico">
    </head><!--/head-->

    <body>
    <?php $this->beginBody() ?>
    <header id="header"><!--header-->


        <div class="header-middle"><!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="logo pull-left">
                            <a href="<?= \yii\helpers\Url::home()?>"><?= Html::img('@web/images/home/logo.png', ['alt' => 'E-SHOPPER'])?></a>
                        </div>
                        <div class="btn-group pull-right">
                        </div>
                    </div>
                    <div class="col-sm-10">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="<?=\yii\helpers\Url::to(['/admin/default']) ?>"><i class="fa fa-crosshairs"></i> Головна</a></li>
                                <li><a href="<?=\yii\helpers\Url::to(['/admin']) ?>"><i class="fa fa-crosshairs"></i> Замовлення</a></li>
                                <li class="dropdown"><a href="#">Користувачі<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="<?=\yii\helpers\Url::to(['user/create']) ?>">Додати Користувачи</a></li>
                                        <li><a href="<?=\yii\helpers\Url::to(['user/index']) ?>">Список Користувачи</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">Категорії<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="<?=\yii\helpers\Url::to(['category/create']) ?>">Додати категорий</a></li>
                                        <li><a href="<?=\yii\helpers\Url::to(['category/index']) ?>">Список категорию</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">Товари<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="<?=\yii\helpers\Url::to(['product/create']) ?>">Додати товар</a></li>
                                        <li><a href="<?=\yii\helpers\Url::to(['product/index']) ?>">Список товарів</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">Коментарі<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="<?=\yii\helpers\Url::to(['comment/create']) ?>">Додати коментар</a></li>
                                        <li><a href="<?=\yii\helpers\Url::to(['comment/index']) ?>">Список товарів</a></li>
                                    </ul>
                                </li>
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

    <div class="container">
        <?php if( Yii::$app->session->hasFlash('success') ): ?>
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <?php echo Yii::$app->session->getFlash('success'); ?>
            </div>
        <?php endif;?>
        <?= $content ?>
    </div>

    <footer id="footer"><!--Footer-->

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
            'label' => 'Реєстрація',
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
        <a href="' . \yii\helpers\Url::to(['cart/view']) . '" class="btn btn-success">Оформитb замовлення</a>
        <button type="button" class="btn btn-danger" onclick="clearCart()">Очистити кошик</button>'
    ]);

    \yii\bootstrap\Modal::end();
    ?>

    <?php $this->endBody() ?>
    </body>
    </html>
<?php $this->endPage() ?>

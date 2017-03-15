<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>
<section>
    <div class="container">
        <div class="row">
            <div class="site-error container">

                <h1><?= Html::encode($this->title) ?></h1>

                <div class="alert alert-danger">
                    <?= nl2br(Html::encode($message)) ?>
                </div>

                <p>
                    Сталася помилка під час вище веб-сервер обробки вашого запиту.
                </p>
                <p>
                    Будь ласка, зв'яжіться з нами, якщо ви думаєте, що це помилка сервера. Дякую.
                </p>

            </div>
        </div>
    </div>
</section>

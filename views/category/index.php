<?php

/* @var $this yii\web\View */
use yii\helpers\Html;
?>


<section>
    <div class="container">
        <div class="row">

            <div class="col-sm-3">
                <div class="left-sidebar">
                    <ul class="catalog category-products">
                        <h2>Категорії</h2>
                        <?= \app\components\MenuWidget::widget(['tpl' => 'menu'])?>
                    </ul>
                </div>
            </div>

            <div class="col-sm-9 padding-right">
                <?php if( !empty($hits) ): ?>
                    <div class="features_items"><!--features_items-->
                        <h2 class="title text-center">Рекомендовані товари</h2>
                        <?php foreach($hits as $hit): ?>
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <?= Html::img("@web/images/products/{$hit->img}", ['alt' => $hit->name])?>
                                            <h2>$<?= $hit->price?></h2>
                                            <p><a href="<?= \yii\helpers\Url::to(['product/view', 'id' => $hit->id]) ?>"><?= $hit->name?></a></p>
                                            <a href="<?= \yii\helpers\Url::to(['cart/add', 'id' => $hit->id])?>" data-id="<?= $hit->id?>" class="btn btn-default add-to-cart">Додати в кошик</a>
                                        </div>
                                        <?php if($hit->new): ?>
                                            <?= Html::img("@web/images/home/new.png", ['alt' => 'Новинка', 'class' => 'new'])?>
                                        <?php endif?>
                                        <?php if($hit->sale): ?>
                                            <?= Html::img("@web/images/home/sale.png", ['alt' => 'Розпродажа', 'class' => 'new'])?>
                                        <?php endif?>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach;?>
                    </div><!--features_items-->
                <?php endif; ?>
                <?php
        echo \yii\widgets\LinkPager::widget([
            'pagination' => $pages,
        ]);
        ?>





            </div>
        </div>
    </div>
</section>
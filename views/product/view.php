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

<?php
$mainImg = $product->getImage();
$gallery = $product->getImages();
?>

<div class="col-sm-9 padding-right">
<div class="product-details"><!--product-details-->
    <div class="col-sm-5">
        <div class="view-product">
            <?= Html::img($mainImg->getUrl(), ['alt' => $product->name])?>
            <h3>ZOOM</h3>
        </div>
        <div id="similar-product" class="carousel slide" data-ride="carousel">

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
<?php $count = count($gallery); $i = 0; foreach($gallery as $img): ?>
    <?php if($i % 3 == 0):?>
        <div class="item <?php if($i == 0) echo ' active'?>">
    <?php endif;?>
        <a href=""><?= Html::img($img->getUrl('84x85'), ['alt' => ''])?></a>
    <?php $i++; if($i % 3 == 0 || $i == $count):?>
        </div>
    <?php endif;?>
<?php endforeach;?>
            </div>

            <!-- Controls -->
            <a class="left item-control" href="#similar-product" data-slide="prev">
                <i><</i>
            </a>
            <a class="right item-control" href="#similar-product" data-slide="next">
                <i>></i>
            </a>
        </div>

    </div>
    <div class="col-sm-7">
        <div class="product-information"><!--/product-information-->
            <?php if($product->new): ?>
                <?= Html::img("@web/images/home/new.png", ['alt' => 'Новинка', 'class' => 'newarrival'])?>
            <?php endif?>
            <?php if($product->sale): ?>
                <?= Html::img("@web/images/home/sale.png", ['alt' => 'Распродажа', 'class' => 'newarrival'])?>
            <?php endif?>
            <h2><?= $product->name?></h2>
								<span>
									<span><?= $product->price?> грн</span>
									<label>Кількість:</label>
									<input type="text" value="1" id="qty" />
									<a href="<?= \yii\helpers\Url::to(['cart/add', 'id' => $product->id])?>" data-id="<?= $product->id?>" class="btn btn-fefault add-to-cart cart">
                                        в кошик
                                    </a>
								</span>
            <p><b>Brand:</b> <a href="<?= \yii\helpers\Url::to(['category/view', 'id' => $product->category->id]) ?>"><?= $product->category->name?></a></p>
            <?= $product->content?>
        </div><!--/product-information-->
    </div>
    <?php if(!empty($comments)):?>

        <?php foreach($comments as $comment):?>
            <div class="bottom-comment"><!--bottom comment-->
                <div class="comment-img">
                    <img width="50" class="img-circle" src="<?= $comment->user->image; ?>" alt="">
                </div>

                <div class="comment-text">
                    <a href="#" class="replay btn pull-right"> Коментарі</a>
                    <h5><?= $comment->user->name;?></h5>

                    <p class="comment-date">
                        <?= $comment->getDate();?>
                    </p>


                    <p class="para"><?= $comment->text; ?></p>
                </div>
            </div>
        <?php endforeach;?>

    <?php endif;?>
    <!-- end bottom comment-->

    <?php if(!Yii::$app->user->isGuest):?>
        <div class="leave-comment padding"><!--leave comment-->
            <h4>Коментарі</h4>
            <?php if(Yii::$app->session->getFlash('comment')):?>
                <div class="alert alert-success" role="alert">
                    <?= Yii::$app->session->getFlash('comment'); ?>
                </div>
            <?php endif;?>
            <?php $form = \yii\widgets\ActiveForm::begin([
                'action'=>['product/comment', 'id'=>$product->id],
                'options'=>['class'=>'form-horizontal contact-form', 'role'=>'form']])?>
            <div class="padding">
                <div class="col-md-12">
                    <?= $form->field($commentForm, 'comment')->textarea(['class'=>'form-control','placeholder'=>'Текст'])->label(false)?>
                </div>
            </div>

            <button type="submit" class="btn send-btn">Відправити</button>
            <?php \yii\widgets\ActiveForm::end();?>
        </div><!--end leave comment-->
    <?php endif;?>
</div><!--/product-details-->

<div class="recommended_items">
    <!--recommended_items-->
    <h2 class="title text-center">Рекомендовані</h2>

    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
<?php $count = count($hits); $i = 0; foreach($hits as $hit): ?>
<?php if($i % 3 == 0): ?>
    <div class="item <?php if($i == 0) echo 'active' ?>">
<?php endif; ?>
        <div class="col-sm-4">
            <div class="product-image-wrapper">
                <div class="single-products">
                    <div class="productinfo text-center">
                        <?= Html::img("@web/images/products/{$hit->img}", ['alt' => $hit->name])?>
                        <h2>$<?= $hit->price?></h2>
                        <p><a href="<?= \yii\helpers\Url::to(['product/view', 'id' => $hit->id])?>"><?= $hit->name?></a></p>
                        <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                    </div>
                </div>
            </div>
        </div>
<?php $i++; if($i % 3 == 0 || $i == $count): ?>
    </div>
<?php endif; ?>
<?php endforeach; ?>
        </div>
        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
            <i><</i>
        </a>
        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
            <i>></i>
        </a>
    </div>
</div><!--/recommended_items-->

</div>
</div>
</div>
</section>
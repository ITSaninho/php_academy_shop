<?php

/* @var $this yii\web\View */
use yii\helpers\Html;
use yii\widgets\ActiveForm;

?>


<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2>Category</h2>
                    <ul class="catalog category-products">
                        <?= \app\components\MenuWidget::widget(['tpl' => 'menu'])?>
                    </ul>
                </div>
            </div>

            <div class="col-sm-9 padding-right">
                <div class="main-profile">
                    <?php if(!Yii::$app->user->isGuest):?>

                    <?php $form = ActiveForm::begin(); ?>
                    <?php
                    if($model)
                        echo $form->field($model, 'username');
                    ?>
                    <?= $form->field($model, 'first_name') ?>
                    <?= $form->field($model, 'second_name') ?>
                    <?= $form->field($model, 'middle_name') ?>
                    <?= $form->field($model, 'address') ?>

                    <div class="form-group">
                        <?= Html::submitButton('Редактировать', ['class' => 'btn btn-primary']) ?>
                    </div>
                    <?php ActiveForm::end(); ?>
                    <?php endif;?>

                </div><!-- main-profile -->





            </div>
        </div>
    </div>
</section>
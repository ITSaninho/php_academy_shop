<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\SendEmailForm */
/* @var $form ActiveForm */
?>
<section>
	<div class="container">
		<div class="row">
			<div class="main-sendEmail">

			    <?php $form = ActiveForm::begin(); ?>

			        <?= $form->field($model, 'email') ?>
			    
			        <div class="form-group">
			            <?= Html::submitButton('Відправити', ['class' => 'btn btn-primary']) ?>
			        </div>
			    <?php ActiveForm::end(); ?>

			</div><!-- main-sendEmail -->
		</div>
	</div>
</section>

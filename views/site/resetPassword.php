<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ResetPasswordForm */
/* @var $form ActiveForm */
?>
<section>
	<div class="container">
		<div class="row">
			<div class="main-resetPassword">

			    <?php $form = ActiveForm::begin(); ?>

			        <?= $form->field($model, 'password')->passwordInput() ?>
			    
			        <div class="form-group">
			            <?= Html::submitButton('Змінити', ['class' => 'btn btn-primary']) ?>
			        </div>
			    <?php ActiveForm::end(); ?>

			</div><!-- main-resetPassword -->
		</div>
	</div>
</section>

<?php
/**
 * @var $this yii\web\View
 * @var $model webvimark\modules\UserManagement\models\forms\LoginForm
 */

use webvimark\modules\UserManagement\components\GhostHtml;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
?>

<div class="container" id="login-wrapper">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-body">

					<?php $form = ActiveForm::begin([
						'id'      => 'pin-form',
						'options'=>['autocomplete'=>'off'],
						'validateOnBlur'=>false,
						'fieldConfig' => [
							'template'=>"{input}\n{error}",
						],
					]) ?>

					<?= $form->field($model, 'pin')
						->textInput(['placeholder'=>$model->getAttributeLabel('pin'), 'autocomplete'=>'off']) ?>

					<?= Html::submitButton(
						UserManagementModule::t('front', 'Enter'),
						['class' => 'btn btn-lg btn-primary btn-block']
					) ?>

					<?php ActiveForm::end() ?>
				</div>
			</div>
		</div>
	</div>
</div>

<?php
$css = <<<CSS
html, body {
	background-image: url('/img/main.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	-webkit-box-shadow: inset 0 0 100px rgba(0,0,0,.5);
	box-shadow: inset 0 0 100px rgba(0,0,0,.5);
	height: 100%;
	min-height: 100%;
	position: relative;
}
#login-wrapper {
	position: absolute;
	top: 40%;
}
.panel{
	opacity:0.82;
}
CSS;

$this->registerCss($css);
?>
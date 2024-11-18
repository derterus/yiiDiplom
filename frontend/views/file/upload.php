<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->title = 'Загрузка файла';
?>

<h1><?= Html::encode($this->title) ?></h1>

<div class="file-upload-form">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'file')->fileInput(['accept' => '.csv,.xml,.yaml,.yml,.txt']) ?>

    <div class="form-group">
        
        <?= Html::submitButton('Загрузить', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>
</div>

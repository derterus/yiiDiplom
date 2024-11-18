<?php
/* @var $this yii\web\View */
use yii\helpers\Html;

$this->title = 'Загрузка файлов';
?>

<div class="site-index">
    <h1><?= Html::encode($this->title) ?></h1>

    <p><?= Html::encode($message) ?></p>

    <h2>Скачайте файлы:</h2>
    <ul>
        <li><?= Html::a('Скачать CSV', $csvFile) ?></li>
        <li><?= Html::a('Скачать TXT', $txtFile) ?></li>
        <li><?= Html::a('Скачать XML', $xmlFile) ?></li>
        <li><?= Html::a('Скачать YAML', $yamlFile) ?></li>
    </ul>
</div>

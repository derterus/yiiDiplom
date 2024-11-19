<?php
use yii\helpers\Html;
use yii\helpers\Url;

// Ссылки для экспорта
echo Html::a('Export CSV', Url::to(['export/export', 'type' => 'csv']), ['class' => 'export-link']);
echo '<br>';
echo Html::a('Export XML', Url::to(['export/export', 'type' => 'xml']), ['class' => 'export-link']);
echo '<br>';
echo Html::a('Export YAML', Url::to(['export/export', 'type' => 'yaml']), ['class' => 'export-link']);
echo '<br>';
echo Html::a('Export TXT', Url::to(['export/export', 'type' => 'txt']), ['class' => 'export-link']);

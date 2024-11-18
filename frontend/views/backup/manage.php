<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\Url;

/* @var $files array */
$this->title = 'Управление бэкапами';
?>

<div class="backup-management">
    <h1><?= Html::encode($this->title) ?></h1>

    <!-- Форма для создания бэкапа базы данных -->
    <div class="create-backup">
        <h2>Создать бэкап базы данных</h2>
        <?php $form = ActiveForm::begin(['action' => Url::to(['backup/create-database-backup'])]); ?>
            <?= Html::submitButton('Создать бэкап базы данных', ['class' => 'btn btn-success']) ?>
        <?php ActiveForm::end(); ?>
    </div>

    <!-- Форма для создания бэкапа таблицы -->
    <div class="create-backup">
    <h2>Создать бэкап таблицы</h2>
    <?php $form = ActiveForm::begin(['action' => Url::to(['backup/create-table-backup']), 'method' => 'post']); ?>
        <div class="form-group">
            <?= Html::label('Имя таблицы', 'tableName') ?>
            <?= Html::textInput('tableName', '', ['class' => 'form-control', 'placeholder' => 'Введите имя таблицы']) ?>
        </div>
        <?= Html::submitButton('Создать бэкап таблицы', ['class' => 'btn btn-primary']) ?>
    <?php ActiveForm::end(); ?>
</div>


    <!-- Список бэкапов -->
    <div class="backup-list">
        <h2>Существующие бэкапы</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Файл бэкапа</th>
                    <th>Действия</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($files as $file): ?>
                    <tr>
                        <td><?= Html::encode(basename($file)) ?></td>
                        <td>
                            <!-- Восстановление базы данных -->
                            <a href="<?= Url::to(['backup/restore-database-backup', 'filename' => basename($file)]) ?>" class="btn btn-info">Восстановить базу данных</a>
                            <!-- Восстановление таблицы -->
                            <a href="<?= Url::to(['backup/restore-table-backup', 'tableName' => 'your_table_name', 'filename' => basename($file)]) ?>" class="btn btn-warning">Восстановить таблицу</a>
                            <!-- Удаление -->
                            <a href="<?= Url::to(['backup/delete-database-backup', 'filename' => basename($file)]) ?>" class="btn btn-danger" data-confirm="Вы уверены, что хотите удалить этот бэкап?" data-method="post">Удалить</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Стили для улучшения интерфейса -->
<style>
    .create-backup {
        margin-bottom: 20px;
    }
    .backup-list {
        margin-top: 40px;
    }
    .backup-list table {
        width: 100%;
    }
</style>

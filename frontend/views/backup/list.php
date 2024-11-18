<?php
/* @var $files array */

echo "<h1>Список бэкапов</h1>";
echo "<ul>";
foreach ($files as $file) {
    echo "<li><a href='/backups/" . basename($file) . "' target='_blank'>" . basename($file) . "</a> 
              <a href='" . \yii\helpers\Url::to(['backup/delete-database-backup', 'filename' => basename($file)]) . "'>Удалить</a></li>";
}
echo "</ul>";
?>

<?php
/* @var $message string */
/* @var $filePath string */

echo "<h1>$message</h1>";
if (isset($filePath)) {
    echo "<p>Файл бэкапа: <a href='/backups/" . basename($filePath) . "' target='_blank'>Скачать</a></p>";
}
?>

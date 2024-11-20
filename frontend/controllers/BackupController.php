<?php

namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\helpers\FileHelper;
use yii\base\ErrorException;

class BackupController extends Controller
{
    // Папка для хранения бэкапов
    private $backupPath = '@app/web/backups';

    public function init()
    {
        parent::init();
        // Убедимся, что директория для бэкапов существует
        if (!is_dir(Yii::getAlias($this->backupPath))) {
            FileHelper::createDirectory(Yii::getAlias($this->backupPath), 0777);
        }
    }
    public function actionManage()
{
    // Получаем список всех бэкапов в папке
    $files = FileHelper::findFiles(Yii::getAlias($this->backupPath));

    return $this->render('manage', [
        'files' => $files,
    ]);
}

public function actionCreateDatabaseBackup()
{
    $db = Yii::$app->db;
    $filename = 'database_backup_' . date('Y_m_d_H_i_s') . '.sql';
    $filePath = Yii::getAlias($this->backupPath . '/' . $filename);

    // Проверка существования директории для хранения бэкапов
    $backupDir = Yii::getAlias($this->backupPath);
    if (!is_dir($backupDir)) {
        // Попытка создать директорию, если её нет
        if (!FileHelper::createDirectory($backupDir)) {
            throw new ErrorException("Не удалось создать директорию для бэкапов.");
        }
    }

    // Получение имени базы данных из DSN
    $dsn = $db->dsn;
    preg_match('/dbname=([a-zA-Z0-9_]+)/', $dsn, $matches);
    $dbName = isset($matches[1]) ? $matches[1] : null;

    if (empty($dbName)) {
        throw new ErrorException("Не удалось получить имя базы данных.");
    }

    // Проверка существования команды mysqldump
    $commandCheck = shell_exec('which mysqldump');
    if (empty($commandCheck)) {
        throw new ErrorException("Команда mysqldump не найдена. Убедитесь, что mysqldump установлен на сервере.");
    }

    // Создание команды для бэкапа базы данных
    $command = "mysqldump -u " . escapeshellarg($db->username) . " -p" . escapeshellarg($db->password) . " " . escapeshellarg($dbName) . " > " . escapeshellarg($filePath);

    // Выполнение команды mysqldump
    $output = shell_exec($command);

    // Проверка на успешное выполнение команды
    if ($output === null) {
        // Проверка, что файл был создан
        if (!file_exists($filePath)) {
            throw new ErrorException("Бэкап не был создан, файл не существует.");
        }

        return $this->render('success', [
            'message' => "Бэкап базы данных успешно создан: $filename",
            'filePath' => $filePath
        ]);
    } else {
        throw new ErrorException("Ошибка при создании бэкапа: " . $output);
    }
}



public function actionCreateTableBackup()
{
    // Получаем имя таблицы из POST-запроса
    $tableName = Yii::$app->request->post('tableName');
    
    // Проверяем, что имя таблицы не пустое
    if (empty($tableName)) {
        throw new ErrorException("Имя таблицы не указано.");
    }

    $db = Yii::$app->db;
    $filename = 'table_backup_' . $tableName . '_' . date('Y_m_d_H_i_s') . '.sql';
    $filePath = Yii::getAlias($this->backupPath . '/' . $filename);

    // Получение имени базы данных из DSN
    $dsn = $db->dsn;
    preg_match('/dbname=([a-zA-Z0-9_]+)/', $dsn, $matches);
    $dbName = isset($matches[1]) ? $matches[1] : null;

    // Формируем команду для mysqldump с использованием параметров безопасности
    $command = "mysqldump -u " . escapeshellarg($db->username) . " -p" . escapeshellarg($db->password) . " " . escapeshellarg($dbName) . " " . escapeshellarg($tableName) . " --no-tablespaces --no-set-names --skip-comments > " . escapeshellarg($filePath);

    // Логируем команду для отладки
    Yii::error("Running command: " . $command);

    // Выполнение команды mysqldump
    $output = shell_exec($command);

    // Проверка на успешное выполнение команды
    if ($output === null) {
        // Проверяем, создался ли файл
        if (file_exists($filePath)) {
            return $this->render('success', [
                'message' => "Бэкап таблицы '$tableName' успешно создан: $filename",
                'filePath' => $filePath
            ]);
        } else {
            throw new ErrorException("Файл не был создан. Возможно, таблица пуста или возникла ошибка при создании.");
        }
    } else {
        // Если команда не выполнилась, выводим ошибку
        throw new ErrorException("Ошибка при создании бэкапа: " . $output);
    }
}

public function actionRestoreDatabaseBackup($filename)
{
    // Путь к файлу бэкапа
    $filePath = Yii::getAlias($this->backupPath . '/' . $filename);

    // Проверяем, существует ли файл
    if (!file_exists($filePath)) {
        throw new NotFoundHttpException("Бэкап файл не найден: $filename");
    }

    // Получаем параметры подключения из DSN
    $db = Yii::$app->db;
    $dsn = $db->dsn;
    preg_match('/dbname=([a-zA-Z0-9_]+)/', $dsn, $matches);
    $dbName = isset($matches[1]) ? $matches[1] : null;

    // Если имя базы данных не удалось извлечь
    if (empty($dbName)) {
        throw new ErrorException("Не удалось извлечь имя базы данных из DSN.");
    }

    // Формируем команду для восстановления базы данных
    $command = "mysql -u " . escapeshellarg($db->username) . " -p" . escapeshellarg($db->password) . " " . escapeshellarg($dbName) . " < " . escapeshellarg($filePath);

    // Выполняем команду
    $output = shell_exec($command);

    // Проверяем успешность выполнения команды
    if ($output === null) {
        return $this->render('success', [
            'message' => "База данных успешно восстановлена из бэкапа: $filename"
        ]);
    } else {
        throw new ErrorException("Ошибка при восстановлении базы данных: " . $output);
    }
}


public function actionRestoreTableBackup($tableName, $filename)
{
    // Путь к файлу бэкапа
    $filePath = Yii::getAlias($this->backupPath . '/' . $filename);

    // Проверяем, существует ли файл
    if (!file_exists($filePath)) {
        throw new NotFoundHttpException("Бэкап файл не найден: $filename");
    }

    // Получаем параметры подключения из DSN
    $db = Yii::$app->db;
    $dsn = $db->dsn;
    preg_match('/dbname=([a-zA-Z0-9_]+)/', $dsn, $matches);
    $dbName = isset($matches[1]) ? $matches[1] : null;

    // Если имя базы данных не удалось извлечь
    if (empty($dbName)) {
        throw new ErrorException("Не удалось извлечь имя базы данных из DSN.");
    }

    // Формируем команду для восстановления таблицы
    $command = $command = "mysql --default-character-set=utf8mb4 -u " . escapeshellarg($db->username) .
    " -p" . escapeshellarg($db->password) . " " . escapeshellarg($dbName) .
    " < " . escapeshellarg($filePath);


    // Выполняем команду
    $output = shell_exec($command);

    // Проверяем успешность выполнения команды
    if ($output === null) {
        return $this->render('success', [
            'message' => "Таблица '$tableName' успешно восстановлена из бэкапа: $filename"
        ]);
    } else {
        throw new ErrorException("Ошибка при восстановлении таблицы: " . $output);
    }
}


    // Действие для удаления бэкапа базы данных
    public function actionDeleteDatabaseBackup($filename)
    {
        $filePath = Yii::getAlias($this->backupPath . '/' . $filename);

        if (file_exists($filePath)) {
            unlink($filePath);
            return $this->render('success', [
                'message' => "Бэкап базы данных '$filename' успешно удалён"
            ]);
        } else {
            throw new NotFoundHttpException("Бэкап файл не найден: $filename");
        }
    }

    // Действие для удаления бэкапа таблицы
    public function actionDeleteTableBackup($filename)
    {
        $filePath = Yii::getAlias($this->backupPath . '/' . $filename);

        if (file_exists($filePath)) {
            unlink($filePath);
            return $this->render('success', [
                'message' => "Бэкап таблицы '$filename' успешно удалён"
            ]);
        } else {
            throw new NotFoundHttpException("Бэкап файл не найден: $filename");
        }
    }

    // Действие для отображения списка бэкапов
    public function actionListBackups()
    {
        $files = FileHelper::findFiles(Yii::getAlias($this->backupPath));
        return $this->render('list', [
            'files' => $files
        ]);
    }
}

<?php

namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use yii\web\UploadedFile;
use yii\web\BadRequestHttpException;
use common\models\UploadForm;
use yii\helpers\Json;
use Symfony\Component\Yaml\Yaml;

class FileController extends Controller
{
    public $enableCsrfValidation = false; // Отключение CSRF для загрузки файлов через POST

    public function actionUpload()
    {
        $model = new UploadForm();

        if (Yii::$app->request->isPost) {
            $model->file = UploadedFile::getInstance($model, 'file');
            if ($model->validate()) {
                $filePath = 'uploads/' . $model->file->baseName . '.' . $model->file->extension;
                if ($model->file->saveAs($filePath)) {
                    try {
                        $this->processFile($filePath);
                        Yii::$app->session->setFlash('success', 'Файл успешно обработан.');
                    } catch (\Exception $e) {
                        Yii::$app->session->setFlash('error', 'Ошибка при обработке файла: ' . $e->getMessage());
                    }
                } else {
                    Yii::$app->session->setFlash('error', 'Ошибка сохранения файла.');
                }
            } else {
                Yii::$app->session->setFlash('error', 'Ошибка загрузки файла.');
            }
        }

        return $this->render('upload', ['model' => $model]);
    }

        private function processFile($filePath)
        {
            $extension = pathinfo($filePath, PATHINFO_EXTENSION);
            $data = [];

            switch ($extension) {
                case 'csv':
                case 'txt':
                    $data = $this->parseMultiTableCsv($filePath);
                    break;
                case 'yaml':
                case 'yml':
                    $data = $this->parseYaml($filePath);
                    break;
                case 'xml':
                    $data = $this->parseXml($filePath);
                    break;
                default:
                    throw new BadRequestHttpException('Unsupported file format: ' . $extension);
            }

        
            $this->saveMultipleTables($data);
        }

    // Парсинг CSV с несколькими таблицами
    private function parseMultiTableCsv($filePath)
    {
        $sections = preg_split('/\r\n\r\n|\n\n/', file_get_contents($filePath));
        $result = [];

        foreach ($sections as $section) {
            $lines = array_filter(explode("\n", $section));
            $tableName = strtolower(trim(array_shift($lines))); // Имя таблицы
            $headers = str_getcsv(array_shift($lines)); // Заголовки
            $rows = [];

            foreach ($lines as $line) {
                $rows[] = array_combine($headers, str_getcsv($line));
            }

            $result[$tableName] = $rows;
        }

        return $result;
    }

    // Парсинг YAML
    private function parseYaml($filePath)
    {
        return Yaml::parseFile($filePath);
    }

    private function parseXml($filePath)
    {
        // Загружаем XML из файла
        $xml = simplexml_load_file($filePath);
        if ($xml === false) {
            throw new BadRequestHttpException('Invalid XML file');
        }
    
        // Массив для хранения данных для всех таблиц
        $data = [];
    
        // Проходим по всем верхнеуровневым элементам (например, categories, manufacturers)
        foreach ($xml as $tableName => $table) {
            // Проверяем, что в каждом элементе есть дочерние строки (например, <row>)
            if ($table->row) {
                // Преобразуем строки в массив
                $tableData = $this->simpleXmlToArray($table);
    
                // Добавляем данные для этой таблицы в итоговый массив
                $data[$tableName] = $tableData;
            }
        }
    
        // Возвращаем массив с данными для всех таблиц
        return $data;
    }
    
    

    private function simpleXmlToArray($xmlObject)
    {
        $array = [];
        // Проходим по всем строкам <row> в текущем элементе
        foreach ($xmlObject->row as $row) {
            $rowArray = [];
            // Преобразуем каждый элемент в ассоциативный массив
            foreach ($row as $key => $value) {
                $rowArray[$key] = (string)$value;
            }
            // Добавляем строку в итоговый массив
            $array[] = $rowArray;
        }
        return $array;
    }
    



private function saveMultipleTables($data)
{
    $db = Yii::$app->db;
    
    // Логируем данные для проверки
    Yii::info('Данные для вставки: ' . Json::encode($data));

    foreach ($data as $tableName => $rows) {
        // Проверяем, что $tableName действительно существует и rows не пуст
        if (empty($tableName) || !is_array($rows)) {
            Yii::error("Неверная структура данных для таблицы: $tableName");
            throw new BadRequestHttpException("Ошибка в структуре данных для таблицы $tableName");
        }

        Yii::info("Начинаем вставку в таблицу: $tableName");

        foreach ($rows as $row) {
            if (!is_array($row) || empty($row)) {
                Yii::error("Некорректные данные для строки таблицы $tableName: " . Json::encode($row));
                throw new BadRequestHttpException("Некорректные данные для строки таблицы $tableName");
            }

            // Логируем структуру строки перед вставкой
            Yii::info("Данные строки для вставки: " . Json::encode($row));

            // Проверяем, что ключи строки совпадают с колонками таблицы
            $columns = Yii::$app->db->getTableSchema($tableName)->getColumnNames();
            foreach ($row as $key => $value) {
                if (!in_array($key, $columns)) {
                    Yii::error("Неверный ключ для данных: $key в строке: " . Json::encode($row));
                    throw new BadRequestHttpException("Неверный ключ для данных: $key");
                }
            }

            try {
                // Логируем запрос
                $query = $db->createCommand()->insert($tableName, $row)->getSql();
                Yii::info("SQL-запрос для вставки данных: $query");

                // Вставляем данные
                $db->createCommand()->insert($tableName, $row)->execute();

                Yii::info("Данные успешно вставлены в таблицу: $tableName");
            } catch (\Exception $e) {
                Yii::error("Ошибка при вставке в таблицу $tableName: " . $e->getMessage());
                throw new BadRequestHttpException("Ошибка при вставке в таблицу $tableName");
            }
        }
    }
}
}

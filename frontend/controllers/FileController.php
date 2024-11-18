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
    public $enableCsrfValidation = false; // Для загрузки файлов через POST

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
    libxml_use_internal_errors(true); // Для обработки ошибок при парсинге

    $xml = simplexml_load_file($filePath);
    if (!$xml) {
        $errors = libxml_get_errors();
        foreach ($errors as $error) {
            Yii::error("Ошибка XML: " . $error->message);  // Логируем все ошибки XML
        }
        throw new BadRequestHttpException('Ошибка при загрузке XML файла.');
    }
    

    $json = json_encode($xml);
    $data = json_decode($json, true); // Преобразуем XML в массив

    return $data;
}


private function saveMultipleTables($data)
{
    $db = Yii::$app->db;

    foreach ($data as $tableName => $rows) {
        Yii::info("Начинаем вставку в таблицу: $tableName");

        foreach ($rows as $row) {
            try {
                // Логируем запрос, который будет выполняться
                $query = $db->createCommand()->insert($tableName, $row)->getSql();
                Yii::info("SQL-запрос для вставки данных: $query");

                // Вставка данных
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

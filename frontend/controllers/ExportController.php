<?php   
namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use yii\web\Response;
use Symfony\Component\Yaml\Yaml;

class ExportController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGetData()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;

        try {
            // Извлекаем данные без id
            $categories = $this->removeIds(Yii::$app->db->createCommand('SELECT * FROM categories')->queryAll());
            $manufacturers = $this->removeIds(Yii::$app->db->createCommand('SELECT * FROM manufacturers')->queryAll());
            $characteristics = $this->removeIds(Yii::$app->db->createCommand('SELECT * FROM characteristics')->queryAll());
            $products = $this->removeIds(Yii::$app->db->createCommand('SELECT * FROM products')->queryAll());
            $productCharacteristics = $this->removeIds(Yii::$app->db->createCommand('SELECT * FROM product_characteristics')->queryAll());
            $productImages = $this->removeIds(Yii::$app->db->createCommand('SELECT * FROM product_images')->queryAll());
            $reviews = $this->removeIds(Yii::$app->db->createCommand('SELECT * FROM reviews')->queryAll());

            return [
                'status' => 'success',
                'data' => [
                    'categories' => $categories,
                    'manufacturers' => $manufacturers,
                    'characteristics' => $characteristics,
                    'products' => $products,
                    'product_characteristics' => $productCharacteristics,
                    'product_images' => $productImages,
                    'reviews' => $reviews,
                ],
            ];
        } catch (\Exception $e) {
            Yii::error('Error fetching data: ' . $e->getMessage());
            return [
                'status' => 'error',
                'message' => 'Could not fetch data from database.',
            ];
        }
    }

    private function removeIds(array $data)
    {
        return array_map(function ($row) {
            unset($row['id']); // Убираем id из строки
            return $row;
        }, $data);
    }

    public function actionExport($type)
    {
        Yii::$app->response->format = Response::FORMAT_RAW;

        try {
            $getDataResponse = $this->actionGetData();
            if ($getDataResponse['status'] !== 'success') {
                throw new \Exception($getDataResponse['message']);
            }

            $data = $getDataResponse['data'];

            switch (strtolower($type)) {
                case 'csv':
                    return $this->exportCsv($data);
                case 'xml':
                    return $this->exportXml($data);
                case 'yaml':
                    return $this->exportYaml($data);
                case 'txt':
                    return $this->exportTxt($data);
                default:
                    return $this->asJson([
                        'status' => 'error',
                        'message' => 'Invalid export format.'
                    ]);
            }
        } catch (\Exception $e) {
            Yii::error('Error exporting data: ' . $e->getMessage());
            return $this->asJson([
                'status' => 'error',
                'message' => 'Error exporting data: ' . $e->getMessage()
            ]);
        }
    }

    private function exportCsv($data)
{
    $filename = Yii::getAlias('@runtime') . '/export.csv';

    $output = '';
    $isFirstTable = true;

    foreach ($data as $tableName => $rows) {
        // Добавляем пустую строку между таблицами, но не перед первой таблицей
        if (!$isFirstTable) {
            $output .= "\n\n"; // Пустая строка между таблицами
        }
        $isFirstTable = false;

        // Заголовок таблицы
        $output .= $tableName . "\n";

        if (!empty($rows)) {
            // Заголовки колонок
            $output .= implode(',', array_map(fn($header) => "\"$header\"", array_keys($rows[0]))) . "\n";

            // Данные
            foreach ($rows as $row) {
                $output .= implode(',', array_map(fn($value) => "\"$value\"", $row)) . "\n";
            }

            // Убираем последний символ новой строки у последней строки данных
            $output = rtrim($output, "\n");
        }
    }

    file_put_contents($filename, $output);
    return Yii::$app->response->sendFile($filename, 'export.csv');
}



    private function exportXml($data)
    {
        $filename = Yii::getAlias('@runtime') . '/export.xml';

        $xml = new \SimpleXMLElement('<root/>');
        foreach ($data as $tableName => $rows) {
            $table = $xml->addChild($tableName);
            foreach ($rows as $row) {
                $rowNode = $table->addChild('row');
                foreach ($row as $key => $value) {
                    $rowNode->addChild($key, htmlspecialchars($value));
                }
            }
        }

        $xml->asXML($filename);
        return Yii::$app->response->sendFile($filename, 'export.xml');
    }

    private function exportYaml($data)
    {
        $filename = Yii::getAlias('@runtime') . '/export.yaml';
        file_put_contents($filename, Yaml::dump($data, 2, 4, Yaml::DUMP_MULTI_LINE_LITERAL_BLOCK));

        return Yii::$app->response->sendFile($filename, 'export.yaml');
    }

    private function exportTxt($data)
    {
        $filename = Yii::getAlias('@runtime') . '/export.txt';
    
        $output = '';
        $isFirstTable = true;
    
        foreach ($data as $tableName => $rows) {
            // Добавляем пустую строку между таблицами, но не перед первой таблицей
            if (!$isFirstTable) {
                $output .= "\n";
            }
            $isFirstTable = false;
    
            // Заголовок таблицы
            $output .= $tableName . "\n";
    
            if (!empty($rows)) {
                // Заголовки колонок
                $output .= implode(',', array_keys($rows[0])) . "\n";
    
                // Данные
                foreach ($rows as $row) {
                    $output .= implode(',', array_map(function ($value) {
                        return str_replace(',', '_', $value); // Заменяем запятые в данных
                    }, $row)) . "\n";
                }
            }
        }
    
        file_put_contents($filename, $output);
        return Yii::$app->response->sendFile($filename, 'export.txt');
    }
    
    
}
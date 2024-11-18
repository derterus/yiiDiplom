<?php

namespace frontend\controllers;

use frontend\models\ResendVerificationEmailForm;
use frontend\models\VerifyEmailForm;
use Yii;
use yii\base\InvalidArgumentException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use yii\rest\IndexAction;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Symfony\Component\Yaml\Yaml;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use yii\helpers\FileHelper;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => \yii\web\ErrorAction::class,
            ],
            'captcha' => [
                'class' => \yii\captcha\CaptchaAction::class,
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->password = '';

        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending your message.');
            }

            return $this->refresh();
        }

        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Signs user up.
     *
     * @return mixed
     */
    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post()) && $model->signup()) {
            Yii::$app->session->setFlash('success', 'Thank you for registration. Please check your inbox for verification email.');
            return $this->goHome();
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    /**
     * Requests password reset.
     *
     * @return mixed
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            }

            Yii::$app->session->setFlash('error', 'Sorry, we are unable to reset password for the provided email address.');
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Resets password.
     *
     * @param string $token
     * @return mixed
     * @throws BadRequestHttpException
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidArgumentException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }

    /**
     * Verify email address
     *
     * @param string $token
     * @throws BadRequestHttpException
     * @return yii\web\Response
     */
    public function actionVerifyEmail($token)
    {
        try {
            $model = new VerifyEmailForm($token);
        } catch (InvalidArgumentException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }
        if (($user = $model->verifyEmail()) && Yii::$app->user->login($user)) {
            Yii::$app->session->setFlash('success', 'Your email has been confirmed!');
            return $this->goHome();
        }

        Yii::$app->session->setFlash('error', 'Sorry, we are unable to verify your account with provided token.');
        return $this->goHome();
    }

    /**
     * Resend verification email
     *
     * @return mixed
     */
    public function actionResendVerificationEmail()
    {
        $model = new ResendVerificationEmailForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');
                return $this->goHome();
            }
            Yii::$app->session->setFlash('error', 'Sorry, we are unable to resend verification email for the provided email address.');
        }

        return $this->render('resendVerificationEmail', [
            'model' => $model
        ]);
    }

    public function actionFiles()
{
    // Путь к файлу Excel
    $excelFilePath = Yii::getAlias('@root') . '/generateFiles/smart_watch_shop_data_20_entries.xlsx';
    $outputDir = Yii::getAlias('@app') . '/web/files';

    // Проверяем существование файла
    if (!file_exists($excelFilePath)) {
        throw new \yii\web\NotFoundHttpException("Файл не найден: $excelFilePath");
    }

    // Проверяем или создаём директорию для файлов
    if (!file_exists($outputDir)) {
        mkdir($outputDir, 0777, true);
    }

    // Загружаем файл Excel
    try {
        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($excelFilePath);
    } catch (\PhpOffice\PhpSpreadsheet\Reader\Exception $e) {
        Yii::error("Ошибка при загрузке Excel файла: " . $e->getMessage());
        throw new \yii\web\ServerErrorHttpException("Не удалось загрузить файл Excel.");
    }

    $allData = [];
    
    // Проходим по всем листам и собираем данные
    foreach ($spreadsheet->getAllSheets() as $sheet) {
        $sheetData = $sheet->toArray(null, true, true, true); // Включаем заголовки
        $sheetName = $sheet->getTitle();

        // Извлекаем заголовки из первой строки
        $headers = array_shift($sheetData); // Убираем первую строку как заголовки
        $formattedSheetData = [];

        // Проходим по оставшимся строкам и формируем ассоциативный массив с заголовками
        foreach ($sheetData as $row) {
            $formattedSheetData[] = array_combine($headers, $row); // Соединяем заголовки с данными
        }

        $allData[$sheetName] = $formattedSheetData; // Сохраняем данные с именем листа
    }

    // Создаём файлы для каждого формата
    $this->createCombinedCsv($allData, "$outputDir/combined_output.csv");
    $this->createCombinedTxt($allData, "$outputDir/combined_output.txt");
    $this->createCombinedXml($allData, "$outputDir/combined_output.xml");
    $this->createCombinedYaml($allData, "$outputDir/combined_output.yaml");

    // Сообщение об успешном создании файлов
    return $this->render('files', [
        'message' => 'Все данные сохранены в один файл для каждого формата!',
        'csvFile' => '/files/combined_output.csv',
        'txtFile' => '/files/combined_output.txt',
        'xmlFile' => '/files/combined_output.xml',
        'yamlFile' => '/files/combined_output.yaml'
    ]);
}

    
    // Функция для создания общего CSV файла
private function createCombinedCsv($allData, $filename)
{
    $file = fopen($filename, 'w');
    foreach ($allData as $sheetName => $data) {
        fputcsv($file, [$sheetName]); // Разделитель с именем листа
        if (!empty($data)) {
            // Записываем заголовки
            fputcsv($file, array_keys($data[0])); // Первые ключи как заголовки
            foreach ($data as $row) {
                fputcsv($file, $row); // Записываем строки данных
            }
        }
        fputcsv($file, []); // Пустая строка между листами
    }
    fclose($file);
}

    
   // Функция для создания общего TXT файла
private function createCombinedTxt($allData, $filename)
{
    $file = fopen($filename, 'w');
    foreach ($allData as $sheetName => $data) {
        fwrite($file, "$sheetName" . PHP_EOL); // Разделитель с именем листа
        if (!empty($data)) {
            // Записываем заголовки
            fwrite($file, implode(',', array_keys($data[0])) . PHP_EOL); // Заголовки
            foreach ($data as $row) {
                fwrite($file, implode(',', $row) . PHP_EOL); // Записываем строки данных
            }
        }
        fwrite($file, PHP_EOL); // Пустая строка между листами
    }
    fclose($file);
}

    
private function createCombinedXml($allData, $filename)
{
    // Создаем новый объект SimpleXMLElement
    $xml = new \SimpleXMLElement('<root/>');

    // Перебираем данные для каждой таблицы
    foreach ($allData as $sheetName => $data) {
        $sheet = $xml->addChild($sheetName);  // Добавляем таблицу

        // Перебираем строки данных
        foreach ($data as $row) {
            $item = $sheet->addChild('row');  // Добавляем строку

            // Перебираем все столбцы в строке
            foreach ($row as $key => $value) {
                // Убедимся, что добавляем значение напрямую без htmlspecialchars
                $item->addChild($key, htmlspecialchars_decode($value)); // Используем htmlspecialchars_decode
            }
        }
    }

    // Создаем объект DOMDocument для красивого форматирования
    $dom = new \DOMDocument('1.0', 'UTF-8');
    $dom->preserveWhiteSpace = false;  // Убираем лишние пробелы
    $dom->formatOutput = true;         // Включаем форматирование с отступами

    // Импортируем наш SimpleXMLElement в DOMDocument
    $dom->loadXML($xml->asXML());

    // Убедимся, что сохраняем файл в кодировке UTF-8
    $dom->encoding = 'UTF-8';

    // Сохраняем XML в файл с отступами
    $dom->save($filename);
}



    
    
   // Функция для создания общего YAML файла
private function createCombinedYaml($allData, $filename)
{
    $formattedData = [];
    foreach ($allData as $sheetName => $data) {
        $formattedSheet = [];
        foreach ($data as $row) {
            $formattedSheet[] = array_combine(array_keys($row), $row);
        }
        $formattedData[$sheetName] = $formattedSheet;
    }
    file_put_contents($filename, Yaml::dump($formattedData, 2, 4));
}



}

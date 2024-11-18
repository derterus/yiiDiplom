<?php

namespace common\models;

use yii\base\Model;
use yii\web\UploadedFile;

class UploadForm extends Model
{
    /**
     * @var UploadedFile
     */
    public $file;

    /**
     * Правила валидации
     */
    public function rules()
    {
        return [
            [['file'], 'file', 'skipOnEmpty' => false, 'extensions' => 'csv,xml,yaml,yml,txt', 'checkExtensionByMimeType' => false],
        ];
    }

    /**
     * Названия атрибутов (для отображения в форме)
     */
    public function attributeLabels()
    {
        return [
            'file' => 'Файл',
        ];
    }
}

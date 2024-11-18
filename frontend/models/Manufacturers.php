<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "manufacturers".
 *
 * @property int $id
 * @property string $Название
 * @property string|null $Страна
 *
 * @property Products[] $products
 */
class Manufacturers extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'manufacturers';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Название'], 'required'],
            [['Название'], 'string', 'max' => 255],
            [['Страна'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'Название' => 'Название',
            'Страна' => 'Страна',
        ];
    }

    /**
     * Gets query for [[Products]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Products::class, ['manufacturer_id' => 'id']);
    }
}

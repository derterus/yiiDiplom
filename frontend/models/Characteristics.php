<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "characteristics".
 *
 * @property int $id
 * @property string $Название
 * @property string|null $Описание
 *
 * @property ProductCharacteristics[] $productCharacteristics
 */
class Characteristics extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'characteristics';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Название'], 'required'],
            [['Описание'], 'string'],
            [['Название'], 'string', 'max' => 255],
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
            'Описание' => 'Описание',
        ];
    }

    /**
     * Gets query for [[ProductCharacteristics]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProductCharacteristics()
    {
        return $this->hasMany(ProductCharacteristics::class, ['characteristic_id' => 'id']);
    }
}

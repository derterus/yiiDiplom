<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "products".
 *
 * @property int $id
 * @property string $Название
 * @property float $Цена
 * @property string|null $Описание
 * @property int|null $category_id
 * @property int|null $manufacturer_id
 * @property float|null $Вес
 * @property string|null $SKU
 * @property int $Количество_на_складе
 * @property string|null $Дата_создания
 * @property string|null $Дата_обновления
 *
 * @property Categories $category
 * @property Manufacturers $manufacturer
 * @property ProductCharacteristics[] $productCharacteristics
 * @property ProductImages[] $productImages
 * @property Reviews[] $reviews
 */
class Products extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'products';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Название', 'Цена'], 'required'],
            [['Цена', 'Вес'], 'number'],
            [['Описание'], 'string'],
            [['category_id', 'manufacturer_id', 'Количество_на_складе'], 'integer'],
            [['Дата_создания', 'Дата_обновления'], 'safe'],
            [['Название'], 'string', 'max' => 255],
            [['SKU'], 'string', 'max' => 100],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Categories::class, 'targetAttribute' => ['category_id' => 'id']],
            [['manufacturer_id'], 'exist', 'skipOnError' => true, 'targetClass' => Manufacturers::class, 'targetAttribute' => ['manufacturer_id' => 'id']],
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
            'Цена' => 'Цена',
            'Описание' => 'Описание',
            'category_id' => 'Category ID',
            'manufacturer_id' => 'Manufacturer ID',
            'Вес' => 'Вес',
            'SKU' => 'Sku',
            'Количество_на_складе' => 'Количество На Складе',
            'Дата_создания' => 'Дата Создания',
            'Дата_обновления' => 'Дата Обновления',
        ];
    }

    /**
     * Gets query for [[Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Categories::class, ['id' => 'category_id']);
    }

    /**
     * Gets query for [[Manufacturer]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getManufacturer()
    {
        return $this->hasOne(Manufacturers::class, ['id' => 'manufacturer_id']);
    }

    /**
     * Gets query for [[ProductCharacteristics]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProductCharacteristics()
    {
        return $this->hasMany(ProductCharacteristics::class, ['product_id' => 'id']);
    }

    /**
     * Gets query for [[ProductImages]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProductImages()
    {
        return $this->hasMany(ProductImages::class, ['product_id' => 'id']);
    }

    /**
     * Gets query for [[Reviews]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getReviews()
    {
        return $this->hasMany(Reviews::class, ['product_id' => 'id']);
    }
}

<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "deal_items".
 *
 * @property int $id
 * @property int|null $deal_id
 * @property int|null $model_id
 * @property int $Количество
 * @property float $Цена
 *
 * @property Deals $deal
 * @property Models $model
 */
class DealItems extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'deal_items';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['deal_id', 'model_id', 'Количество'], 'integer'],
            [['Количество', 'Цена'], 'required'],
            [['Цена'], 'number'],
            [['deal_id'], 'exist', 'skipOnError' => true, 'targetClass' => Deals::class, 'targetAttribute' => ['deal_id' => 'id']],
            [['model_id'], 'exist', 'skipOnError' => true, 'targetClass' => Models::class, 'targetAttribute' => ['model_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'deal_id' => 'Deal ID',
            'model_id' => 'Model ID',
            'Количество' => 'Количество',
            'Цена' => 'Цена',
        ];
    }

    /**
     * Gets query for [[Deal]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDeal()
    {
        return $this->hasOne(Deals::class, ['id' => 'deal_id']);
    }

    /**
     * Gets query for [[Model]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModel()
    {
        return $this->hasOne(Models::class, ['id' => 'model_id']);
    }
}

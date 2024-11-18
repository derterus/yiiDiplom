<?php

namespace app\models;

use Yii;
use common\models\User;

/**
 * This is the model class for table "deals".
 *
 * @property int $id
 * @property int|null $user_id
 * @property string|null $Дата сделки
 * @property string|null $Статус
 *
 * @property DealItems[] $dealItems
 * @property User $user
 */
class Deals extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'deals';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['Дата сделки'], 'safe'],
            [['Статус'], 'string'],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::class, 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'Дата сделки' => 'Дата Сделки',
            'Статус' => 'Статус',
        ];
    }

    /**
     * Gets query for [[DealItems]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDealItems()
    {
        return $this->hasMany(DealItems::class, ['deal_id' => 'id']);
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::class, ['id' => 'user_id']);
    }
}

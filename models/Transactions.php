<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "transactions".
 *
 * @property integer $id
 * @property integer $value
 * @property string $date_booked
 * @property string $date_valuta
 * @property string $source
 * @property string $purpose
 * @property string $type
 * @property integer $category
 * @property integer $recur_period
 * @property integer $credit_id
 *
 * @property TransCategory $category0
 * @property Credit $credit
 * @property Vat[] $vats
 */
class Transactions extends \yii\db\ActiveRecord
{
    protected $_dataProvider;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'transactions';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['value', 'date_booked', 'date_valuta', 'source', 'purpose', 'type', 'category'], 'required'],
            [['value', 'category', 'recur_period', 'credit_id'], 'integer'],
            [['date_booked', 'date_valuta'], 'safe'],
            [['purpose', 'type'], 'string'],
            [['source'], 'string', 'max' => 80]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'value' => Yii::t('app', 'Value'),
            'date_booked' => Yii::t('app', 'Date Booked'),
            'date_valuta' => Yii::t('app', 'Date Valuta'),
            'source' => Yii::t('app', 'Source'),
            'purpose' => Yii::t('app', 'Purpose'),
            'type' => Yii::t('app', 'Type'),
            'category' => Yii::t('app', 'Category'),
            'recur_period' => Yii::t('app', 'Recur Period'),
            'credit_id' => Yii::t('app', 'Credit ID'),
        ];
    }

    public function search()
    {
        $query = Transactions::find()
            ->with('categories');

        $this->_dataProvider = new \yii\data\ActiveDataProvider([
            'query' => $query,
            'pagination' => new \yii\data\Pagination([
                'pageSize' => 10//$this->page_size
            ])
        ]);

        return $this->_dataProvider;
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory0()
    {
        return $this->hasOne(TransCategory::className(), ['id' => 'category']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCredit()
    {
        return $this->hasOne(Credit::className(), ['id' => 'credit_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVats()
    {
        return $this->hasMany(Vat::className(), ['transaction_id' => 'id']);
    }
}

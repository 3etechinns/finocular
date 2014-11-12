<?php

namespace app\controllers;

use app\models\Transactions;

class TransactionsController extends \yii\web\Controller
{
    public function actionIndex()
    {
        $transactions = new Transactions();

        return $this->render('index',['model'=>$transactions]);
    }

}

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

    public function actionUpload()
    {
        $fileName = 'file';
        $uploadPath = './files';

        if (!empty($_FILES)) {
            foreach($_FILES as $file) {
                //$file = \yii\web\UploadedFile::getInstanceByName($fileName);

                //Print file data
                print_r($file);

                /*if ($file->saveAs($uploadPath . '/' . $file->name)) {
                    //Now save file data to database

                    echo \yii\helpers\Json::encode($file);
                }*/
            }
        }

        return false;
    }
}

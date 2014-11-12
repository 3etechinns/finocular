<?php
/* @var $this yii\web\View */

use yii\helpers\Html;
use kartik\grid\GridView;

$this->title = 'Transactions';
$this->params['breadcrumbs'][] = $this->title;

?>

<div class="box">
    <div class="box-body no-padding">
        <?=
        GridView::widget([
            'dataProvider' => $model->search(),
            //'filterModel' => $searchModel,
            'columns' => [
                'type',
                'category',
                'value:int',
                'date_booked:datetime',
                'date_valuta:datetime',
                'source',
                'credit_id',
                ['class' => 'yii\grid\ActionColumn', 'controller' => 'users', 'template' => '{update} {delete}'],
            ],
            'responsive'=>true,
            'hover'=>true,
            'floatHeader'=>true,
            'floatHeaderOptions'=>['scrollingTop'=>''],
            'panel' => [
                'heading'=>'<h3 class="panel-title"><i class="glyphicon glyphicon-globe"></i> All transactions</h3>',
                'type'=>'success',
                'before'=>Html::a('<i class="glyphicon glyphicon-plus"></i> Add transaction', ['transactions/create'], ['class' => 'btn btn-success']),
                'after'=>Html::a('<i class="glyphicon glyphicon-repeat"></i> Reset Grid', ['index'], ['class' => 'btn btn-info']),
                'showFooter'=>false
            ],
        ]); ?>
    </div>
</div>
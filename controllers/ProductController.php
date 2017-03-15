<?php
/**
 * Created by PhpStorm.
 * User: Andrey
 * Date: 09.05.2016
 * Time: 10:50
 */

namespace app\controllers;
use app\models\Category;
use app\models\Product;
use Yii;
use app\models\CommentForm;

class ProductController extends AppController{

    public function actionView($id){

        $product = Product::findOne($id);
        if(empty($product))
            throw new \yii\web\HttpException(404, 'Такого товара немає');
        $hits = Product::find()->where(['hit' => '1'])->limit(6)->all();
        $this->setMeta('Магаз | ' . $product->name, $product->keywords, $product->description);
        $commentForm = new CommentForm();
        return $this->render('view', compact('product', 'hits', 'commentForm'));
    }


    public function actionComment($id)
    {
        $model = new CommentForm();

        if(Yii::$app->request->isPost)
        {
            $model->load(Yii::$app->request->post());
            if($model->saveComment($id))
            {
                Yii::$app->getSession()->setFlash('comment', 'Ваш коментар буде додано найближчим часом!');
                return $this->redirect(['product/view','id'=>$id]);
            }
        }
    }

} 
<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\FileModel;
use app\models\PinForm;
use webvimark\modules\UserManagement\models\User;
use yii\base\Request as BaseRequest;
use yii\helpers\FileHelper;
use yii\helpers\Json;
use yii\web\Request;
use yii\web\UploadedFile;

class SiteController extends Controller
{
    public $freeAccess = false;
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        // return [
        //     'access' => [
        //         'class' => AccessControl::className(),
        //         'only' => ['logout'],
        //         'rules' => [
        //             [
        //                 'actions' => ['logout'],
        //                 'allow' => true,
        //                 'roles' => ['@'],
        //             ],
        //         ],
        //     ],
        //     'verbs' => [
        //         'class' => VerbFilter::className(),
        //         'actions' => [
        //             'logout' => ['post'],
        //         ],
        //     ],
        // ];
        return [
            'ghost-access'=> [
                'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        $model = new PinForm();
        // $user = User::getCurrentUser();

        if ($model->load(Yii::$app->request->post()) && ($pinHash = $model->checkPin())) {
           return  $this->redirect('site/pin?id='.urlencode($pinHash));
        }
        return $this->render('index', compact('model'));
    }


    public function actionPin(){
        $id = Yii::$app->request->get('id');
        $filesModel = FileModel::find()->where(['pin_hash'=>$id])->andWhere(['userid'=>User::getCurrentUser()->getId()])->andWhere(['active'=>1])->andWhere(['deleted'=>0])->all();
        // var_dump($fileModel);
        return $this->render('pin', compact('filesModel','id'));
    }


    public function actionUpload(){
        $id = Yii::$app->request->get('id');
        $model = new FileModel();
        $model->pin_hash = $id;

        return $this->render('upload',compact('model'));
        // var_dump($id);die;
    }

    public function actionUploadFile(){
        $model = new FileModel();
        $imageFile = UploadedFile::getInstance($model, 'file_name');
    
        $directory = __DIR__.'/../web/img/temp' . DIRECTORY_SEPARATOR;
        // return $directory;
        // return Json::encode([$directory]);
        // echo $directory;die;
        if (!is_dir($directory)) {
            FileHelper::createDirectory($directory);
        }
        // return Json::encode([$directory]);

        if ($imageFile) {
            $uid = uniqid(time(), true);
            $fileName = $uid . '.' . $imageFile->extension;
            $filePath = $directory . $fileName;
            if ($imageFile->saveAs($filePath)) {
                $path = Yii::getAlias('@web/img/temp/') . $fileName;
                $model->pin_hash = Yii::$app->request->get('id');
                $model->userid = User::getCurrentUser()->getId();
                $model->active = 1;
                $model->deleted = 0;
                $model->file_real_name = $fileName;
                $model->file_name = $imageFile->name;
                $model->file_type = $imageFile->type;
                $model->file_size = $imageFile->size;
                $model->save();
                $typeOfFile = explode('/',$imageFile->type)[0];
                if($typeOfFile != 'image')
                    $thumb = '/img/doc.png';
                else 
                    $thumb = $path;
                // var_dump($model);die;
                return Json::encode([
                    'files' => [
                        [
                            'name' => $imageFile->name,
                            'size' => $imageFile->size,
                            'url' => $path,
                            'thumbnailUrl' => $thumb,
                            'deleteUrl' => 'image-delete?name=' . $fileName,
                            'deleteType' => 'POST',
                        ],
                    ],
                ]);
            }
        }
    
        return '';
        // var_dump(Yii::$app->request->post());die;
    }


public function actionImageDelete($name)
{
    $directory = __DIR__.'/../web/img/temp';
    $deleted_dir =  __DIR__.'/../web/img/del';
    if (is_file($directory . DIRECTORY_SEPARATOR . $name)) {
        shell_exec(' mv '.$directory . DIRECTORY_SEPARATOR . $name .' '. $deleted_dir . DIRECTORY_SEPARATOR . $name);
        // unlink($directory . DIRECTORY_SEPARATOR . $name);
    }
    $models = FileModel::find()->where(['file_real_name'=>$name])->andWhere(['userid'=>User::getCurrentUser()->getId()])->one();
    if($models){
        $models->deleted = 1;
        $models->active = 0;
        $models->update();
    }
    if(!Yii::$app->request->isAjax)
        $this->redirect('/site/pin?id='.$models->pin_hash);

    $files = FileHelper::findFiles($directory);
    $output = [];
    foreach ($files as $file) {
        $fileName = basename($file);
        $path = '/img/temp/' . $fileName;
        $output['files'][] = [
            'name' => $fileName,
            'size' => filesize($file),
            'url' => $path,
            'thumbnailUrl' => $path,
            'deleteUrl' => 'image-delete?name=' . $fileName,
            'deleteType' => 'POST',
        ];
    }
    return Json::encode($output);
}
    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }
}

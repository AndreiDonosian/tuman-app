<?php

namespace app\models;

use webvimark\modules\UserManagement\models\User;
use Yii;
use yii\base\Model;

/**
 * PinForm is the model behind the pin form.
 *
 * @property User|null $user This property is read-only.
 *
 */
class PinForm extends Model
{
    public $pin;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            ['pin', 'required'],
            ['pin', 'integer'],
        ];
    }

    public function checkPin(){
        if(!$user = User::getCurrentUser())
            return false;

        $pinModel = new PinModel();

        $pinModelS = PinModel::find()->where(['userid'=>$user->getId()])->andWhere(['pin'=>$this->pin])->one();
        if(!$pinModelS){
            $pinModel->pin = (int) $this->pin;
            $pinModel->userid = (int) $user->getId();
            
            $pinModel->save(false);
        return $pinModel->getPinData();

        } else {
            return $pinModelS->getPinData();
        }
        // $user->ge

        // var_dump($user->getId());
        // die;
    }
}

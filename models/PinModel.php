<?php

namespace app\models;

use webvimark\modules\UserManagement\models\User;
use yii\db\ActiveRecord;

// use webvimark\modules\UserManagement\models\User;

class PinModel extends ActiveRecord
{

    // public $pin;
    // public $userid;
    private $_salt = 'haval256,5';

   public static function tableName()
	{
		return 'pin';
	}

   public function getPinData(){

    // $username = ;
       return hash($this->_salt,'s8Pf'.User::getCurrentUser()->username.$this->getAttribute('pin').$this->getAttribute('id'));
   }
   
}

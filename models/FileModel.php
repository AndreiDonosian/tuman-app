<?php

namespace app\models;

use webvimark\modules\UserManagement\models\User;
use Yii;
use yii\db\ActiveRecord;

// use webvimark\modules\UserManagement\models\User;

class FileModel extends ActiveRecord
{

    // public $pin;
    // public $userid;
    public $thumb;

   public static function tableName()
	{
		return 'files';
    }
    
    public function afterFind()
    {
        parent::afterFind();
        $this->thumb = $this->getThumb();
        
    }

    protected function getThumb(){
        $type = explode('/',$this->getAttribute('file_type'))[0];
        $prefix = '';
        switch($type){
            case 'text':
                $prefix= Yii::getAlias('@web/img/') . 'doc.png';
                break;
            case 'application':
                $prefix= Yii::getAlias('@web/img/') . 'folder.png';
                break;
            default: 
                $prefix = Yii::getAlias('@web/img/temp/') . $this->getAttribute('file_real_name');
        }
        return $prefix;
    }


}

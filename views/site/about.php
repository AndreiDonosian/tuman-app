<?php

/* @var $this yii\web\View */

use yii\helpers\Html;

$this->title = 'Pin detailed';
// $this->params['breadcrumbs'][] = $this->title;
?>
<div>
    <input type="hidden" value="<?= $_GET['id'] ?>" name="pin" id="pin" />
    <h1><?= Html::encode($this->title) ?></h1>

    <div class="wrap">
        <?php if(empty($filesModel)){
            ?>
            <h3>No files found</h3>
            <div class="upload-ask text-center">
                <a class="btn btn-green" href="/site/upload?id=<?= $_GET['id'] ?>">Upload a new one?</a>
            </div>
            <?php
        } else {
        ?>

        <?php } ?>
    </div>

</div>

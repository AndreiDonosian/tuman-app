<?php

/* @var $this yii\web\View */

use yii\helpers\Html;

$this->title = 'Pin detailed';
// $this->params['breadcrumbs'][] = $this->title;
?>
<div>
    <input type="hidden" value="<?= $id ?>" name="pin" id="pin" />
    <h1><?= Html::encode($this->title) ?></h1>
    <div class="upload-ask text-center">
            <a class="btn btn-success" href="/site/upload?id=<?= $id ?>">Upload</a>
        </div>
        <br/>
    <div class="wrap">
        <div class="row">
            <?php if (empty($filesModel)) {
            ?>
                <h3>No files found</h3>
                <?php
            } else {
                foreach ($filesModel as $file) {
                ?>

                    <div class="col-md-2 pb-1">
                        <div class="card mb-4 box-shadow">
                            <img class="card-img-top" alt="Thumbnail" src="<?php echo $file->thumb ?>" data-holder-rendered="true" style="height: 130px; width: 100%; display: block;">
                            <div class="card-body">
                                <p class="card-text"><?php echo $file->file_name ?></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a href="/site/image-delete?name=<?php echo $file->file_real_name?>" class="btn btn-danger">Delete</a>
                                        <a href="/img/temp/<?php echo $file->file_real_name?>" class="btn btn-primary">Download</a>
                                        <!-- <button type="button" class="btn btn-sm btn-outline-secondary">View</button> -->
                                        <!-- <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button> -->
                                    </div>
                                    <!-- <small class="text-muted"><?php echo $file->file_type ?></small> -->
                                </div>
                            </div>
                        </div>
                    </div>

            <?php }
            } ?>
        </div>
        <br/>
        
    </div>

</div>
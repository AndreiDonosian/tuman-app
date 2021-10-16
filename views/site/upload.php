
<?php
use dosamigos\fileupload\FileUploadUI;

// with UI
?>
<div class="wrap">
<div class="row text-center">
    <div class="top15">
<?= FileUploadUI::widget([
    'model' => $model,
    'attribute' => 'file_name',
    'url' => ['site/upload-file', 'id' => $model->pin_hash],
    'gallery' => false,
    'fieldOptions' => [
        'accept' => '*/*'
    ],
    'clientOptions' => [
        'maxFileSize' => 20000000000
    ],
    // ...
    'clientEvents' => [
        'fileuploaddone' => 'function(e, data) {
                                console.log(e);
                                console.log(data);
                            }',
        'fileuploadfail' => 'function(e, data) {
                                console.log(e);
                                console.log(data);
                            }',
    ],
]); ?>
</div>
</div>
</div>
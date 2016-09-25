<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-sims',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'sims\controllers',
    'bootstrap' => ['log'],
    'defaultRoute' =>'default',
    'components' => [
        'user' => [
            'identityClass' => 'sims\models\Admin',
            'enableAutoLogin' => true,
            'loginUrl' => ['default/login'],
        ],

        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'default/error',
        ],
    ],
    'params' => $params,
];

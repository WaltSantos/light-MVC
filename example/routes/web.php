<?php

use Controllers\HomeController;
use Controllers\AuthController;
use Controllers\Api\Internal\StatusController;
use Controllers\Api\Internal\UserDataController;

return [
    '/' => [
        'GET' => [HomeController::class, 'index'],
    ],
    '/login' => [
        'GET' => [AuthController::class, 'login'],
    ],
    '/api/internal/status' => [
        'GET' => [StatusController::class, 'check'],
    ],
    '/api/internal/user' => [
        'GET' => [UserDataController::class, 'info'],
    ],
];

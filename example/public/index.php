<?php
require __DIR__ . '/../vendor/autoload.php';

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$method = $_SERVER['REQUEST_METHOD'];

$routes = require __DIR__ . '/../routes/web.php';

if (isset($routes[$uri][$method])) {
    [$controller, $action] = $routes[$uri][$method];
    (new $controller)->$action();
} else {
    http_response_code(404);
    echo "404 - Ruta no encontrada.";
}

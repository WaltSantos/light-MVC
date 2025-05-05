#!/bin/bash

## edita el nombre del proyecto
PROYECTO="proyecto2"

echo "📁 Creando estructura del proyecto '$PROYECTO'..."

mkdir -p $PROYECTO/{app/{Controllers/{Api/{Internal,PublicAccess},Tools},Helpers,Utils,Views/{dashboard,errors}},\
config,\
public/{api,assets/{css,images,js,vendor},docs,mail_templates},\
routes,\
storage/{data/mail_template_styles,docs,logs,outfolder,templates,uploads},\
tests,\
vendor/composer}

touch $PROYECTO/.env $PROYECTO/README.md

# ------------------------------------
# 📄 public/index.php
# ------------------------------------
cat > $PROYECTO/public/index.php <<'PHP'
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
PHP

# ------------------------------------
# 📄 public/.htaccess
# ------------------------------------
cat > $PROYECTO/public/.htaccess <<'HTACCESS'
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^ index.php [QSA,L]
HTACCESS

# ------------------------------------
# 📄 app/Controllers/HomeController.php
# ------------------------------------
cat > $PROYECTO/app/Controllers/HomeController.php <<'PHP'
<?php
namespace Controllers;

class HomeController {
    public function index() {
        echo "Bienvenido a la página principal.";
    }
}
PHP

# ------------------------------------
# 📄 app/Controllers/AuthController.php
# ------------------------------------
cat > $PROYECTO/app/Controllers/AuthController.php <<'PHP'
<?php
namespace Controllers;

class AuthController {
    public function login() {
        echo "Página de login.";
    }
}
PHP

# ------------------------------------
# 📄 app/Controllers/Api/Internal/StatusController.php
# ------------------------------------
cat > $PROYECTO/app/Controllers/Api/Internal/StatusController.php <<'PHP'
<?php
namespace Controllers\Api\Internal;

class StatusController {
    public function check() {
        header('Content-Type: application/json');
        echo json_encode(['status' => 'ok']);
    }
}
PHP

# ------------------------------------
# 📄 app/Controllers/Api/Internal/UserDataController.php
# ------------------------------------
cat > $PROYECTO/app/Controllers/Api/Internal/UserDataController.php <<'PHP'
<?php
namespace Controllers\Api\Internal;

class UserDataController {
    public function info() {
        echo "Información del usuario interno.";
    }
}
PHP

# ------------------------------------
# 📄 routes/web.php
# ------------------------------------
cat > $PROYECTO/routes/web.php <<'PHP'
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
PHP

# ------------------------------------
# 📄 Configs vacíos
# ------------------------------------
touch $PROYECTO/config/app.php $PROYECTO/config/database.php

# ------------------------------------
# 🧾 Archivo de configuración httpd.conf sugerido
# ------------------------------------
cat > $PROYECTO/confs.dat <<'TXT'
# Instrucciones para configurar Apache (httpd.conf):

# 1. Asegúrate de tener habilitado mod_rewrite:
LoadModule rewrite_module modules/mod_rewrite.so

# 2. Permite el uso de .htaccess en tu VirtualHost:
<Directory "/ruta/completa/a/proyecto2/public">
    AllowOverride All
    Require all granted
</Directory>

# 3. Configura tu DocumentRoot:
<VirtualHost *:80>
    ServerName proyecto2.local
    DocumentRoot "/ruta/completa/a/proyecto2/public"
    <Directory "/ruta/completa/a/proyecto2/public">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>

# 4. No olvides reiniciar Apache después:
# sudo systemctl restart apache2
TXT

# ------------------------------------
# 🎼 Composer
# ------------------------------------
cd $PROYECTO
echo "🛠️ Inicializando Composer..."
composer init --no-interaction --name="usuario/proyecto2" --description="Proyecto PHP sin framework" --type=project

# Autoload actualizado
cat > composer.json <<'JSON'
{
  "name": "usuario/proyecto2",
  "description": "Proyecto PHP sin framework",
  "type": "project",
  "autoload": {
    "psr-4": {
      "Controllers\\": "app/Controllers/"
    }
  }
}
JSON

composer dump-autoload

echo "✅ Proyecto PHP creado exitosamente en ./$PROYECTO"

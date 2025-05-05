# light-MVC

An ultralight MVC-like PHP framework

This is a basic and ultralight PHP framework following an MVC-like structure, where routes are defined in plain PHP files. Controllers handle the logic, and views are represented as simple PHP or HTML files. Functionalities are encapsulated as controllers and implemented under an easy-to-understand routing logic defined in `index.php`.

This framework does not require heavy dependencies like Laravel or Symfony.

## Key Aspects

- Manual routing
- Routes grouped by type: `web`, `api`, and `internal_api`
- Clear separation between views and controllers
- Modular system
- Composer support for autoloading and dependencies
- Scalable: can be extended with middleware and REST APIs
- Highly customizable

## File Structure
## 

```
project-root/
├── app/
│   ├── Controllers/
│   ├── Models/
│   ├── Views/
│   │   └── errors/
│   └── Database.php
├── public/
│   ├── .htaccess
│   └── index.php
├── routes/
│   ├── api.php
│   ├── internal_api.php
│   └── web.php
├── vendor/
├── composer.json
└── README.md
```

---

## 

## Execution Flow

1. A request hits `public/index.php`
2. The URL is parsed and matched against the defined routes
3. If a match is found, the corresponding controller method is executed
4. The controller returns a view or a JSON response (if the route is for an API)
5. If the route is not found, a custom error view is rendered

## Security and Access

- `.htaccess` is used to protect sensitive files
- Authentication middleware can be implemented in `index.php` or handled via a controller
- Access levels can be managed using session-based roles or tokens

## Requirements

- PHP 8.0+
- Composer
- Apache server with `mod_rewrite` enabled

## Target Users

This framework is a minimalist alternative for building fast and maintainable PHP systems. It’s ideal for developers who want to deploy lightweight and easy-to-manage PHP applications without the overhead of full-stack frameworks.
This framework is ideal for developers who want:
	•	Full control over routing and logic
	•	Lightweight alternatives to full-stack frameworks
	•	Rapid prototyping or internal tools
	•	Systems easy to maintain and scale gradually
 

## Example Usage

### Route Definition (`routes/web.php`)

```php
use Controllers\HomeController;
use Controllers\ErrorController;

return [
    '/' => [
        'GET' => [HomeController::class, 'index'],
    ],
    '/403' => [
        'GET' => [ErrorController::class, 'forbidden'],
    ],
];
```

### Controller Example (app/Controllers/HomeController.php)

```
namespace Controllers;

class HomeController {
    public function index() {
        require __DIR__ . '/../Views/home.php';
    }
}
```

### View Example (app/Views/home.php)

```
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h1>Welcome to Light-MVC</h1>
</body>
</html>
```

### Error Controller (app/Controllers/ErrorController.php)

```
namespace Controllers;

class ErrorController {
    public function forbidden() {
        require __DIR__ . '/../Views/errors/403.php';
    }
}
```

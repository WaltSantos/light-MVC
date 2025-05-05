# light-MVC  
An ultralight, MVC-like PHP framework

This is a minimalist and ultralight PHP framework following the MVC pattern, where routing is manually handled, logic is separated into controllers, and views are simple PHP or HTML files. The routing logic is centralized in the `index.php` file and supports clean organization by route types (`web`, `api`, and `internal_api`).

This framework has no heavy dependencies like Laravel or Symfony — it's intentionally simple, fast, and easy to understand.

---

## Installation

To set up the project:

### 1. Clone the repository

```bash
git clone https://github.com/your-user/light-mvc.git my-project
cd my-project
```

### 2. Install dependencies via Composer
```bash
composer install
```

Ensure you have Composer installed. If not, see getcomposer.org.

### 3. Set up the Apache virtual host

Make sure your Apache server is configured with a virtual host pointing to the /public directory.

Example httpd.conf:
```apache
<VirtualHost *:80>
    DocumentRoot "/path/to/light-mvc/public"
    ServerName lightmvc.local
    <Directory "/path/to/light-mvc/public">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

And add the domain to your /etc/hosts:

```apache
127.0.0.1 lightmvc.local
```

### 4. Enable mod_rewrite (if not already enabled)
```bash
sudo a2enmod rewrite
sudo systemctl restart apache2
```

## Configuration
1. Routes:
Routes are declared manually inside /routes/:
- web.php: browser-accessible routes
- api.php: REST API endpoints
- internal_api.php: internal use routes (optional)
2. Controllers:
Place your logic in /app/Controllers. Each route maps to a method in one of these classes.
3. Views:
Place visual templates (HTML or PHP) inside /app/Views.
4. Database (optional):
Use `/app/Database.php` for DB connection logic.


## License

MIT License

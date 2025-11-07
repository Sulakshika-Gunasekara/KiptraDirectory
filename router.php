<?php
// router.php - A router for the PHP built-in web server.

$publicPath = __DIR__ . '/public';
$uri = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));

// If the requested URI is a file that exists in the public directory,
// return false to let the built-in server handle it.
$requestedFile = $publicPath . $uri;
if ($uri !== '/' && file_exists($requestedFile) && is_file($requestedFile)) {
    return false;
}

// For all other requests, route them through our application's entry points.
if (strpos($uri, '/api/') === 0) {
    // API request
    $_GET['url'] = ltrim($uri, '/');
    require_once __DIR__ . '/routes/api.php';
} else {
    // Frontend page request
    require_once $publicPath . '/index.php';
}

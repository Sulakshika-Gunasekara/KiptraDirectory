<?php
// router.php
$url = $_SERVER['REQUEST_URI'];

// Serve static files as is
if (preg_match('/\.(?:png|jpg|jpeg|gif|css|js)$/', $url)) {
    return false;
}

// Basic routing
if (strpos($url, '/api/') === 0) {
    // API request
    // We need to simulate the $_GET['url'] for the api.php router
    $_GET['url'] = ltrim($url, '/');
    require_once __DIR__ . '/routes/api.php';
} else {
    // Serve the frontend
    require_once __DIR__ . '/public/index.php';
}

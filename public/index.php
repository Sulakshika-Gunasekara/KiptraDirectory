<?php
// This is the main entry point for the application.
// It will either serve the frontend or route to the API.

$url = $_GET['url'] ?? '';

// Basic routing
if (strpos($url, 'api/') === 0) {
    // API request
    require_once __DIR__ . '/../routes/api.php';
} else {
    // Serve the frontend
    // For now, we'll just include a placeholder.
    // In the next step, we'll build the actual frontend.
    require_once __DIR__ . '/../app/views/home.php';
}

<?php

header("Content-Type: application/json");

// A simple router
$request_uri = explode('?', $_SERVER['REQUEST_URI'], 2);
$path = trim($request_uri[0], '/');
$path_parts = explode('/', $path);

// NOTE: This is a very basic router and assumes a specific URL structure.
// For a real-world application, a more robust routing library would be better.

if ($path_parts[0] === 'api') {
    $resource = $path_parts[1] ?? null;
    $id = $path_parts[2] ?? null;

    switch ($resource) {
        case 'listings':
            require_once __DIR__ . '/../app/controllers/ListingController.php';
            $controller = new ListingController();
            if ($id === 'search') {
                $controller->search();
            } elseif ($id) {
                $controller->show($id);
            } else {
                $controller->index();
            }
            break;

        case 'categories':
            require_once __DIR__ . '/../app/controllers/CategoryController.php';
            $controller = new CategoryController();
            $controller->index();
            break;

        case 'reviews':
            require_once __DIR__ . '/../app/controllers/ReviewController.php';
            $controller = new ReviewController();
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $controller->create();
            } else {
                if (isset($_GET['listing_id'])) {
                    $controller->index($_GET['listing_id']);
                } else {
                    http_response_code(400);
                    echo json_encode(['error' => 'Missing listing_id parameter']);
                }
            }
            break;

        default:
            http_response_code(404);
            echo json_encode(['error' => 'Resource not found']);
            break;
    }
} else {
    // Serve the frontend
    require_once __DIR__ . '/../public/index.php';
}

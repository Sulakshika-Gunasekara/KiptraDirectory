<?php
class BaseController {
    protected $db;

    public function __construct() {
        require_once __DIR__ . '/../../config/database.php';
        try {
            if (DB_CONNECTION === 'sqlite') {
                $this->db = new PDO('sqlite:' . DB_HOST);
            } else {
                $this->db = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASS);
            }
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            error_log($e->getMessage());
            $this->sendJsonResponse(['error' => 'Database connection failed'], 500);
        }
    }

    protected function sendJsonResponse($data, $statusCode = 200) {
        header('Content-Type: application/json');
        http_response_code($statusCode);
        echo json_encode($data);
        exit;
    }
}

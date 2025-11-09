<?php
require_once 'BaseController.php';
require_once __DIR__ . '/../models/User.php';

class UserController extends BaseController {

    public function show($id) {
        try {
            $userModel = new User($this->db);
            $user = $userModel->getById($id);
            if ($user) {
                $this->sendJsonResponse($user);
            } else {
                $this->sendJsonResponse(['error' => 'User not found'], 404);
            }
        } catch (Exception $e) {
            error_log($e->getMessage());
            $this->sendJsonResponse(['error' => 'An error occurred while fetching the user'], 500);
        }
    }
}

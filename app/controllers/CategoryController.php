<?php
require_once 'BaseController.php';
require_once __DIR__ . '/../models/Category.php';

class CategoryController extends BaseController {

    public function index() {
        $categoryModel = new Category($this->db);
        $categories = $categoryModel->getAll();
        $this->sendJsonResponse($categories);
    }
}

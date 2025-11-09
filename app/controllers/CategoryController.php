<?php
require_once 'BaseController.php';
require_once __DIR__ . '/../models/Category.php';

class CategoryController extends BaseController {

    public function index() {
        $categoryModel = new Category($this->db);
        if (isset($_GET['parent_id'])) {
            $categories = $categoryModel->getByParentId($_GET['parent_id']);
        } else {
            $categories = $categoryModel->getTopLevel();
        }
        $this->sendJsonResponse($categories);
    }
}

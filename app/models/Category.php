<?php
class Category {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getTopLevel() {
        $stmt = $this->db->query("SELECT * FROM categories WHERE parent_id IS NULL");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getByParentId($parentId) {
        $stmt = $this->db->prepare("SELECT * FROM categories WHERE parent_id = :parent_id");
        $stmt->execute(['parent_id' => $parentId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}

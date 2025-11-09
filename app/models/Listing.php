<?php
class Listing {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getAll($categoryId = null) {
        $sql = "SELECT * FROM listings";
        if ($categoryId) {
            $sql .= " WHERE category_id = :category_id";
        }
        $stmt = $this->db->prepare($sql);
        if ($categoryId) {
            $stmt->execute(['category_id' => $categoryId]);
        } else {
            $stmt->execute();
        }
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getById($id) {
        $stmt = $this->db->prepare("
            SELECT l.*, v.website
            FROM listings l
            LEFT JOIN vendors v ON l.vendor_id = v.id
            WHERE l.id = :id
        ");
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function search($query) {
        $stmt = $this->db->prepare("SELECT * FROM listings WHERE title LIKE :query OR description LIKE :query");
        $stmt->execute(['query' => '%' . $query . '%']);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function updateAverageRating($listing_id) {
        $stmt = $this->db->prepare("
            UPDATE listings l
            SET l.rating_avg = (
                SELECT AVG(r.rating)
                FROM reviews r
                WHERE r.listing_id = :listing_id
            )
            WHERE l.id = :listing_id
        ");
        $stmt->execute(['listing_id' => $listing_id]);
    }
}

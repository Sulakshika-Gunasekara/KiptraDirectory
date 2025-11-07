<?php
class Listing {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getAll() {
        $stmt = $this->db->query("SELECT * FROM listings");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getById($id) {
        $stmt = $this->db->prepare("SELECT * FROM listings WHERE id = :id");
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
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

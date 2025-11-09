<?php
class Review {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getByListingId($listing_id) {
        $stmt = $this->db->prepare("
            SELECT r.*, u.name as reviewer_name
            FROM reviews r
            JOIN users u ON r.user_id = u.id
            WHERE r.listing_id = :listing_id
        ");
        $stmt->execute(['listing_id' => $listing_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function create($listing_id, $user_id, $rating, $comment) {
        $stmt = $this->db->prepare("
            INSERT INTO reviews (listing_id, user_id, rating, comment)
            VALUES (:listing_id, :user_id, :rating, :comment)
        ");
        $stmt->execute([
            'listing_id' => $listing_id,
            'user_id' => $user_id,
            'rating' => $rating,
            'comment' => $comment,
        ]);
        return $this->db->lastInsertId();
    }
}

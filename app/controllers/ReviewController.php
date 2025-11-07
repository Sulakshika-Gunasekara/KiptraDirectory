<?php
require_once 'BaseController.php';
require_once __DIR__ . '/../models/Review.php';
require_once __DIR__ . '/../models/Listing.php';

class ReviewController extends BaseController {

    public function index($listing_id) {
        $reviewModel = new Review($this->db);
        $reviews = $reviewModel->getByListingId($listing_id);
        $this->sendJsonResponse($reviews);
    }

    public function create() {
        $data = json_decode(file_get_contents('php://input'), true);

        if (!isset($data['listing_id']) || !isset($data['user_id']) || !isset($data['rating'])) {
            $this->sendJsonResponse(['error' => 'Missing required fields'], 400);
            return;
        }

        $reviewModel = new Review($this->db);
        $newReviewId = $reviewModel->create(
            $data['listing_id'],
            $data['user_id'],
            $data['rating'],
            $data['comment'] ?? ''
        );

        if ($newReviewId) {
            // Update the average rating for the listing
            $listingModel = new Listing($this->db);
            $listingModel->updateAverageRating($data['listing_id']);

            $this->sendJsonResponse(['id' => $newReviewId], 201);
        } else {
            $this->sendJsonResponse(['error' => 'Failed to create review'], 500);
        }
    }
}

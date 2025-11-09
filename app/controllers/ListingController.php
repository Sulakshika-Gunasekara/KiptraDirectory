<?php
require_once 'BaseController.php';
require_once __DIR__ . '/../models/Listing.php';

class ListingController extends BaseController {

    public function index() {
        try {
            $listingModel = new Listing($this->db);
            $categoryId = $_GET['category_id'] ?? null;
            $listings = $listingModel->getAll($categoryId);
            $this->sendJsonResponse($listings);
        } catch (Exception $e) {
            error_log($e->getMessage());
            $this->sendJsonResponse(['error' => 'An error occurred while fetching listings'], 500);
        }
    }

    public function show($id) {
        try {
            $listingModel = new Listing($this->db);
            $listing = $listingModel->getById($id);
            if ($listing) {
                $this->sendJsonResponse($listing);
            } else {
                $this->sendJsonResponse(['error' => 'Listing not found'], 404);
            }
        } catch (Exception $e) {
            error_log($e->getMessage());
            $this->sendJsonResponse(['error' => 'An error occurred while fetching the listing'], 500);
        }
    }

    public function search() {
        try {
            $listingModel = new Listing($this->db);
            $query = $_GET['q'] ?? '';
            $listings = $listingModel->search($query);
            $this->sendJsonResponse($listings);
        } catch (Exception $e) {
            error_log($e->getMessage());
            $this->sendJsonResponse(['error' => 'An error occurred during the search'], 500);
        }
    }
}

<?php
class Vendor {
    private $db;

    public $id;
    public $user_id;
    public $verified;
    public $business_name;
    public $website;

    public function __construct($db) {
        $this->db = $db;
    }
}

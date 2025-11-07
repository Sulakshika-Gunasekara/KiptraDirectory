<?php
class User {
    private $db;

    public $id;
    public $name;
    public $email;
    public $role;
    public $verified;

    public function __construct($db) {
        $this->db = $db;
    }
}

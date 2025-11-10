<?php
require_once __DIR__ . '/config/database.php';

try {
    // MySQL connection
    $dsn = "mysql:host=" . DB_HOST . ";port=" . DB_PORT . ";";
    $db = new PDO($dsn, DB_USERNAME, DB_PASSWORD);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Drop the database if it exists
    $db->exec("DROP DATABASE IF EXISTS `" . DB_DATABASE . "`");
    echo "Existing database dropped (if it existed).\n";

    // Create the database
    $db->exec("CREATE DATABASE IF NOT EXISTS `" . DB_DATABASE . "`");
    $db->exec("USE `" . DB_DATABASE . "`");
    echo "Database created successfully.\n";

    // Create the tables
    $schema = file_get_contents(__DIR__ . '/database/schema.sql');
    $db->exec($schema);
    echo "Tables created successfully.\n";

    // Insert the seed data
    $seed = file_get_contents(__DIR__ . '/database/seed.sql');
    $db->exec($seed);
    echo "Seed data inserted successfully.\n";

    echo "Database setup complete!\n";
} catch (PDOException $e) {
    echo "Database setup failed: " . $e->getMessage() . "\n";
}

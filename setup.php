<?php
require_once __DIR__ . '/config/database.php';

try {
    // Define the database path
    $db_path = __DIR__ . '/database/kiptra.db';

    // Create the database directory if it doesn't exist
    if (!is_dir(__DIR__ . '/database')) {
        mkdir(__DIR__ . '/database');
    }

    // Delete the old database file if it exists
    if (file_exists($db_path)) {
        unlink($db_path);
    }

    // Create the database file
    $db = new PDO('sqlite:' . $db_path);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Create the tables
    $schema = file_get_contents(__DIR__ . '/database/schema.sql');
    $db->exec($schema);

    // Insert the seed data
    $seed = file_get_contents(__DIR__ . '/database/seed.sql');
    $db->exec($seed);

    echo "Database setup complete! The database file is located at: " . $db_path . "\n";
} catch (Exception $e) {
    echo "Database setup failed: " . $e->getMessage() . "\n";
}

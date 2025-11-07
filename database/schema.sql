CREATE TABLE `users` (
  `id` INTEGER PRIMARY KEY,
  `name` TEXT NOT NULL,
  `email` TEXT NOT NULL UNIQUE,
  `role` TEXT NOT NULL DEFAULT 'User',
  `verified` INTEGER NOT NULL DEFAULT 0,
  `password` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `categories` (
  `id` INTEGER PRIMARY KEY,
  `name` TEXT NOT NULL,
  `icon` TEXT DEFAULT NULL,
  `parent_id` INTEGER DEFAULT NULL
);

CREATE TABLE `vendors` (
  `id` INTEGER PRIMARY KEY,
  `user_id` INTEGER NOT NULL,
  `verified` INTEGER NOT NULL DEFAULT 0,
  `business_name` TEXT NOT NULL,
  `website` TEXT DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `listings` (
  `id` INTEGER PRIMARY KEY,
  `title` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `category_id` INTEGER NOT NULL,
  `location` TEXT NOT NULL,
  `contact_info` TEXT,
  `rating_avg` REAL NOT NULL DEFAULT 0.00,
  `vendor_id` INTEGER DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `reviews` (
  `id` INTEGER PRIMARY KEY,
  `listing_id` INTEGER NOT NULL,
  `user_id` INTEGER NOT NULL,
  `rating` INTEGER NOT NULL,
  `comment` TEXT,
  `status` TEXT NOT NULL DEFAULT 'pending',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `flags` (
  `id` INTEGER PRIMARY KEY,
  `listing_id` INTEGER NOT NULL,
  `user_id` INTEGER NOT NULL,
  `reason` TEXT NOT NULL,
  `status` TEXT NOT NULL DEFAULT 'pending',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

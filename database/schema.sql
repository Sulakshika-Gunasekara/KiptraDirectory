-- Kiptra Sri Lanka MySQL Schema

-- Users Table
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `role` ENUM('Admin', 'Vendor', 'Moderator', 'User') NOT NULL DEFAULT 'User',
  `verified` TINYINT(1) NOT NULL DEFAULT 0,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Categories Table
CREATE TABLE IF NOT EXISTS `categories` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `icon` VARCHAR(255),
  `parent_id` INT,
  `image_url` VARCHAR(255),
  FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Vendors Table
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `verified` TINYINT(1) NOT NULL DEFAULT 0,
  `business_name` VARCHAR(255) NOT NULL,
  `website` VARCHAR(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Listings Table
CREATE TABLE IF NOT EXISTS `listings` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `category_id` INT NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `contact_info` VARCHAR(255),
  `rating_avg` DECIMAL(3, 2) NOT NULL DEFAULT 0.00,
  `vendor_id` INT,
  `image_url` VARCHAR(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Reviews Table
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `listing_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` TINYINT NOT NULL CHECK(`rating` >= 1 AND `rating` <= 5),
  `comment` TEXT,
  `status` ENUM('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Flags Table
CREATE TABLE IF NOT EXISTS `flags` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `listing_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `reason` TEXT NOT NULL,
  `status` ENUM('pending', 'resolved') NOT NULL DEFAULT 'pending',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`listing_id`) REFERENCES `listings` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

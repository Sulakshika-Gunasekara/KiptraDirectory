-- Kiptra Sri Lanka SQLite Schema

-- Users Table
CREATE TABLE IF NOT EXISTS "users" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL,
  "email" TEXT NOT NULL UNIQUE,
  "role" TEXT NOT NULL DEFAULT 'User' CHECK(role IN ('Admin', 'Vendor', 'Moderator', 'User')),
  "verified" INTEGER NOT NULL DEFAULT 0,
  "password" TEXT NOT NULL,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE IF NOT EXISTS "categories" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL,
  "icon" TEXT,
  "parent_id" INTEGER,
  FOREIGN KEY (parent_id) REFERENCES categories (id) ON DELETE SET NULL
);

-- Vendors Table
CREATE TABLE IF NOT EXISTS "vendors" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER NOT NULL,
  "verified" INTEGER NOT NULL DEFAULT 0,
  "business_name" TEXT NOT NULL,
  "website" TEXT,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

-- Listings Table
CREATE TABLE IF NOT EXISTS "listings" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "title" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "category_id" INTEGER NOT NULL,
  "location" TEXT NOT NULL,
  "contact_info" TEXT,
  "rating_avg" REAL NOT NULL DEFAULT 0.00,
  "vendor_id" INTEGER,
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE,
  FOREIGN KEY (vendor_id) REFERENCES vendors (id) ON DELETE SET NULL
);

-- Reviews Table
CREATE TABLE IF NOT EXISTS "reviews" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "listing_id" INTEGER NOT NULL,
  "user_id" INTEGER NOT NULL,
  "rating" INTEGER NOT NULL CHECK(rating >= 1 AND rating <= 5),
  "comment" TEXT,
  "status" TEXT NOT NULL DEFAULT 'pending' CHECK(status IN ('pending', 'approved', 'rejected')),
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (listing_id) REFERENCES listings (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

-- Flags Table
CREATE TABLE IF NOT EXISTS "flags" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "listing_id" INTEGER NOT NULL,
  "user_id" INTEGER NOT NULL,
  "reason" TEXT NOT NULL,
  "status" TEXT NOT NULL DEFAULT 'pending' CHECK(status IN ('pending', 'resolved')),
  "created_at" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (listing_id) REFERENCES listings (id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

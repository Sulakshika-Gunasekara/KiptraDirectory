-- Kiptra Sri Lanka SQLite Seed Data

-- Users
INSERT INTO "users" ("name", "email", "role", "verified", "password") VALUES
('Admin User', 'admin@kiptra.com', 'Admin', 1, 'password123'),
('Vendor User', 'vendor@kiptra.com', 'Vendor', 1, 'password123');

-- Categories
INSERT INTO "categories" ("name", "icon") VALUES
('SIM & Connectivity', 'wifi'),
('Health & Safety', 'heart'),
('Food & Drink', 'utensils'),
('Transport', 'bus'),
('Stay', 'bed');

-- Vendors
-- Note: The user_id corresponds to the 'Vendor User' created above (ID: 2)
INSERT INTO "vendors" ("user_id", "verified", "business_name", "website") VALUES
(2, 1, 'Dialog Axiata', 'dialog.lk');

-- Listings
-- Note: The category_id corresponds to the categories above (1-5)
INSERT INTO "listings" ("title", "description", "category_id", "location", "contact_info", "rating_avg", "vendor_id") VALUES
('Dialog Tourist SIM', 'Get a local SIM card with 4G coverage and great data packages.', 1, 'Colombo, Sri Lanka', '+94 77 712 3456', 4.5, 1),
('Asiri Health', '24/7 emergency services and quality medical care.', 2, 'Galle, Sri Lanka', '+94 91 222 3333', 4.8, NULL),
('Nuga Gama Restaurant', 'Authentic Sri Lankan cuisine in a traditional village setting.', 3, 'Cinnamon Grand, Colombo', '+94 11 249 7361', 4.6, NULL),
('PickMe Ride Service', 'Sri Lanka''s #1 ride-hailing app for tuk-tuks, cars, and bikes.', 4, 'Islandwide', 'https://pickme.lk', 4.3, NULL),
('Cinnamon Lakeside Hotel', 'Luxury hotel with a stunning pool and views of Beira Lake.', 5, 'Colombo, Sri Lanka', '+94 11 249 1000', 4.7, NULL);

-- Reviews
-- Note: The listing_id and user_id correspond to the records created above
INSERT INTO "reviews" ("listing_id", "user_id", "rating", "comment", "status") VALUES
(1, 1, 5, 'Super easy to activate and the coverage was excellent.', 'approved'),
(3, 2, 4, 'The ambiance was amazing, but it was a bit pricey for the portion sizes.', 'approved'),
(4, 1, 4, 'Very convenient, but sometimes hard to find a driver during peak hours.', 'approved');

-- Kiptra Sri Lanka SQLite Seed Data

-- Users
INSERT INTO "users" ("name", "email", "role", "verified", "password") VALUES
('Admin User', 'admin@kiptra.com', 'Admin', 1, 'password123'),
('Vendor User', 'vendor@kiptra.com', 'Vendor', 1, 'password123');

-- Categories
INSERT INTO "categories" ("name", "icon", "image_url") VALUES
('Arrival & Essentials', 'fas fa-plane-arrival', 'https://images.unsplash.com/photo-1578509349548-1a5c7a5f22e7?q=80&w=2070&auto=format&fit=crop'),
('Health & Safety', 'fas fa-heartbeat', 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2070&auto=format&fit=crop'),
('Transport', 'fas fa-bus', 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1974&auto=format&fit=crop'),
('Food & Drink', 'fas fa-utensils', 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop'),
('Stay', 'fas fa-bed', 'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop'),
('Activities', 'fas fa-hiking', 'https://images.unsplash.com/photo-1551632811-561732d1e306?q=80&w=2070&auto=format&fit=crop'),
('Shopping', 'fas fa-shopping-bag', 'https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?q=80&w=2070&auto=format&fit=crop'),
('Money', 'fas fa-money-bill-wave', 'https://images.unsplash.com/photo-1561414927-6d86591d0c4f?q=80&w=2070&auto=format&fit=crop'),
('Connectivity', 'fas fa-wifi', 'https://images.unsplash.com/photo-1582267549339-342a1a2b4676?q=80&w=2070&auto=format&fit=crop'),
('Emergencies', 'fas fa-ambulance', 'https://images.unsplash.com/photo-1586911634354-a7a134a65476?q=80&w=2070&auto=format&fit=crop'),
('Nature & Wildlife', 'fas fa-leaf', 'https://images.unsplash.com/photo-1518999399823-39a1c1a2e7a3?q=80&w=2070&auto=format&fit=crop'),
('Events & Festivals', 'fas fa-calendar-alt', 'https://images.unsplash.com/photo-1511795409834-ef04bbd51622?q=80&w=2070&auto=format&fit=crop'),
('Hidden Local Tips', 'fas fa-lightbulb', 'https://images.unsplash.com/photo-1521791136064-7986c2920216?q=80&w=2070&auto=format&fit=crop'),
('Family & Kids', 'fas fa-child', 'https://images.unsplash.com/photo-1556228720-195a672e8a03?q=80&w=2070&auto=format&fit=crop'),
('Accessibility', 'fab fa-accessible-icon', 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?q=80&w=2070&auto=format&fit=crop');

-- Listings
INSERT INTO "listings" ("title", "description", "category_id", "location", "contact_info", "rating_avg", "vendor_id", "image_url") VALUES
('Visa Assistance', 'Get help with your Sri Lankan visa application.', 1, 'Online', 'visa@example.com', 4.5, NULL, 'https://images.unsplash.com/photo-1578509349548-1a5c7a5f22e7?q=80&w=2070&auto=format&fit=crop'),
('Asiri Health', '24/7 emergency services and quality medical care.', 2, 'Galle, Sri Lanka', '+94 91 222 3333', 4.8, NULL, 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2070&auto=format&fit=crop'),
('PickMe Ride Service', 'Sri Lanka''s #1 ride-hailing app for tuk-tuks, cars, and bikes.', 3, 'Islandwide', 'https://pickme.lk', 4.3, NULL, 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1974&auto=format&fit=crop'),
('Nuga Gama Restaurant', 'Authentic Sri Lankan cuisine in a traditional village setting.', 4, 'Cinnamon Grand, Colombo', '+94 11 249 7361', 4.6, NULL, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop'),
('Cinnamon Lakeside Hotel', 'Luxury hotel with a stunning pool and views of Beira Lake.', 5, 'Colombo, Sri Lanka', '+94 11 249 1000', 4.7, NULL, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop'),
('Whale Watching in Mirissa', 'Experience the thrill of seeing blue whales and dolphins in their natural habitat.', 6, 'Mirissa, Sri Lanka', '', 4.7, NULL, 'https://images.unsplash.com/photo-1551632811-561732d1e306?q=80&w=2070&auto=format&fit=crop'),
('Barefoot', 'A vibrant shop with handloom textiles, books, and a charming cafe.', 7, 'Colombo, Sri Lanka', '+94 11 258 9701', 4.6, NULL, 'https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?q=80&w=2070&auto=format&fit=crop'),
('Sampath Bank ATM', 'Widely available ATMs for cash withdrawals.', 8, 'Islandwide', '', 4.2, NULL, 'https://images.unsplash.com/photo-1561414927-6d86591d0c4f?q=80&w=2070&auto=format&fit=crop'),
('Dialog Tourist SIM', 'Get a local SIM card with 4G coverage and great data packages.', 9, 'Colombo, Sri Lanka', '+94 77 712 3456', 4.5, 1, 'https://images.unsplash.com/photo-1582267549339-342a1a2b4676?q=80&w=2070&auto=format&fit=crop'),
('Tourist Police', 'For assistance and emergencies, contact the Tourist Police.', 10, 'Islandwide', '1912', 4.0, NULL, 'https://images.unsplash.com/photo-1586911634354-a7a134a65476?q=80&w=2070&auto=format&fit=crop'),
('Yala National Park', 'Home to leopards, elephants, and a variety of bird species.', 11, 'Yala, Sri Lanka', '', 4.8, NULL, 'https://images.unsplash.com/photo-1518999399823-39a1c1a2e7a3?q=80&w=2070&auto=format&fit=crop'),
('Kandy Esala Perahera', 'A grand Buddhist festival with elephants, dancers, and drummers.', 12, 'Kandy, Sri Lanka', '', 4.9, NULL, 'https://images.unsplash.com/photo-1511795409834-ef04bbd51622?q=80&w=2070&auto=format&fit=crop'),
('Secret Waterfall Hike', 'Discover a hidden waterfall off the beaten path.', 13, 'Ella, Sri Lanka', '', 4.9, NULL, 'https://images.unsplash.com/photo-1521791136064-7986c2920216?q=80&w=2070&auto=format&fit=crop'),
('Dehiwala Zoo', 'A great place for a family outing to see a variety of animals.', 14, 'Dehiwala, Sri Lanka', '+94 11 271 2751', 4.4, NULL, 'https://images.unsplash.com/photo-1556228720-195a672e8a03?q=80&w=2070&auto=format&fit=crop'),
('Wheelchair Accessible Hotel', 'A hotel with facilities for guests with mobility needs.', 15, 'Negombo, Sri Lanka', '', 4.6, NULL, 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?q=80&w=2070&auto=format&fit=crop');

-- Reviews
-- Note: The listing_id and user_id correspond to the records created above
INSERT INTO "reviews" ("listing_id", "user_id", "rating", "comment", "status") VALUES
(1, 1, 5, 'Super easy to activate and the coverage was excellent.', 'approved'),
(3, 2, 4, 'The ambiance was amazing, but it was a bit pricey for the portion sizes.', 'approved'),
(4, 1, 4, 'Very convenient, but sometimes hard to find a driver during peak hours.', 'approved');

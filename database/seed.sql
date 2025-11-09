-- Kiptra Sri Lanka SQLite Seed Data

-- Users
INSERT INTO "users" ("name", "email", "role", "verified", "password") VALUES
('Admin User', 'admin@kiptra.com', 'Admin', 1, 'password123'),
('Vendor User', 'vendor@kiptra.com', 'Vendor', 1, 'password123');

-- Main Categories (parent_id is NULL)
-- The IDs are explicitly set to make parent_id references stable.
INSERT INTO "categories" ("id", "name", "icon", "parent_id") VALUES
(1, 'Arrival & Essentials', 'fas fa-plane-arrival', NULL),
(2, 'Health & Safety', 'fas fa-heartbeat', NULL),
(3, 'Transport', 'fas fa-bus', NULL),
(4, 'Food & Drink', 'fas fa-utensils', NULL),
(5, 'Stay', 'fas fa-bed', NULL),
(6, 'Activities', 'fas fa-hiking', NULL),
(7, 'Shopping', 'fas fa-shopping-bag', NULL),
(8, 'Money', 'fas fa-money-bill-wave', NULL),
(9, 'Connectivity', 'fas fa-wifi', NULL),
(10, 'Emergencies', 'fas fa-ambulance', NULL),
(11, 'Nature & Wildlife', 'fas fa-leaf', NULL),
(12, 'Events & Festivals', 'fas fa-calendar-alt', NULL),
(13, 'Hidden Local Tips', 'fas fa-lightbulb', NULL),
(14, 'Family & Kids', 'fas fa-child', NULL),
(15, 'Accessibility', 'fab fa-accessible-icon', NULL);

-- Sub-Categories
-- Each record has a name and a parent_id linking it to a main category.
INSERT INTO "categories" ("id", "name", "parent_id") VALUES
-- Arrival & Essentials Subs
(16, 'Visa', 1),
(17, 'SIM', 1),
(18, 'Currency', 1),
(19, 'Airport Tips', 1),
-- Health & Safety Subs
(20, 'Hospitals', 2),
(21, 'Pharmacies', 2),
(22, 'Insurance', 2),
-- Transport Subs
(23, 'Trains', 3),
(24, 'Buses', 3),
(25, 'Rideshares', 3),
(26, 'Rentals', 3),
-- Food & Drink Subs
(27, 'Vegan', 4),
(28, 'Sugar-Free', 4),
(29, 'Local Eats', 4),
(30, 'Halal', 4),
(31, 'Fine Dining', 4),
-- Stay Subs
(32, 'Hotels', 5),
(33, 'Hostels', 5),
(34, 'Eco Lodges', 5),
-- Activities Subs
(35, 'Adventure', 6),
(36, 'Wellness', 6),
(37, 'Culture', 6),
(38, 'Spiritual Retreats', 6),
-- Shopping Subs
(39, 'Local Crafts', 7),
(40, 'Grocery', 7),
(41, 'Sustainable Brands', 7),
-- Money Subs
(42, 'ATMs', 8),
(43, 'Banks', 8),
(44, 'Currency Rates', 8),
-- Connectivity Subs
(45, 'SIMs', 9),
(46, 'Wi-Fi', 9),
(47, 'Cowork Spaces', 9),
-- Emergencies Subs
(48, 'Police', 10),
(49, 'Embassies', 10),
(50, 'Hotlines', 10),
-- Nature & Wildlife Subs
(51, 'Parks', 11),
(52, 'Sanctuaries', 11),
(53, 'Responsible Travel', 11),
-- Accessibility Subs
(54, 'Wheelchair-friendly', 15),
(55, 'Senior Travel', 15);

-- Listings
-- The category_id now points to a sub-category ID.
-- For main categories without defined sub-categories, it points to the main category ID.
INSERT INTO "listings" ("title", "description", "category_id", "location", "contact_info", "rating_avg", "vendor_id", "image_url") VALUES
-- Arrival & Essentials Listings
('Online Visa Application', 'Official government portal for Sri Lankan ETA.', 16, 'Online', 'https://www.eta.gov.lk', 4.8, NULL, 'https://images.unsplash.com/photo-1578509349548-1a5c7a5f22e7?q=80&w=2070&auto=format&fit=crop'),
('Dialog Tourist SIM', 'Get a local SIM card with 4G coverage.', 17, 'Bandaranaike International Airport', '+94 77 712 3456', 4.5, NULL, 'https://images.unsplash.com/photo-1582267549339-342a1a2b4676?q=80&w=2070&auto=format&fit=crop'),
('Hutch Tourist SIM', 'Affordable SIM with good coverage.', 17, 'Bandaranaike International Airport', '', 4.3, NULL, 'https://images.unsplash.com/photo-1582267549339-342a1a2b4676?q=80&w=2070&auto=format&fit=crop'),
('Commercial Bank Currency Exchange', 'Competitive exchange rates at the airport.', 18, 'Bandaranaike International Airport', '', 4.2, NULL, 'https://images.unsplash.com/photo-1561414927-6d86591d0c4f?q=80&w=2070&auto=format&fit=crop'),
('Airport Taxi Service', 'Official airport taxi counter for safe travel.', 19, 'Bandaranaike International Airport', '', 4.0, NULL, 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1974&auto=format&fit=crop'),
-- Health & Safety Listings
('Asiri Health', '24/7 emergency services and quality medical care.', 20, 'Colombo, Sri Lanka', '+94 11 257 5348', 4.8, NULL, 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2070&auto=format&fit=crop'),
('Nawaloka Hospital', 'Leading private hospital in Colombo.', 20, 'Colombo, Sri Lanka', '+94 11 254 4444', 4.7, NULL, 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2070&auto=format&fit=crop'),
('Healthguard Pharmacy', 'Chain of pharmacies with a wide range of products.', 21, 'Islandwide', '', 4.4, NULL, 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2070&auto=format&fit=crop'),
('Allianz Insurance Lanka', 'Travel insurance plans for tourists.', 22, 'Online', 'https://www.allianz.lk', 4.6, NULL, 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2070&auto=format&fit=crop'),
-- Transport Listings
('Sri Lanka Railways', 'Scenic train journeys across the country.', 23, 'Islandwide', 'https://www.railway.gov.lk', 4.7, NULL, 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1974&auto=format&fit=crop'),
('National Transport Commission', 'Public bus service information.', 24, 'Islandwide', 'https://www.ntc.gov.lk', 3.8, NULL, 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1974&auto=format&fit=crop'),
('PickMe Ride Service', 'Sri Lanka''s #1 ride-hailing app.', 25, 'Islandwide', 'https://pickme.lk', 4.3, NULL, 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1974&auto=format&fit=crop'),
('Uber Sri Lanka', 'International ride-hailing service.', 25, 'Colombo, Sri Lanka', 'https://www.uber.com/lk', 4.2, NULL, 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1974&auto=format&fit=crop'),
('Malkey Rent A Car', 'Reliable car rental service.', 26, 'Colombo, Sri Lanka', '+94 11 258 7777', 4.5, NULL, 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1974&auto=format&fit=crop'),
-- Food & Drink Listings
('The Vegan Kitchen', 'Delicious plant-based meals.', 27, 'Colombo, Sri Lanka', '', 4.9, NULL, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop'),
('Cafe Nuga', 'Healthy and sugar-free options.', 28, 'Colombo, Sri Lanka', '', 4.7, NULL, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop'),
('Upali''s by Nawaloka', 'Authentic Sri Lankan cuisine.', 29, 'Colombo, Sri Lanka', '+94 11 269 5812', 4.6, NULL, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop'),
('Shanmugas', 'Authentic vegetarian South Indian food.', 29, 'Colombo, Sri Lanka', '', 4.5, NULL, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop'),
('Arabian Knights', 'Popular spot for Halal Arabian food.', 30, 'Colombo, Sri Lanka', '', 4.4, NULL, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop'),
('Ministry of Crab', 'World-renowned seafood restaurant.', 31, 'Colombo, Sri Lanka', '+94 11 234 2722', 4.8, NULL, 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop'),
-- Stay Listings
('Cinnamon Grand Hotel', 'Five-star luxury in the heart of Colombo.', 32, 'Colombo, Sri Lanka', '+94 11 243 7437', 4.7, NULL, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop'),
('Jetwing Lighthouse', 'Luxury hotel with stunning ocean views.', 32, 'Galle, Sri Lanka', '', 4.8, NULL, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop'),
('Hangover Hostels', 'Popular hostel chain for backpackers.', 33, 'Mirissa, Sri Lanka', '', 4.5, NULL, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop'),
('Gal Oya Lodge', 'Eco-lodge experience in the wilderness.', 34, 'Gal Oya National Park', '', 4.9, NULL, 'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop'),
-- Activities Listings
('Ella Zip-line', 'Experience the thrill of zip-lining over the hills of Ella.', 35, 'Ella, Sri Lanka', '', 4.8, NULL, 'https://images.unsplash.com/photo-1551632811-561732d1e306?q=80&w=2070&auto=format&fit=crop'),
('Sithsuwa Ayurveda', 'Traditional Ayurvedic wellness treatments.', 36, 'Bentota, Sri Lanka', '', 4.7, NULL, 'https://images.unsplash.com/photo-1551632811-561732d1e306?q=80&w=2070&auto=format&fit=crop'),
('Sigiriya Rock Fortress', 'Climb the ancient rock fortress.', 37, 'Sigiriya, Sri Lanka', '', 4.9, NULL, 'https://images.unsplash.com/photo-1551632811-561732d1e306?q=80&w=2070&auto=format&fit=crop'),
('Nilambe Meditation Centre', 'Silent meditation retreats.', 38, 'Kandy, Sri Lanka', '', 4.8, NULL, 'https://images.unsplash.com/photo-1551632811-561732d1e306?q=80&w=2070&auto=format&fit=crop'),
-- Shopping Listings
('Laksala', 'State-owned gift and souvenir boutique.', 39, 'Colombo, Sri Lanka', '', 4.3, NULL, 'https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?q=80&w=2070&auto=format&fit=crop'),
('Keells Super', 'Modern supermarket chain for groceries.', 40, 'Islandwide', '', 4.5, NULL, 'https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?q=80&w=2070&auto=format&fit=crop'),
('Barefoot', 'Socially responsible handloom products.', 41, 'Colombo, Sri Lanka', '', 4.6, NULL, 'https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?q=80&w=2070&auto=format&fit=crop'),
-- Money Listings
('Sampath Bank ATM', 'Widely available ATMs for cash withdrawals.', 42, 'Islandwide', '', 4.2, NULL, 'https://images.unsplash.com/photo-1561414927-6d86591d0c4f?q=80&w=2070&auto=format&fit=crop'),
('Bank of Ceylon', 'Local bank for currency exchange.', 43, 'Islandwide', '', 4.1, NULL, 'https://images.unsplash.com/photo-1561414927-6d86591d0c4f?q=80&w=2070&auto=format&fit=crop'),
('Central Bank Currency Rates', 'Official exchange rates.', 44, 'Online', 'https://www.cbsl.gov.lk', 4.0, NULL, 'https://images.unsplash.com/photo-1561414927-6d86591d0c4f?q=80&w=2070&auto=format&fit=crop'),
-- Connectivity Listings
('Mobitel Tourist Plan', 'Prepaid SIM with data and call packages.', 45, 'Bandaranaike International Airport', '', 4.4, NULL, 'https://images.unsplash.com/photo-1582267549339-342a1a2b4676?q=80&w=2070&auto=format&fit=crop'),
('Public Library Wi-Fi', 'Free Wi-Fi hotspots in public libraries.', 46, 'Colombo, Sri Lanka', '', 3.5, NULL, 'https://images.unsplash.com/photo-1582267549339-342a1a2b4676?q=80&w=2070&auto=format&fit=crop'),
('Colombo Cooperative', 'Coworking space with reliable internet.', 47, 'Colombo, Sri Lanka', '', 4.7, NULL, 'https://images.unsplash.com/photo-1582267549339-342a1a2b4676?q=80&w=2070&auto=format&fit=crop'),
-- Emergencies Listings
('Tourist Police', 'For assistance and emergencies, contact the Tourist Police.', 48, 'Islandwide', '1912', 4.0, NULL, 'https://images.unsplash.com/photo-1586911634354-a7a134a65476?q=80&w=2070&auto=format&fit=crop'),
('US Embassy', 'Embassy of the United States of America.', 49, 'Colombo, Sri Lanka', '+94 11 249 8500', 4.2, NULL, 'https://images.unsplash.com/photo-1586911634354-a7a134a65476?q=80&w=2070&auto=format&fit=crop'),
('Suwa Seriya', '24/7 pre-hospital care ambulance service.', 50, 'Islandwide', '1990', 4.9, NULL, 'https://images.unsplash.com/photo-1586911634354-a7a134a65476?q=80&w=2070&auto=format&fit=crop'),
-- Nature & Wildlife Listings
('Yala National Park', 'Home to leopards, elephants, and a variety of bird species.', 51, 'Yala, Sri Lanka', '', 4.8, NULL, 'https://images.unsplash.com/photo-1518999399823-39a1c1a2e7a3?q=80&w=2070&auto=format&fit=crop'),
('Udawalawe Elephant Transit Home', 'Rehabilitation center for orphaned elephant calves.', 52, 'Udawalawe, Sri Lanka', '', 4.9, NULL, 'https://images.unsplash.com/photo-1518999399823-39a1c1a2e7a3?q=80&w=2070&auto=format&fit=crop'),
('Sri Lanka Wildlife Conservation Society', 'Promoting responsible wildlife tourism.', 53, 'Online', 'https://www.slwcs.org', 4.7, NULL, 'https://images.unsplash.com/photo-1518999399823-39a1c1a2e7a3?q=80&w=2070&auto=format&fit=crop'),
-- Accessibility Listings
('Wheelchair Accessible Hotel', 'A hotel with facilities for guests with mobility needs.', 54, 'Negombo, Sri Lanka', '', 4.6, NULL, 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?q=80&w=2070&auto=format&fit=crop'),
('Accessible Tours Sri Lanka', 'Customized tours for senior travelers.', 55, 'Online', '', 4.8, NULL, 'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?q=80&w=2070&auto=format&fit=crop'),
-- Listings for Categories without Sub-categories
('Kandy Esala Perahera', 'A grand Buddhist festival with elephants, dancers, and drummers.', 12, 'Kandy, Sri Lanka', '', 4.9, NULL, 'https://images.unsplash.com/photo-1511795409834-ef04bbd51622?q=80&w=2070&auto=format&fit=crop'),
('Galle Literary Festival', 'Annual international literary festival.', 12, 'Galle, Sri Lanka', '', 4.7, NULL, 'https://images.unsplash.com/photo-1511795409834-ef04bbd51622?q=80&w=2070&auto=format&fit=crop'),
('Secret Waterfall Hike', 'Discover a hidden waterfall off the beaten path.', 13, 'Ella, Sri Lanka', '', 4.9, NULL, 'https://images.unsplash.com/photo-1521791136064-7986c2920216?q=80&w=2070&auto=format&fit=crop'),
('Dehiwala Zoo', 'A great place for a family outing to see a variety of animals.', 14, 'Dehiwala, Sri Lanka', '+94 11 271 2751', 4.4, NULL, 'https://images.unsplash.com/photo-1556228720-195a672e8a03?q=80&w=2070&auto=format&fit=crop');

-- Reviews
INSERT INTO "reviews" ("listing_id", "user_id", "rating", "comment", "status") VALUES
(2, 1, 5, 'Super easy to activate and the coverage was excellent.', 'approved');

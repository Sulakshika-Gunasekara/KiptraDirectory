INSERT INTO users (name, email, role, verified, password) VALUES
('Admin User', 'admin@kiptra.com', 'Admin', 1, 'password'),
('Vendor User', 'vendor@kiptra.com', 'Vendor', 1, 'password');

INSERT INTO categories (name, icon, parent_id) VALUES
('SIM & Connectivity', 'wifi', NULL),
('Health & Safety', 'heart', NULL),
('Food & Drink', 'utensils', NULL),
('Transport', 'bus', NULL),
('Stay', 'bed', NULL);

INSERT INTO vendors (user_id, verified, business_name, website) VALUES
(2, 1, 'Sample Vendor', 'https://vendor.com');

INSERT INTO listings (title, description, category_id, location, contact_info, vendor_id) VALUES
('Dialog SIM Card', 'Get a local SIM card with 4G coverage.', 1, 'Colombo, Sri Lanka', '123-456-7890', 1),
('Asiri Health', '24/7 emergency services and medical care.', 2, 'Galle, Sri Lanka', '098-765-4321', NULL),
('Nuga Gama', 'Authentic Sri Lankan cuisine in a village setting.', 3, 'Cinnamon Grand, Colombo', '111-222-3333', NULL),
('PickMe', 'Ride-hailing app for tuk-tuks, cars, and bikes.', 4, 'Islandwide', 'https://pickme.lk', NULL),
('Cinnamon Lakeside', 'Luxury hotel with a pool and city views.', 5, 'Colombo, Sri Lanka', '444-555-6666', NULL);

INSERT INTO reviews (listing_id, user_id, rating, comment, status) VALUES
(1, 1, 5, 'Great value and easy to activate.', 'approved'),
(3, 2, 4, 'Lovely ambiance, but a bit pricey.', 'approved');

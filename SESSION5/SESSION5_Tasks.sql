DROP TABLE IF EXISTS movie_bookings;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_method VARCHAR(50)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE movie_bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(150),
    booking_date DATETIME
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    sold_count INT
);

INSERT INTO orders (payment_method) VALUES ('UPI'), ('Credit Card'), ('UPI'), ('COD'), ('Credit Card');
INSERT INTO users (username, city) VALUES ('user1', 'Vadodara'), ('user2', 'Ahmedabad'), ('user3', 'Surat'), ('user4', 'Anand');
INSERT INTO movie_bookings (movie_name, booking_date) VALUES 
('Movie A', '2026-07-10 10:00:00'),
('Movie B', '2026-07-11 12:00:00'),
('Movie C', '2026-07-12 15:30:00'),
('Movie D', '2026-07-13 18:00:00'),
('Movie E', '2026-07-14 20:15:00'),
('Movie F', '2026-07-15 09:00:00');

INSERT INTO products (name, category, sold_count) VALUES 
('Prod 1', 'Electronics', 500), ('Prod 2', 'Clothing', 1200), 
('Prod 3', 'Electronics', 150), ('Prod 4', 'Footwear', 890),
('Prod 5', 'Clothing', 2100), ('Prod 6', 'Home', 50),
('Prod 7', 'Electronics', 3100), ('Prod 8', 'Footwear', 1500),
('Prod 9', 'Home', 600), ('Prod 10', 'Books', 950),
('Prod 11', 'Books', 200);



-- Task 1: Find all unique payment methods used in the orders table using DISTINCT
SELECT DISTINCT payment_method FROM orders;

-- Task 2: List all unique registration cities sorted in alphabetical order (A-Z)
SELECT DISTINCT city FROM users 
ORDER BY city ASC;

-- Task 3: Select the top 5 most recent movie bookings ordered by booking_date descending using LIMIT
SELECT * FROM movie_bookings 
ORDER BY booking_date DESC 
LIMIT 5;

-- Task 4: Retrieve the 10 products with the highest sold_count displaying only name and sold count
SELECT name, sold_count FROM products 
ORDER BY sold_count DESC 
LIMIT 10;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS restaurants;

CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE songs (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(150),
    artist_name VARCHAR(150)
);

INSERT INTO restaurants (name, city) VALUES 
('Good Vibes Cafe', 'Vadodara'),
('Spice Restro', 'Ahmedabad'),
('Coffee Day Cafe', 'Surat');

INSERT INTO products (product_name, price) VALUES 
('T-Shirt', 699.00),
('Shoes', 1499.00),
('Smartphone', 18999.00),
('Backpack', 450.00);

INSERT INTO users (username, city) VALUES 
('raj_23', 'Ahmedabad'),
('hardik_p', 'Vadodara'),
('amit_k', 'Mumbai'),
('janki_v', 'Surat');

INSERT INTO songs (song_name, artist_name) VALUES 
('Song A', 'Arijit Singh'),
('Song B', 'AR Rahman'),
('Song C', 'Diljit Dosanjh'),
('Song D', 'Atif Aslam');



-- Task 1: Find all restaurants whose names end with 'Cafe' using the LIKE operator
SELECT * FROM restaurants 
WHERE name LIKE '%Cafe';

-- Task 2: Select all products with a price between 500 and 1500 rupees using BETWEEN
SELECT * FROM products 
WHERE price BETWEEN 500 AND 1500;

-- Task 3: Display all users whose city is either 'Ahmedabad', 'Surat', or 'Vadodara' using IN
SELECT * FROM users 
WHERE city IN ('Ahmedabad', 'Surat', 'Vadodara');

-- Task 4: Find all songs where artist_name contains the letter sequence 'ar' anywhere using LIKE
SELECT * FROM songs 
WHERE artist_name LIKE '%ar%';
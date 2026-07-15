DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    rating DECIMAL(2,1)
);

CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(150),
    release_year INT,
    genre VARCHAR(50)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100),
    city VARCHAR(100),
    followers INT
);

INSERT INTO restaurants (name, rating) VALUES 
('Barbeque Nation', 4.6),
('Local Cafe', 4.2),
('Express Diner', 4.5);

INSERT INTO movies (movie_name, release_year, genre) VALUES 
('Action Movie A', 2024, 'Action'),
('Action Movie B', 2018, 'Action'),
('Drama Movie C', 2025, 'Drama');

INSERT INTO products (name, price, category) VALUES 
('Laptop', 45000.00, 'Electronics'),
('Desk Lamp', 350.00, 'Electronics'),
('Office Chair', 4500.00, 'Furniture'),
('Notebook', 80.00, 'Stationery');

INSERT INTO users (username, city, followers) VALUES 
('rahul_shah', 'Vadodara', 1500),
('amit_p', 'Ahmedabad', 2500),
('sneha_v', 'Surat', 850),
('pooja_m', 'Mumbai', 3000);


-- Task 1: Select all restaurants where the rating is greater than or equal to 4.5
SELECT * FROM restaurants 
WHERE rating >= 4.5;

-- Task 2: Filter and display movies released after 2020 and with genre 'Action' using WHERE and AND
SELECT * FROM movies 
WHERE release_year > 2020 AND genre = 'Action';

-- Task 3: Find all products not in the 'Electronics' category or with a price less than 500
SELECT * FROM products 
WHERE category != 'Electronics' OR price < 500;

-- Task 4: Show all users who are NOT from 'Ahmedabad' and have more than 1000 followers using NOT combined with AND
SELECT * FROM users 
WHERE NOT city = 'Ahmedabad' AND followers > 1000;
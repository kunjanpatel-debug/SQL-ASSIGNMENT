CREATE DATABASE session2_practice_db;
USE session2_practice_db;

CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE zomato_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    rating DECIMAL(2,1),
    review_text TEXT
);


CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(150),
    release_year INT,
    genre VARCHAR(50)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT
);


INSERT INTO restaurants (name, cuisine, city) VALUES 
('The Spice Route', 'North Indian', 'Vadodara'),
('Sankalp', 'South Indian', 'Ahmedabad');

INSERT INTO zomato_reviews (name, rating, review_text) VALUES 
('The Spice Route', 4.5, 'Excellent ambience and authentic taste.'),
('Sankalp', 4.2, 'Great dosa options and fast service.');

INSERT INTO movies (movie_name, release_year, genre) VALUES 
('Inception', 2010, 'Sci-Fi'),
('The Dark Knight', 2008, 'Action');

INSERT INTO products (product_name, price, stock_quantity) VALUES 
('Wireless Mouse', 499.00, 150),
('Mechanical Keyboard', 2499.00, 45);


SELECT * FROM restaurants;

SELECT name, rating FROM zomato_reviews;

SELECT movie_name AS 'Title', release_year AS 'Year Released' FROM movies;

SELECT * FROM products;
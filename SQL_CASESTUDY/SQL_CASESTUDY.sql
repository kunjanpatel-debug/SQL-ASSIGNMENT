#CASE-STUDY: ZOMATO BANGALORE DATASET INITIALIZATION


DROP TABLE IF EXISTS zomato_bangalore;

CREATE TABLE zomato_bangalore (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150),
    location VARCHAR(100),
    cuisine VARCHAR(255),
    restaurant_type VARCHAR(100),
    avg_rating DECIMAL(2,1),
    votes INT,
    approx_cost_two INT
);

INSERT INTO zomato_bangalore (name, location, cuisine, restaurant_type, avg_rating, votes, approx_cost_two) VALUES
('The Black Pearl', 'Koramangala', 'North Indian, European, Mediterranean', 'Casual Dining', 4.7, 12450, 1500),
('Truffles', 'Koramangala', 'American, Burger, Cafe', 'Cafe', 4.6, 14200, 900),
('Toit', 'Indiranagar', 'Italian, American, Pizza', 'Microbrewery', 4.8, 18500, 2000),
('Echoes', 'Koramangala', 'Cafe, Continental, Italian', 'Cafe', 4.7, 4500, 750),
('Glen''s Bakehouse', 'Indiranagar', 'Bakery, Desserts, Cafe', 'Cafe', 4.4, 6200, 600),
('Corner House Ice Creams', 'Koramangala', 'Desserts, Ice Cream', 'Dessert Parlor', 4.6, 3800, 400),
('Sly Granny', 'Indiranagar', 'European, Continental', 'Casual Dining', 4.3, 2100, 2500),
('Kota Kachori', 'Koramangala', 'North Indian, Street Food, Mithai', 'Quick Bites', 4.1, 8900, 250),
('Empire Restaurant', 'Indiranagar', 'North Indian, Mughlai, Kebab', 'Casual Dining', 2.9, 1200, 800),
('Leon Grill', 'Koramangala', 'Burger, Fast Food', 'Quick Bites', 2.8, 450, 500),
('Meghana Foods', 'Indiranagar', 'Biryani, Andhra, North Indian', 'Casual Dining', 4.5, 9800, 700),
('Smoke House Deli', 'Indiranagar', 'European, Italian, Salad', 'Casual Dining', 4.2, 1900, 1600),
('A2B - Adyar Ananda Bhavan', 'Koramangala', 'South Indian, Mithai', 'Quick Bites', 3.9, 1100, 400),
('Phobidden Fruit', 'Indiranagar', 'Vietnamese, Asian', 'Casual Dining', 4.4, 3100, 1200);


#TASK-1: Top 5 Highest-Rated Restaurants in Koramangala

select name, avg_rating, votes 
from zomato_bangalore 
where location = 'Koramangala' 
order by avg_rating desc, votes desc 
limit 5;

#TASK-2: Unique Cuisines Available in Indiranagar with Counts

select cuisine as unique_cuisine_combination, COUNT(*) as restaurant_count 
from zomato_bangalore 
where location = 'Indiranagar' 
group by cuisine 
order by restaurant_count desc;

#TASK-3: Average Cost for Two by Restaurant Type

select restaurant_type, AVG(approx_cost_two) AS average_cost_for_two 
from zomato_bangalore 
group by restaurant_type 
order by average_cost_for_two desc;

#TASK-4: High Engagement (> 200 Votes) with Sub-3.0 Ratings

select name, location, avg_rating, votes, approx_cost_two 
from zomato_bangalore 
where avg_rating < 3.0 and votes > 200;

#TASK-5: Use ChatGPT to generate an SQL query that segments restaurants into three market categories: 'Budget' (cost for two < 500), 'Mid-range' (500-1500), and 'Premium' (>1500). Test and run the query on your dataset, and paste the working query in your submission.



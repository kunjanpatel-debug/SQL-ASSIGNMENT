
drop view if exists dailyordersummary;
drop view if exists topratedrestaurants;
drop table if exists food_orders;
drop table if exists reviews;
drop table if exists restaurants;

create table restaurants (
    restaurant_id int auto_increment primary key,
    name varchar(100),
    city varchar(50)
);

create table reviews (
    review_id int auto_increment primary key,
    restaurant_id int,
    rating decimal(2,1)
);

create table food_orders (
    order_id int auto_increment primary key,
    order_date date,
    amount decimal(10,2)
);

insert into restaurants (name, city) values 
('spice route', 'vadodara'), ('sankalp', 'ahmedabad'), ('good vibes cafe', 'vadodara');

insert into reviews (restaurant_id, rating) values 
(1, 4.5), (1, 4.7), (2, 3.8), (3, 4.2), (3, 4.0);

insert into food_orders (order_date, amount) values 
(curdate(), 250.00), 
(date_sub(curdate(), interval 5 day), 450.00),
(date_sub(curdate(), interval 45 day), 800.00);


#task 1: create a sql view named topratedrestaurants showing aggregate review details above 4.0 rating

create view topratedrestaurants as
select r.name, avg(rev.rating) as avg_rating, count(rev.review_id) as total_reviews
from restaurants r
inner join reviews rev on r.restaurant_id = rev.restaurant_id
group by r.name
having avg(rev.rating) > 4.0;

select * from topratedrestaurants;


#task 2: update the topratedrestaurants view to also include the city column by joining the tables

create or replace view topratedrestaurants as
select r.name, r.city, avg(rev.rating) as avg_rating, count(rev.review_id) as total_reviews
from restaurants r
inner join reviews rev on r.restaurant_id = rev.restaurant_id
group by r.name, r.city
having avg(rev.rating) > 4.0;

select * from topratedrestaurants;


#task 3: try to update the average rating column directly through the view and observe limitation
#running the update statement below directly will throw an error in mysql workbench:
#error code: 1288. the target table topratedrestaurants of the update is not updatable
#reason: views that contain aggregate functions (like avg or count) or group by clauses cannot be updated because sql cannot trace back how to modify individual raw rows from an aggregated sum.
#update topratedrestaurants set avg_rating = 4.9 where name = 'spice route';


#task 4: create a view called dailyordersummary showing data from the last 30 days only

create view dailyordersummary as
select order_date, count(order_id) as total_food_orders, sum(amount) as total_revenue
from food_orders
where order_date >= date_sub(curdate(), interval 30 day)
group by order_date;

select * from dailyordersummary;


#task 5: list 3 good practices when creating sql views for analytics dashboards with flipkart examples

#1. name calculated fields explicitly using aliases to prevent dashboard breaking points.
   #example: select sum(order_amount) as total_monthly_sales from flipkart_sales;
   
#2. restrict underlying column output strictly to needed layout variables to optimize query speeds.
   #example: select order_id, total_amount from flipkart_orders instead of using select *;
   
#3. pre-filter extreme historic archives directly inside the view to minimize dashboard compute overhead.
   # example: select * from flipkart_shipments where order_year = 2026;
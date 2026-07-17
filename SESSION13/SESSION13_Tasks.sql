
drop table if exists movieratings;
drop table if exists playlist;
drop table if exists orders;

create table orders (
    order_id int auto_increment primary key,
    user_id int,
    order_amount decimal(10,2),
    app_name varchar(50)
);

create table playlist (
    song_id int auto_increment primary key,
    user_id int,
    duration_sec int
);

create table movieratings (
    rating_id int auto_increment primary key,
    user_id int,
    movie_name varchar(100),
    rating decimal(2,1)
);

insert into orders (user_id, order_amount, app_name) values 
(101, 250.00, 'zomato'),
(102, 450.00, 'swiggy'),
(101, 1200.00, 'flipkart'),
(103, 300.00, 'zomato'),
(102, 150.00, 'zomato'),
(104, 2500.00, 'flipkart'),
(101, 350.00, 'swiggy'),
(103, 180.00, 'swiggy'),
(105, 999.00, 'flipkart'),
(102, 400.00, 'zomato');

insert into playlist (user_id, duration_sec) values 
(201, 240), (201, 180), (201, 300),
(202, 210), (202, 190),
(203, 150);

insert into movieratings (user_id, movie_name, rating) values 
(301, 'inception', 5.0), (302, 'inception', 4.0),
(301, 'the dark knight', 4.5), (303, 'the dark knight', 4.5),
(302, 'interstellar', 3.0), (304, 'interstellar', 5.0);


#task 1: display order amount along with the total order amount across all records using over()

select order_id, user_id, order_amount, app_name,
       sum(order_amount) over() as total_overall_amount
from orders;

#task 2: show individual order details alongside the per-user average using partition by

select order_id, user_id, order_amount,
       avg(order_amount) over(partition by user_id) as user_average_amount
from orders;

#task 3: display song details with running or total duration added per user

select song_id, user_id, duration_sec,
       sum(duration_sec) over(partition by user_id) as user_total_duration
from playlist;

#task 4: show individual ratings, movie averages, and the difference between them

select rating_id, user_id, movie_name, rating,
       avg(rating) over(partition by movie_name) as movie_average_rating,
       (rating - avg(rating) over(partition by movie_name)) as rating_difference
from movieratings;
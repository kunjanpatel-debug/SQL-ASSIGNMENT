drop table if exists myntra_orders;
drop table if exists paytm_transactions;
drop table if exists bookmyshow_reviews;
drop table if exists spotify_playlists;
drop table if exists food_orders;

create table food_orders (
    order_id int auto_increment primary key,
    user_id int,
    amount decimal(10,2)
);

create table spotify_playlists (
    playlist_id int,
    user_id int,
    song_id int
);

create table bookmyshow_reviews (
    review_id int auto_increment primary key,
    movie_id int,
    rating decimal(3,2)
);

create table paytm_transactions (
    txn_id int auto_increment primary key,
    user_id int,
    amount decimal(10,2)
);

create table myntra_orders (
    order_id int auto_increment primary key,
    user_id int,
    total_price decimal(10,2)
);

insert into food_orders (user_id, amount) values (101, 250.00), (102, 450.50), (101, 120.00);
insert into spotify_playlists (playlist_id, user_id, song_id) values (1, 501, 9001), (1, 501, 9002), (2, 502, 9005);
insert into bookmyshow_reviews (movie_id, rating) values (201, 4.25), (201, 4.80), (201, 3.50);
insert into paytm_transactions (user_id, amount) values (301, 50.00), (301, 2500.00), (301, 120.50);
insert into myntra_orders (user_id, total_price) values (701, 1599.00), (701, 899.00), (702, 2499.00);


# task 1: calculate the total amount spent by users on food orders

select sum(amount) as total_amount_spent from food_orders;

#task 2: find out how many songs a user has added to their playlist

select count(song_id) as total_songs from spotify_playlists;

#task 3: get the average rating given to a movie rounded to 1 decimal place

select round(avg(rating), 1) as average_rating from bookmyshow_reviews;

#task 4: find the minimum and maximum transaction values for a use

select min(amount) as smallest_transaction, max(amount) as largest_transaction 
from paytm_transactions;

#task 5: display total orders, average order value, and highest order value per user_id

select user_id, 
       count(order_id) as total_orders, 
       round(avg(total_price), 2) as average_order_value, 
       max(total_price) as highest_order_value
from myntra_orders
group by user_id;
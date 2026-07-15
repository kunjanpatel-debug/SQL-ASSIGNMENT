
drop table if exists playlist;
drop table if exists movies;
drop table if exists transactions;
drop table if exists food_orders;

create table food_orders (
    order_id int auto_increment primary key,
    user_id int,
    amount decimal(10,2)
);

create table transactions (
    transaction_id int auto_increment primary key,
    user_id int,
    amount decimal(10,2),
    payment_method varchar(50)
);

create table movies (
    movie_id int auto_increment primary key,
    genre varchar(50),
    box_office_collection decimal(15,2)
);

create table playlist (
    playlist_id int,
    user_id int,
    song_id int,
    duration int
);

insert into food_orders (user_id, amount) values (1, 150.00), (2, 320.00), (1, 210.00);
insert into transactions (user_id, amount, payment_method) values (10, 500.00, 'upi'), (20, 1500.00, 'credit card'), (30, 350.00, 'upi');
insert into movies (genre, box_office_collection) values ('action', 150000000.00), ('comedy', 40000000.00), ('action', 80000000.00);
insert into playlist (playlist_id, user_id, song_id, duration) values (101, 55, 91, 4000), (101, 55, 92, 4500), (102, 66, 93, 3000);


#task 1: display the total number of orders placed by each user grouped by user_id
select user_id, count(order_id) as total_orders 
from food_orders
group by user_id;

#task 2: show the total amount spent by each payment_method
select payment_method, sum(amount) as total_amount_spent 
from transactions
group by payment_method;

#task 3: display each genre and total collection, showing only genres above 10 crore (100,000,000)
select genre, sum(box_office_collection) as total_collection 
from movies
group by genre
having sum(box_office_collection) > 100000000;

#task 4: find users who have playlists with a combined song duration of more than 2 hours (7200 seconds)
select user_id, sum(duration) as total_duration 
from playlist
group by user_id
having sum(duration) > 7200;
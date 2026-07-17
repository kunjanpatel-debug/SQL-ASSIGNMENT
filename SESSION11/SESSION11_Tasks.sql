
drop table if exists playlists;
drop table if exists users;
drop table if exists orders;
drop table if exists products;
drop table if exists restaurants;

create table restaurants (
    restaurant_id int auto_increment primary key,
    name varchar(100),
    rating decimal(2,1)
);

create table products (
    product_id int auto_increment primary key,
    name varchar(100),
    price decimal(10,2),
    category varchar(50)
);

create table users (
    user_id int auto_increment primary key,
    username varchar(100)
);

create table playlists (
    playlist_id int auto_increment primary key,
    user_id int,
    playlist_name varchar(100)
);

create table orders (
    order_id int auto_increment primary key,
    user_id int,
    total_amount decimal(10,2)
);

insert into restaurants (name, rating) values 
('spice route', 4.5), ('sankalp', 4.2), ('good vibes cafe', 4.8), ('express diner', 3.9);

insert into products (name, price, category) values 
('laptop', 45000.00, 'electronics'), ('mouse', 500.00, 'electronics'),
('t-shirt', 699.00, 'clothing'), ('jeans', 1499.00, 'clothing');

insert into users (username) values ('amit'), ('rahul'), ('sneha');

insert into playlists (user_id, playlist_name) values 
(1, 'hits'), (1, 'retro'), (1, 'chill'), 
(2, 'workout'), 
(3, 'party'), (3, 'lo-fi');

insert into orders (user_id, total_amount) values 
(1, 150.00), (1, 600.00), (2, 450.00), (3, 200.00);


#task 1: display names and ratings higher than the total average rating

select name, rating 
from restaurants 
where rating > (select avg(rating) from restaurants);

#task 2: list product name along with its category average price using a scalar subquery

select name, 
       price, 
       category,
       (select avg(price) from products p2 where p2.category = p1.category) as category_avg_price
from products p1;

#task 3: use a subquery in the from clause to show users with above-average playlist counts

select user_counts.username, user_counts.playlist_count
from (
    select u.username, u.user_id, count(p.playlist_id) as playlist_count
    from users u
    left join playlists p on u.user_id = p.user_id
    group by u.username, u.user_id
) as user_counts
where user_counts.playlist_count > (
    select avg(summary.playlist_count) 
    from (
        select count(playlist_id) as playlist_count 
        from playlists 
        group by user_id
    ) as summary
);

#task 4: find all user_ids who have placed at least one order greater than the average order amount

select distinct user_id 
from orders 
where total_amount > (select avg(total_amount) from orders);
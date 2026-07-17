
drop table if exists influencers;
drop table if exists movies;
drop table if exists songs;
drop table if exists orders;

create table orders (
    order_id int auto_increment primary key,
    user_id int,
    order_date date,
    total_amount decimal(10,2)
);

create table songs (
    song_id int auto_increment primary key,
    artist varchar(100),
    streams int
);

create table movies (
    movie_id int auto_increment primary key,
    genre varchar(50),
    rating decimal(2,1)
);

create table influencers (
    id int auto_increment primary key,
    platform varchar(50),
    followers int
);

insert into orders (user_id, order_date, total_amount) values 
(101, '2026-07-10', 250.00), (101, '2026-07-15', 450.00), (101, '2026-07-12', 120.00),
(102, '2026-07-11', 300.00), (102, '2026-07-14', 600.00);

insert into songs (artist, streams) values 
('arijit singh', 500000), ('arijit singh', 600000), ('arijit singh', 400000),
('ar rahman', 700000), ('ar rahman', 700000), ('ar rahman', 300000);

insert into movies (genre, rating) values 
('action', 4.5), ('action', 4.5), ('action', 4.0),
('sci-fi', 4.8), ('sci-fi', 4.2);

insert into influencers (platform, followers) values 
('instagram', 150000), ('instagram', 90000), ('instagram', 200000), ('instagram', 50000),
('youtube', 300000), ('youtube', 400000);


#task 1: sequential ordering number to each order per user sorted by date descending

select order_id, user_id, order_date, total_amount,
       row_number() over(partition by user_id order by order_date desc) as order_sequence
from orders;

#task 2: rank each song based on streams within each artist using rank()

select song_id, artist, streams,
       rank() over(partition by artist order by streams desc) as stream_rank
from songs;

#task 3: rank movies within their genre based on rating using dense_rank()

select movie_id, genre, rating,
       dense_rank() over(partition by genre order by rating desc) as rating_dense_rank
from movies;

#task 4: filter for the top 3 influencers per platform using row_number() inside a cte

with rankedinfluencers as (
    select id, platform, followers,
           row_number() over(partition by platform order by followers desc) as ranking_num
    from influencers
)
select id, platform, followers, ranking_num 
from rankedinfluencers
where ranking_num <= 3;
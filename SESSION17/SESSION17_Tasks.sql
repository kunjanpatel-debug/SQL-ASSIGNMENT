
drop table if exists spotifytracks;
drop table if exists flipkartproducts;
drop table if exists movies;
drop table if exists foodorders;

create table foodorders (
    order_id int auto_increment primary key,
    total_amount decimal(10,2)
);

create table movies (
    movie_id int auto_increment primary key,
    movie_name varchar(100),
    rating decimal(3,1)
);

create table flipkartproducts (
    product_id int auto_increment primary key,
    product_name varchar(100),
    price decimal(10,2)
);

create table spotifytracks (
    track_id int auto_increment primary key,
    track_name varchar(100),
    duration_sec int
);

insert into foodorders (total_amount) values (150.00), (450.00), (1200.00), (300.00);
insert into movies (movie_name, rating) values ('inception', 8.8), ('avatar', 7.8), ('low tier movie', 4.2);
insert into flipkartproducts (product_name, price) values ('earphones', 399.00), ('t-shirt', 799.00), ('smartphone', 25000.00);
insert into spotifytracks (track_name, duration_sec) values ('song a', 150), ('song b', 240), ('song c', 320);


#task 1: classify orders as small, medium, or large based on total_amount

select order_id, total_amount,
       case 
           when total_amount < 300 then 'small'
           when total_amount between 300 and 999 then 'medium'
           when total_amount >= 1000 then 'large'
       end as order_size
from foodorders;

#task 2: add popularity column showing blockbuster, hit, or average based on movie ratings

select movie_id, movie_name, rating,
       case 
           when rating >= 8 then 'blockbuster'
           when rating between 5 and 7.9 then 'hit'
           else 'average'
       end as popularity
from movies;

#task 3: bin product prices into budget, standard, or premium categories

select product_id, product_name, price,
       case 
           when price < 500 then 'budget'
           when price between 500 and 2000 then 'standard'
           when price > 2000 then 'premium'
       end as price_category
from flipkartproducts;

#task 4: assign duration labels to spotify tracks based on time ranges

select track_id, track_name, duration_sec,
       case 
           when duration_sec < 180 then 'short'
           when duration_sec between 180 and 300 then 'medium'
           when duration_sec > 300 then 'long'
       end as duration_label
from spotifytracks;
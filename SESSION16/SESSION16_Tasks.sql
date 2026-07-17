
drop table if exists products;
drop table if exists movies;
drop table if exists food_items;
drop table if exists playlists;
drop table if exists users;

create table users (
    user_id int auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50)
);

create table playlists (
    playlist_id int auto_increment primary key,
    song_title varchar(150)
);

create table food_items (
    item_id int auto_increment primary key,
    item_code varchar(50)
);

create table movies (
    movie_id int auto_increment primary key,
    imdb_id varchar(50)
);

create table products (
    product_id int auto_increment primary key,
    sku_code varchar(50)
);

insert into users (first_name, last_name) values ('amit', 'patel'), ('sneha', 'joshi');
insert into playlists (song_title) values ('kesariya'), ('tu hi re');
insert into food_items (item_code) values ('  burg01  '), ('pizza02  '), ('  taco03');
insert into movies (imdb_id) values ('tt1234567'), ('tt7654321');
insert into products (sku_code) values ('mob-123-xy'), ('lap-456-ab');


#task 1: combine first_name and last_name into a single full_name column using concat

select concat(first_name, ' ', last_name) as full_name 
from users;

#task 2: display all song titles in uppercase using the upper function

select upper(song_title) as uppercase_song_title 
from playlists;

#task 3: select item_code values after removing all leading and trailing spaces using trim

select trim(item_code) as cleaned_item_code 
from food_items;

#task 4: extract just the numeric part (the last 7 characters) using right

select right(imdb_id, 7) as movie_number 
from movies;

#task 5: replace all dashes '-' with underscores '_' in sku_code using the replace function

select replace(sku_code, '-', '_') as updated_sku_code 
from products;
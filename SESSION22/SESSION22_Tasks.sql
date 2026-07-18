
drop table if exists topratedrestaurants; -- from session 21
drop table if exists movies;
drop table if exists orders;
drop table if exists ipl_matches_s22;

create table topratedrestaurants (
    restaurant_id int auto_increment primary key,
    name varchar(100),
    cuisine varchar(100),
    rating decimal(2,1)
);
insert into topratedrestaurants (name, cuisine, rating) values 
('balaji dhosa', 'south indian', 4.5),
('swad restaurant', 'gujarati', 3.8),
('honest restaurant', 'punjabi', 4.2),
('mcdonalds', 'fast food', 4.1),
('china town', 'chinese', 3.9);

create table movies (
    movie_id int auto_increment primary key,
    title varchar(100),
    rating decimal(3,1)
);
insert into movies (title, rating) values 
('inception', 8.8),
('the dark knight', 9.0),
('interstellar', 8.6),
('bol bachchan', 5.6),
('dangal', 8.4);

create table orders (
    order_id int auto_increment primary key,
    user_id int,
    user_name varchar(100),
    item_name varchar(100)
);
insert into orders (user_id, user_name, item_name) values 
(101, 'kunjan', 'paneer tikka'), (101, 'kunjan', 'butter naan'), 
(101, 'kunjan', 'paneer tikka'), (101, 'kunjan', 'jeera rice'),
(101, 'kunjan', 'dal fry'),     (101, 'kunjan', 'paneer tikka'),
(102, 'dhruv', 'masala dhosa'),  (102, 'dhruv', 'masala dhosa'),
(103, 'amit', 'veg burger'),    (103, 'amit', 'fries');

create table ipl_matches_s22 (
    match_id int auto_increment primary key,
    team_name varchar(100)
);
insert into ipl_matches_s22 (team_name) values 
('mumbai indians'), ('mumbai indians'), ('chennai super kings'),
('gujarat titans'), ('mumbai indians'), ('chennai super kings'),
('gujarat titans'), ('gujarat titans'), ('mumbai indians');
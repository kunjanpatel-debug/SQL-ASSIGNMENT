drop view if exists topratedrestaurants;
drop table if exists topratedrestaurants;

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
('china town', 'chinese', 3.9),
('sankalp', 'south indian', 4.6),
('noodle bar', 'chinese', 4.3),
('sayaji pavilion', 'north indian', 4.7),
('rajwadi thali', 'gujarati', 3.5);

select * from topratedrestaurants;
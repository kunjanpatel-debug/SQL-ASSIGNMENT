
drop table if exists iplmatches;
drop table if exists zomatorestaurants;
drop table if exists flipkartorders;
drop table if exists spotifyartists;

create table spotifyartists (
    artist_id int auto_increment primary key,
    name varchar(100),
    followers int
);

create table flipkartorders (
    order_id int auto_increment primary key,
    user_id int,
    order_date date,
    total_amount decimal(10,2)
);

create table zomatorestaurants (
    id int auto_increment primary key,
    name varchar(100),
    city varchar(50),
    rating decimal(2,1)
);

create table iplmatches (
    match_id int auto_increment primary key,
    team varchar(100),
    runs int,
    match_year int
);

insert into spotifyartists (name, followers) values 
('arijit singh', 500000), ('ar rahman', 400000), ('diljit dosanjh', 300000), ('atif aslam', 200000);

insert into flipkartorders (user_id, order_date, total_amount) values 
(1, '2023-01-15', 1500.00), (2, '2023-01-20', 2500.00),
(1, '2023-02-10', 5000.00), (3, '2023-03-05', 1200.00);

insert into zomatorestaurants (name, city, rating) values 
('spice route', 'vadodara', 4.5), ('sankalp', 'ahmedabad', 3.8), 
('good vibes cafe', 'vadodara', 4.1), ('express diner', 'ahmedabad', 3.9);

insert into iplmatches (team, runs, match_year) values 
('gujarat titans', 1200, 2023), ('gujarat titans', 900, 2023),
('mumbai indians', 1500, 2023), ('rcb', 800, 2023);


#task 1: common table expression selecting top 3 most-followed artists

with topartists as (
    select artist_id, name, followers 
    from spotifyartists 
    order by followers desc 
    limit 3
)
select * from topartists;

#task 2: calculate monthly sales totals for 2023 and pick the highest sales month

with monthlytotals as (
    select date_format(order_date, '%m') as sales_month, sum(total_amount) as total_sales
    from flipkartorders
    where date_format(order_date, '%Y') = '2023'
    group by date_format(order_date, '%m')
)
select sales_month, total_sales 
from monthlytotals 
order by total_sales desc 
limit 1;

#task 3: recursive cte generating a list of dates for the next 7 days starting from today

with recursive calendardays (day_date, counter) as (
    select curdate(), 1
    union all
    select date_add(day_date, interval 1 day), counter + 1 
    from calendardays 
    where counter < 7
)
select day_date from calendardays;

#task 4: find average rating per city, then select restaurants from cities with average rating above 4.0

with cityaverages as (
    select city, avg(rating) as avg_rating
    from zomatorestaurants
    group by city
)
select z.id, z.name, z.city, z.rating 
from zomatorestaurants z
inner join cityaverages c on z.city = c.city
where c.avg_rating > 4.0;

-- task 5: calculate total runs scored by each team in 2023 and filter for teams with more than 2000 runs
-- comment: the ai structural framework optimized the aggregation filter step using standard cte output structuring.
with teamrunsummary as (
    select team, sum(runs) as total_runs
    from iplmatches
    where match_year = 2023
    group by team
)
select team, total_runs 
from teamrunsummary
where total_runs > 2000;
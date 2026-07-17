
drop table if exists applogins;
drop table if exists subscriptions;
drop table if exists deliveries;
drop table if exists orders;

create table orders (
    order_id int auto_increment primary key,
    order_date date
);

create table deliveries (
    delivery_id int auto_increment primary key,
    delivery_date date
);

create table subscriptions (
    user_id int auto_increment primary key,
    start_date date,
    end_date date
);

create table applogins (
    user_id int auto_increment primary key,
    last_login_date date
);

insert into orders (order_date) values ('2026-07-15'), ('2026-07-16'), ('2026-07-17');
insert into deliveries (delivery_date) values ('2026-07-20'), ('2026-07-22'), ('2026-07-25');
insert into subscriptions (start_date, end_date) values ('2026-01-01', '2026-01-31'), ('2026-05-01', '2026-08-01');
insert into applogins (last_login_date) values ('2026-07-10'), ('2026-05-15'), ('2026-06-01');


#task 1: display the current date and time as 'currentdatetime'

select now() as currentdatetime;

#task 2: extract year, month, and day as separate columns from order_date

select order_date, 
       year(order_date) as order_year, 
       month(order_date) as order_month, 
       day(order_date) as order_day
from orders;

#task 3: calculate expected_pickup_date which is 2 days before delivery_date

select delivery_date, 
       date_sub(delivery_date, interval 2 day) as expected_pickup_date
from deliveries;

#task 4: display subscription details along with the total number of days

select user_id, start_date, end_date, 
       datediff(end_date, start_date) as total_subscription_days
from subscriptions;

#task 5: find users who haven't logged in for more than 30 days from today

select user_id, last_login_date
from applogins
where datediff(now(), last_login_date) > 30;
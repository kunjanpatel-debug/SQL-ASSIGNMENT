
drop table if exists orders;
drop table if exists users;
drop table if exists customersegments;

create table customersegments (
    segment_id int auto_increment primary key,
    segment_name varchar(50)
);

create table users (
    user_id int auto_increment primary key,
    username varchar(100),
    city varchar(100),
    segment_id int,
    foreign key (segment_id) references customersegments(segment_id)
);

create table orders (
    order_id int auto_increment primary key,
    user_id int,
    product varchar(100),
    amount decimal(10,2)
);

insert into customersegments (segment_name) values ('premium'), ('regular');

insert into users (username, city, segment_id) values 
('amit_patel', 'vadodara', 1),
('sneha_j', 'ahmedabad', 2),
('raj_sharma', 'surat', null);

insert into orders (user_id, product, amount) values 
(1, 'laptop', 55000.00),
(1, 'mouse', 500.00),
(2, 'backpack', 1200.00),
(99, 'orphan product', 450.00);

#task 2: inner join to list usernames and ordered products (only users with orders)

select u.username, o.product 
from users u
inner join orders o on u.user_id = o.user_id;

#task 3: left join to display all usernames along with their ordered products (showing null for no orders)
select u.username, o.product 
from users u
left join orders o on u.user_id = o.user_id;

#task 4: right join to show all orders and corresponding username (null if user_id doesn't match)
select u.username, o.order_id, o.product, o.amount 
from users u
right join orders o on u.user_id = o.user_id;

#task 5: zomato-style breakdown showing username, segment name, and total order amount
select u.username, cs.segment_name, sum(o.amount) as total_order_amount 
from users u
inner join customersegments cs on u.segment_id = cs.segment_id
inner join orders o on u.user_id = o.user_id
group by u.username, cs.segment_name;
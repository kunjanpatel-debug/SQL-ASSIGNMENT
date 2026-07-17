
drop table if exists apporders;
drop table if exists instoreorders;

#task 1: create apporders and instoreorders tables and insert sample records

create table apporders (
    order_id int auto_increment primary key,
    customer_name varchar(100),
    amount decimal(10,2),
    order_date date
);

create table instoreorders (
    order_id int auto_increment primary key,
    customer_name varchar(100),
    amount decimal(10,2),
    order_date date
);

insert into apporders (customer_name, amount, order_date) values 
('amit', 450.00, '2026-07-15'),
('rahul', 250.00, '2026-07-16'),
('sneha', 600.00, '2026-07-17');

insert into instoreorders (customer_name, amount, order_date) values 
('amit', 180.00, '2026-07-15'),
('pooja', 320.00, '2026-07-16'),
('vikram', 150.00, '2026-07-17');


#task 2: combine all unique customer names from both tables using union
select customer_name from apporders
union
select customer_name from instoreorders;

#task 3: display every order from both tables using union all

select order_id, customer_name, amount, order_date from apporders
union all
select order_id, customer_name, amount, order_date from instoreorders;

#task 4: demonstrate the difference between union and union all

select customer_name from apporders
union
select customer_name from instoreorders;

select customer_name from apporders
union all
select customer_name from instoreorders;
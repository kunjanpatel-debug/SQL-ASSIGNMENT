
drop table if exists products;
drop table if exists orders;

create table orders (
    order_id int auto_increment primary key,
    user_id int,
    amount decimal(10,2),
    order_date date
);

create table products (
    product_id int auto_increment primary key,
    product_name varchar(100),
    category varchar(50),
    price decimal(10,2)
);

drop procedure if exists load_test_data;
delimiter $$
create procedure load_test_data()
begin
    declare i int default 1;
    start transaction;
    while i <= 10000 do
        insert into orders (user_id, amount, order_date) 
        values (floor(1 + rand() * 500), round(100 + rand() * 5000, 2), curdate());
        set i = i + 1;
    end while;
    commit;
end$$
delimiter ;

call load_test_data();

insert into products (product_name, category, price) values 
('laptop', 'electronics', 45000.00),
('mouse', 'electronics', 500.00),
('t-shirt', 'clothing', 699.00),
('jeans', 'clothing', 1499.00);


#task 2: run select query before indexing and note execution time in the action output tab
#time taken under the 'duration' column = 0.000 sec / 0.000 sec.

select * from orders 
where user_id = 125;


#task 3 (part 1): analyze the query run plan before adding the index
#observation: the 'type' column will show 'all', indicating a slow full table scan.

explain select * from orders 
where user_id = 125;


#task 2: create an index on the user_id column and re-run the exact same query

create index idx_user_id on orders(user_id); #duration_time = 0.079 sec

#re-run query to measure the optimized timeline execution drop
select * from orders 
where user_id = 125;


#task 3 (part 2): re-analyze with explain plan after indexing
#observation: the 'type' column changes from 'all' to 'ref'. 
#the 'possible_keys' and 'key' columns will now show 'idx_user_id', proving it bypasses a full scan.

explain select * from orders 
where user_id = 125;


#task 4: create an index on category to prevent full table scans when fetching specific items

create index idx_product_category on products(category);

#run query utilizing the index

select * from products 
where category = 'electronics';


#task 5: additional query optimization strategy when indexes fail

#explanation: when an index doesn't speed up a heavy table, a highly effective technique is database partitioning.

#partition by range or hash breaks one massive table into separate physical chunks on the disk behind the scenes.

#how to apply it: we reconstruct the table structure to split rows automatically based on the order_date year.
#this forces the optimizer to perform 'partition pruning'—completely ignoring years that don't match the query filter.

create database marketco;

use marketco;

#1) Statement to create the Contact table
create table contact (
contact_id int primary key,
company_ID int, 
first_name varchar(45),
last_name varchar(45), 
street varchar(45), 
city varchar(45), 
state varchar(2), 
zip varchar(10), 
isMain boolean, 
email varchar(45), 
phone varchar(12));

insert into contact (contact_id, company_ID, first_name, last_name, street, city, state, zip, isMain, email, phone) values 

(1, 201, 'Ravi', 'Patel', '101 Ring Road', 'Ahmedabad', 'GJ', '380001', 1, 'ravi.patel@example.com', '9876543210'),
(2, 202, 'Sneha', 'Shah', '202 Civil Line', 'Surat', 'GJ', '395003', 0, 'sneha.shah@example.com', '9876543211'),
(3, 203, 'Karan', 'Mehta', '303 University Rd', 'Vadodara', 'GJ', '390001', 1, 'karan.mehta@example.com', '9876543212'),
(4, 204, 'Nidhi', 'Desai', '404 Market Street', 'Rajkot', 'GJ', '360001', 0, 'nidhi.desai@example.com', '9876543213'),
(5, 205, 'Jignesh', 'Trivedi', '505 Station Rd', 'Bhavnagar', 'GJ', '364001', 0, 'jignesh.trivedi@example.com', '9876543214'),
(6, 206, 'Pooja', 'Joshi', '606 Garden St', 'Gandhinagar', 'GJ', '382010', 1, 'pooja.joshi@example.com', '9876543215');

select * from contact

#2) Statement to create the Employee table
create table employee (
employee_id int primary key,
frist_name varchar(45), 
last_name varchar(45), 
salary decimal(12,2), 
hire_date date, 
job_title varchar(25), 
email varchar(45), 
phone varchar(12));

insert into employee (employee_id,frist_name,last_name,salary,hire_date,job_title,email,phone) values

(101, 'Ravi', 'Patel', 50000.00, '2023-04-15', 'Accountant', 'ravi.patel@example.com', '9876543210'),
(102, 'Nisha', 'Desai', 55000.00, '2022-11-20', 'HR Manager', 'nisha.desai@example.com', '9876501234'),
(103, 'Amit', 'Joshi', 60000.00, '2021-07-10', 'Software Engineer', 'amit.joshi@example.com', '9823456789'),
(104, 'Meena', 'Trivedi', 52000.00, '2023-01-05', 'Marketing Executive', 'meena.trivedi@example.com', '9812345678'),
(105, 'Kiran', 'Bhatt', 58000.00, '2022-03-25', 'Operations Manager', 'kiran.bhatt@example.com', '9900123456');

select * from  employee

#3) Statement to create the ContactEmployee table 
create table ContactEmployee (
contactemployeeID int primary key,
contactID int,
employeeID int, 
contcatDate date, 
description varchar(100));

insert into  ContactEmployee (contactemployeeID, contactID, employeeID, contcatDate, description) values

(101, 201, 301, '2023-05-12', 'Ahmedabad project'),
(102, 202, 302, '2023-06-15', 'Surat event'),
(103, 203, 303, '2023-07-10', 'Vadodara seminar'),
(104, 204, 304, '2023-08-20', 'Rajkot meeting'),
(105, 205, 305, '2023-09-25', 'Bhavnagar campaign'),
(106, 206, 306, '2023-10-30', 'Jamnagar presentation');

select * from ContactEmployee

#4) In the Employee table, the statement that changes Lesley Bland’s phone number
to 215-555-8800
select * from employee
UPDATE employee
SET job_title = 'Chartered Accountant'
WHERE employee_id = 101;

#5) In the Company table, the statement that changes the name of “Urban
#Outfitters, Inc.” to “Urban Outfitters” . 

select * from employee
update employee 
set job_title = 'tally_account'
where employee_id = 101


#6) In ContactEmployee table, the statement that removes Dianne Connor’s contact
#event with Jack Lee (one statement).
select * from contactemployee
delete  from contactemployee
where contactID = '201' 
and employeeID = '301';

#7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). Run the SQL SELECT query in
#MySQL Workbench. Copy the results below as well.
select * from employee



#8) What is the significance of “%” and “_” operators in the LIKE statement?
select * from employee
where email like '%.com'

select * from employee
where last_name like 'p___l'


#9) Explain normalization in the context of databases.
-- normalization is the process of organizaing data in a database to reduse duplication and improve and 
-- consitency by dlividing data into related tables using primary and forgienkey.


#10) What does a join in MySQL mean?
1)inner join = Returns only matching rows from both tables
2)left join = Returns all rows from the left table and matching rows from the right if no match null are returned.
3)right join = Returns all rows from the right table, and matching rows from the left.
4)full join = Returns all rows when there is a match in one of the tables. You can simulate it using
5)cross join = 	Returns Cartesian product of both tables (every row in table A with every row in table B).

#11) 19.What do you understand about DDL, DCL, and DML in MySQL?
DDL = data definition language (create,alter,drop and other database structurs.) 
DMl = data manipulation language (select,insert,update and delete)
DCL = data control language (grant,revoke)

#12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
1)inner join
2)left join 
3)right join
4)full join 
5)cross join 


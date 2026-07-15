
drop table if exists employees;
drop table if exists offers;
drop table if exists users;
drop table if exists playlists;
drop table if exists brands;
drop table if exists influencers;

create table influencers (
    id int auto_increment primary key,
    influencer_name varchar(100),
    city varchar(50)
);

create table brands (
    id int auto_increment primary key,
    brand_name varchar(100),
    city varchar(50)
);

create table playlists (
    id int primary key,
    playlist_name varchar(100),
    parent_playlist_id int
);

create table users (
    id int auto_increment primary key,
    user_name varchar(100),
    city varchar(50)
);

create table offers (
    id int auto_increment primary key,
    offer_title varchar(100)
);

create table employees (
    id int primary key,
    name varchar(100),
    manager_id int
);

insert into influencers (influencer_name, city) values ('kunal', 'vadodara'), ('priya', 'mumbai'), ('rohan', 'surat');
insert into brands (brand_name, city) values ('brand x', 'vadodara'), ('brand y', 'delhi'), ('brand z', 'surat');
insert into playlists values (1, 'top hits', null), (2, 'bollywood mashup', 1), (3, 'lo-fi chill', null), (4, '90s romantic', 3);
insert into users (user_name, city) values ('krunal', 'vadodara'), ('niyati', 'ahmedabad'), ('vraj', 'vadodara');
insert into offers (offer_title) values ('50% off electronics'), ('buy 1 get 1 clothing');
insert into employees values (1, 'aravind', null), (2, 'bhavna', 1), (3, 'chirag', 1), (4, 'divya', 2);


#task 1: full outer join simulation using left join, right join, and union

select i.influencer_name, b.brand_name, i.city
from influencers i
left join brands b on i.city = b.city
union
select i.influencer_name, b.brand_name, b.city
from influencers i
right join brands b on i.city = b.city;

#task 2: self join to display each playlist alongside its parent playlist's name

select p1.playlist_name as 'playlist', p2.playlist_name as 'parent playlist'
from playlists p1
left join playlists p2 on p1.parent_playlist_id = p2.id;

#task 3: cross join query to generate all possible combinations of users and offers

select u.user_name, o.offer_title 
from users u
cross join offers o;

#task 4: self join to display each employee's name along with their manager's name (top-level managers only)

select e1.name as 'top-level manager', e2.name as 'reports to them'
from employees e1
left join employees e2 on e1.manager_id = e2.id
where e1.manager_id is null;

#task 5: find all pairs of users from a users table who live in the same city (excluding self-comparison)
select u1.user_name as user_1, u2.user_name as user_2, u1.city
from users u1
inner join users u2 on u1.city = u2.city
where u1.id < u2.id;
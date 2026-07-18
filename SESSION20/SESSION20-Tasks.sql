
drop table if exists mi_wins;
drop table if exists ipl_matches;

create table ipl_matches (
    match_id int auto_increment primary key,
    season int,
    team_1 varchar(100),
    team_2 varchar(100),
    venue varchar(100),
    toss_winner varchar(100),
    match_winner varchar(100),
    win_margin int
);

insert into ipl_matches (season, team_1, team_2, venue, toss_winner, match_winner, win_margin) values 
(2024, 'mumbai indians', 'gujarat titans', 'ahmedabad', 'gujarat titans', 'gujarat titans', 6),
(2024, 'rcb', 'mumbai indians', 'mumbai', 'mumbai indians', 'mumbai indians', 7),
(2024, 'csk', 'rcb', 'chennai', 'rcb', 'csk', 5),
(2024, 'mumbai indians', 'csk', 'mumbai', 'csk', 'mumbai indians', 20),
(2024, 'lsg', 'mumbai indians', 'lucknow', 'mumbai indians', 'mumbai indians', 4),
(2024, 'mumbai indians', 'kkr', 'mumbai', 'kkr', 'kkr', 24);

#task 2: select query to pull matches where mumbai indians played

select * 
from ipl_matches 
where team_1 = 'mumbai indians' or team_2 = 'mumbai indians';
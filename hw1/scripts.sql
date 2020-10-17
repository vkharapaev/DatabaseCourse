-- Задание 2
create database example;
create table users(id int, name text);
mysqldump example > example.sql
create database sample
mysql sample < exmaple.sql

-- Задание 3
mysqldump --where="1 limit 100" mysql help_keyword > help_keyword.sql
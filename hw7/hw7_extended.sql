-- задание 1
drop user if exists shop_read;
create user shop_read;
grant select, show view on shop.* to shop_read;
drop user if exists shop;
create user shop;
grant all on shop.* to shop;

-- задание 2
drop table if exists accounts;
create table accounts (id serial primary key, name varchar(255), password varchar(255));
insert into accounts values (null, 'person1', 'pass1'), (null, 'person2', 'pass2'), (null, 'person3', 'pass3');
drop view if exists username;
create view username as select id, name from accounts;
drop user if exists shop_read;
create user shop_read;
grant select(id, name) on shop.username to shop_read;

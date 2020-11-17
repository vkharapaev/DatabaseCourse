-- задание 1
create user shop_read;
grant select, show view on shop.* to shop_read;
create user shop;
grant all on shop.* to shop;

-- задание 2
create table accounts (id serial primary key, name varchar(255), password varchar(255));
insert into accounts values (null, 'person1', 'pass1'), (null, 'person2', 'pass2'), (null, 'person3', 'pass3');
create view username as select id, name from accounts;
create user shop_read;
grant select(id, name) on shop.username to shop_read;

drop table if exists catalogs;
create table catalogs (
    id SERIAL primary key,
    name varchar(255) comment 'Catalog name',
    unique unique_name(name(10))
) comment = 'Internet shop catalogs';

insert ignore into catalogs values
	(default, 'Processors'),
	(default, 'Motherboards'),
	(default, 'Video cards'),
	(default, 'Fans'),
	(default, 'Radiators');


/*
insert ignore into catalogs values
	(default, null),
	(default, ''),
	(default, ''),
	(default, null);
*/


drop table if exists users;
create table users (
    id SERIAL primary key,
    name varchar(255) comment 'User name',
    birthday_at date comment 'User birthday',
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Customers';

insert into users values 
	(default, 'user1', '1989-05-10', default, default),
	(default, 'user2', '1989-05-25', default, default),
	(default, 'user3', '1989-08-12', default, default),
	(default, 'user4', '1989-08-17', default, default),
	(default, 'user5', '1989-01-23', default, default),
	(default, 'user6', '1989-02-15', default, default),
	(default, 'user7', '1989-09-16', default, default),
	(default, 'user8', '1989-12-30', default, default);
	
	

drop table if exists products;
create table products (
    id SERIAL primary key,
    name varchar(255) comment 'Name',
    description text comment 'Description',
    price decimal(11,2) comment 'Price',
    catalog_id int unsigned,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    key index_of_catalog_id (catalog_id)
) comment = 'Products';
-- create index index_of_catalog_id using btree on products (catalog_id);
-- create index index_of_catalog_id using hash on products (catalog_id);
-- drop index index_of_catalog_id on products;

drop table if exists orders;
create table orders (
    id serial primary key,
    user_id int unsigned,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    key index_of_user_id (user_id)
) comment = 'Orders';

drop table if exists orders_products;
create table orders_products (
    id serial primary key,
    order_id int unsigned,
    product_id int unsigned,
    total int unsigned default 1 comment 'Number of items',
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Lists of order items';

drop table if exists discounts;
create table discounts (
    id serial primary key,
    user_id int unsigned,
    product_id int unsigned,
    discount float unsigned comment 'Discount amount betwee 0.0 and 1.0',
    started_at datetime,
    finished_at datetime,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp,
    key index_of_user_id(user_id),
    key index_of_produect_id(product_id)
) comment = 'Discounts';

drop table if exists storeshouses;
create table storeshouses (
    id serial primary key,
    name varchar(255) comment 'Name',
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Storeshouses';

drop table if exists storehouses_products;
create table storehouses_products (
    id serial primary key,
    storehouse_id int unsigned,
    product_id int unsigned,
    value int unsigned comment 'Available amount in storehouse',
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Product available amount in storehouse';


insert into storehouses_products values 
	(default, 1, 1, 2, default, default),
	(default, 1, 2, 5, default, default),
	(default, 1, 3, 4, default, default),
	(default, 1, 4, 0, default, default),
	(default, 1, 5, 0, default, default),
	(default, 1, 6, 50, default, default),
	(default, 1, 7, 7, default, default),
	(default, 1, 8, 0, default, default);

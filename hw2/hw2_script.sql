-- Задание 1
update catalogs set name = 'empty' where name = '' or name is null;

-- Задание 2
drop table if exists users;
create table users (
	id serial primary key,
	name varchar(100)
);

drop table if exists media_types;
create table media_types(
	id serial primary key,
	name varchar(100)
);

drop table if exists media;
create table media(
	id serial primary key,
	name varchar(100),
	media_type_id int unsigned,
	path text,
	description varchar(500),
	user_id int unsigned,
	key index_of_user_id(user_id),
	key index_of_media_type_id(media_type_id)
);

drop table if exists keywords;
create table keywords (
	id serial primary key,
	name varchar(50),
	unique unique_name(name(10))
);

drop table if exists media_keyword;
create table media_keyword (
	id serial primary key,
	media_id int unsigned,
	keyword_id int unsigned,
	unique unique_media_keyword(media_id, keyword_id)
);

-- Задание 3
insert into cat select * from shop.catalogs on duplicate key update name = values(name);
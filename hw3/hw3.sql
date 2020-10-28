-- задание 1
update users set created_at = now(), updated_at = now();

-- задание 2
create table users_tmp (
    id SERIAL primary key,
    name varchar(255) comment 'User name',
    birthday_at date comment 'User birthday',
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Customers';

insert into users_tmp select id, name, birthday_at, str_to_date(created_at, '%d.%m.%Y %h:%i'), str_to_date(updated_at, '%d.%m.%Y %h:%i') from users;

drop table users;

rename table users_tmp to users;

-- задание 3
select * from storehouses_products order by if (value > 0, value, 999999);
select * from storehouses_products order by value = 0, value;

-- задание 4
 select * from users where date_format(birthday_at, '%M') in ('may', 'august');

-- задание 5
select * from catalogs where id in (5, 1, 2) order by field(id, 5, 1, 2);
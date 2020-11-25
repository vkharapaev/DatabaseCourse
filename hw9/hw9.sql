-- задание 1
create table logs (
  created_at datetime,
  table_name varchar(8),
  id int,
  name varchar(255)
) engine = archive;

create trigger audit_products after insert on products for each row 
begin
  insert into logs values(now(), 'products', new.id, new.name);
end;

create trigger audit_catalogs after insert on catalogs for each row 
begin
  insert into logs values(now(), 'catalogs', new.id, new.name);
end;

create trigger audit_users after insert on users for each row 
begin
  insert into logs values(now(), 'users', new.id, new.name);
end;

-- задание 2
create table tmp as select * from users where 1 != 1;

insert into tmp (name, birthday_at) values
  ("Smith",    "1951-01-01"),
  ("Jones",    "1952-02-02"),
  ("Taylor",   "1963-03-03"),
  ("Brown",    "1954-04-04"),
  ("Williams", "1975-05-05"),
  ("Walker",   "1956-06-06"),
  ("Davies",   "1957-07-07"),
  ("Evans",    "1988-08-08"),
  ("Thomas",   "1959-09-09"),
  ("Roberts",  "1990-10-10");

insert into users (name, birthday_at) select t1.name, t1.birthday_at 
  from tmp as t1, tmp as t2, tmp as t3, tmp as t4, tmp as t5, tmp as t6;
-- задание 1
select distinct u.name from users u join orders o on o.user_id = u.id;
select u.name from users u where exists (select 1 from orders where user_id = u.id);

-- задание 2
select p.id 'product id', p.name 'product name', c.name 'catalog name' from catalogs c join products p on p.catalog_id = c.id;

-- задание 3
select f.id, (select name from cities where label = f.`from`) 'from', (select name from cities where label = f.`to`) 'to' from flights f;
select f.id, c1.name 'from', c2.name 'to' from flights f join cities c1 on c1.label = f.`from` join cities c2 on c2.label = f.`to`;

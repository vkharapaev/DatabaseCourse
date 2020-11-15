-- задание 1
start transaction;
insert into sample.users select * from shop.users where id = 1;
delete from shop.users where id = 1;
commit;

-- задание 2
create or replace view prod (product, catalog) as select p.name, c.name from products p left join catalogs c on p.catalog_id = c.id;

-- задание 3
create table tbl (created_at date);
insert into tbl values ('2018-08-01'), ('2018-08-04'), ('2018-08-16'), ('2018-08-17');
create temporary table nbrs (id int);
insert into nbrs values (0),(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30);
select distinct tmp.d, not isnull(tbl.created_at) from (select '2018-08-01' + interval id day as d from nbrs) tmp left join tbl on tmp.d = tbl.created_at;

-- задание 4
prepare rq from 'delete from tbl order by created_at limit ?';
set @count := (select count(*)-5 from tbl);
set @count := (select case when @count < 0 then 0 else @count end);
execute rq using @count;
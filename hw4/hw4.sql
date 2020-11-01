-- задание 1
select round(avg(timestampdiff(year, birthday_at, now())), 1) "Average age" from users;

-- задание 2
select dayname(birthday) "week day", count(*) "birth days count" from (select concat(year(now()), date_format(birthday_at, '-%m-%d')) "birthday" from users) tmp group by 1 order by weekday(birthday);

-- задание 3
select round(exp(sum(log(id))), 2) product from users;
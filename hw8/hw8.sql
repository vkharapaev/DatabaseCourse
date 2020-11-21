-- задание 1
create function hello() returns text
begin
  declare t time default current_time();
  if t >= TIME'06:00:0' and t < TIME'12:00:00' then
    return 'Доброе утро';
  elseif t >= TIME'12:00:00' and t < TIME'18:00:00' then
    return 'Добрый день';
  elseif t >= TIME'00:00:00' and t < TIME'06:00:00' then
    return 'Доброй ночи';
  else 
    return 'Добрый вечер';
  end if;
end;

-- задание 2
create procedure check_name_desc(name text, description text)
begin
  if name is null and description is null then
    signal sqlstate '45000' set message_text = 'name and description cannot be null at the same time';
  end if;
end;

create trigger check_name_desc_on_insert before insert on products for each row 
begin
  call check_name_desc(new.name, new.description);
end;

create trigger check_name_desc_on_update before update on products for each row 
begin
  call check_name_desc(new.name, new.description);
end;

-- задание 3
create function FIBONACCI(num int) returns int 
begin
  declare prev1, res int default 0;
  declare prev2, counter int default 1;
  if num < 2 then
    return num;
  end if;
  repeat
    set res = prev1 + prev2;
    set prev1 = prev2;
    set prev2 = res;
    set counter = counter + 1;
  until not counter < num
  end repeat;
  return res;
end;
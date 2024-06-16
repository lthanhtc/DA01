-- exercise 1
select
sum(case
  when device_type = 'laptop' then 1
  else 0
end) as laptop_reviews,
sum(case
  when device_type in('tablet', 'phone')  then 1
  else 0
end) as mobile_views
from viewership;

-- exercise 2
select x, y, z,
case
    when x + y > z 
    and x + z > y
    and y + z > x then 'yes'
    else 'no'
end as triangle
from triangle;

-- exercise 3
select
round(100.0*sum(case
  when call_category = 'n/a' 
  or call_category is null then 1
  else 0
end)/count(*), 1) as uncategorised_call_pct
from callers;

-- exercise 4
select name from customer
where not referee_id = 2
or referee_id is null;

-- exercise 5
select 
case
    when pclass = 1 then 'first_class'
    when pclass = 2 then 'second_class'
    else 'third_class'
end as pclass_value,
sum(case
    when survived = 1 then 1
    else 0
end) as survivors,
sum(case
    when survived = 0 then 1
    else 0
end) as non_survivors
from titanic
group by pclass_value;


-- exercise 1
select name from students
where marks > 75
order by right(name, 3), id;

-- exercise 2
select user_id,
concat(upper(left(name, 1)), lower(right(name, length(name)-1))) as name
from users
order by user_id;

select user_id,
concat(upper(left(name, 1)), lower(substring(name, 2))) as name
from users
order by user_id;

-- exercise 3
select manufacturer,
concat('$', round(sum(total_sales)/1000000, 0), ' ', 'million') as sales
from pharmacy_sales
group by manufacturer
order by sum(total_sales)/1000000 desc, manufacturer;

-- exercise 4
select product_id,
round(avg(stars), 2) as avg_stars,
extract(month from submit_date) as mth
from reviews
group by product_id, mth
order by extract(month from submit_date), product_id;

-- exercise 5
select sender_id,
count(message_id) as message_count
from messages
where extract(month from sent_date)=8
and extract(year from sent_date)=2022
group by sender_id
order by message_count desc
limit 2;

-- exercise 6
select tweet_id from tweets
where length(content)>15;

-- exercise 7
select activity_date as day,
count(distinct user_id) as active_users
from activity
where activity_date between '2019-06-28' and '2019-07-27'
group by activity_date;

-- exercise 8
select
count(id) as number_employees_hired
from employees
where joining_date between '2022-01-01' and '2022-08-01';

select
count(id) as number_employees_hired
from employees
where extract(month from joining_date) between 1 and 7
and extract(year from joining_date)=2022;

-- exercise 9
select 
position('a' in 'Amitah') as a_position
from worker
where first_name = 'Amitah';

-- exercise 10
select winery, 
substring(title, length(winery)+2, 4)
from winemag_p2
where country = 'Macedonia';



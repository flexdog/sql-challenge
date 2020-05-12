select e.last_name, count(e.last_name) as last_name_count
from employees as e
group by e.last_name
order by e.last_name desc


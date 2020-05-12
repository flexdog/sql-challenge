select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from salaries as s
inner join employees as e on
e.emp_no=s.emp_no;
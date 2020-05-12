select d.dept_no, d.dept_name, subquery1.emp_no, subquery1.last_name as manager_last_name, subquery1.first_name as manager_first_name, subquery1.from_date, subquery1.to_date
from departments as d,
(
select dm.dept_no, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from employees as e
inner join dept_manager as dm on
dm.emp_no = e.emp_no) subquery1
where subquery1.dept_no = d.dept_no;


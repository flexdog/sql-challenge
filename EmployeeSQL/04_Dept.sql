select e.emp_no, e.last_name, e.first_name, subquery1.dept_name
from employees as e,
(
select dept_emp.emp_no, departments.dept_name
from departments
inner join dept_emp on
dept_emp.dept_no = departments.dept_no) subquery1
where subquery1.emp_no = e.emp_no
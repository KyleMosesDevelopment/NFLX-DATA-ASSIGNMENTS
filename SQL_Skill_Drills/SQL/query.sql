-- Select all the employees who were born between January 1, 1952 and December 31, 1955 and their titles and title date ranges
-- Order the results by emp_no
select titles.emp_no, first_name, last_name, titles.title, from_date, to_date
from titles
join employees on titles.emp_no = employees.emp_no
where birth_date >= '1952/01/01' and birth_date <= '1955/12/31'
order by titles.emp_no;

-- Select only the current title for each employee
select titles.emp_no, first_name, last_name, titles.title
from titles
join employees on titles.emp_no = employees.emp_no
where birth_date >= '1952/01/01' and birth_date <= '1955/12/31' and to_date = '9999/01/01'
order by titles.emp_no;

-- Count the total number of employees about to retire by their current job title
-- Note: Did this by looking at age...
-- when looking at to_dates there was no dates that were in the future
select count(titles.emp_no), title 
from titles 
join employees on titles.emp_no = employees.emp_no
where birth_date <= '1955/01/01'
group by title
order by count(titles.emp_no) desc;

-- Count the total number of employees per department
-- Similair result to example on gitlab, but different numbers, pretty sure I did this right though
select dept_name, count(emp_no)
from dept_emp
join departments on dept_emp.dept_no = departments.dept_no
group by dept_name, dept_emp.dept_no
order by count(emp_no) desc

-- Bonus: Find the highest salary per department and department manager

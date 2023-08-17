create table departments(
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	Primary key (dept_no)
);

create table titles(
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
	Primary Key (title_id)
);

create table employees(
	emp_no INTEGER NOT NULL, 
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date DATE NOT NULL,
	Primary Key (emp_no),
	Foreign Key (emp_title_id) References titles(title_id)
);

create table salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	Primary Key (emp_no),
	Foreign Key (emp_no) References employees(emp_no)
);

create table dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	Primary Key (emp_no, dept_no),
	Foreign Key (emp_no) References employees(emp_no),
	Foreign Key (dept_no) References departments(dept_no)
);

create table dept_manager(
	dept_no VARCHAR(30) NOT NULL,
	emp_no INTEGER NOT NULL,
	Primary Key (dept_no, emp_no),
	Foreign Key (dept_no) References departments(dept_no),
	Foreign Key (emp_no) References employees(emp_no)
);

select * from salaries;

--Question number 1
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
Join salaries on employees.emp_no = salaries.emp_no;

--Question number 2
Select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1987-01-01';

--Question number 3
SELECT dept_manager.dept_no, dept_manager.emp_no, departments.dept_name, employees.last_name, employees.first_name
From dept_manager
Join departments on dept_manager.dept_no = departments.dept_no
Join employees on dept_manager.emp_no = employees.emp_no;

--Question number 4
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.dept_no, departments.dept_name
From employees
JOIN dept_emp on dept_emp.emp_no = employees.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no;

--Question number 5
SELECT first_name, last_name, sex
FROM employees
Where first_name = 'Hercules'
And last_name like 'B%';

--Question number 6
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
Join dept_emp on employees.emp_no = dept_emp.emp_no
JOIN departments on dept_emp.dept_no = departments.dept_no
Where departments.dept_no = 'd007';

--Question number 7
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_no = 'd007' or departments.dept_no = 'd005';

--Question number 8
select employees.last_name, count (*)
from employees 
group by employees.last_name 
order by count (*) desc;




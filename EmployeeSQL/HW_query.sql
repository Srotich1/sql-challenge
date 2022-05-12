-- -- create a table schema for each of the six CSV files.
-- * Import each CSV file into the corresponding SQL table.
-- -- Remember to specify data types, primary keys, foreign keys, and other constraints.
--1 ****department csv****
--"dept_no","dept_name"

CREATE TABLE departments (
	dept_no varchar primary key,
	dept_name VARCHAR
);

select *
from departments

--2 ****dept_emp.csv*****
--emp_no,dept_no
CREATE TABLE dept_emp (
	emp_no int,
	dept_no varchar
);

select *
from dept_emp

--3***dept_manager.csv
--dept_no,emp_no
CREATE TABLE dept_manager (
	dept_no varchar,
	emp_no VARCHAR
);

select *
from dept_manager

--4***employees.csv
--emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date
CREATE TABLE EMPLOYEES (
	emp_no VARCHAR NOT NULL,
	emp_title_id varchar NOT NULL,
	birth_date date NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	sex varchar,
	hire_date DATE NOT NULL
);

select *
from EMPLOYEES

--5***salaries.csv
--emp_no,salary
CREATE TABLE SALARIES (
	emp_no VARCHAR NOT NULL,
	SALARY VARCHAR 
);

select *
from SALARIES

--6****titles.csv
--title_id,title
CREATE TABLE TITLES (
	emp_title_id varchar NOT NULL,
	TITLE VARCHAR 
);

select *
from TITLES

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- SELECT column_name(s)
-- FROM table1
-- LEFT JOIN table2
-- ON table1.column_name = table2.column_name;
SELECT (LAST_NAME, FIRST_NAME,SEX,SALARY)
FROM EMPLOYEES
LEFT JOIN SALARIES
ON EMPLOYEES.EMP_NO = SALARIES.salary;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT (FIRST_NAME, LAST_NAME, HIRE_DATE)
FROM EMPLOYEES
WHERE hire_date >= '1986-01-01' AND
      hire_date < '1987-01-01';

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, 
departments.dept_name,
dept_manager.emp_no,
employees.last_name, 
employees.first_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

SELECT dept_manager.emp_no,
employees.last_name, 
employees.first_name,
departments.dept_name
FROM dept_manager
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
and last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_manager.emp_no,
employees.last_name, 
employees.first_name,
departments.dept_name
FROM dept_manager
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.



-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.









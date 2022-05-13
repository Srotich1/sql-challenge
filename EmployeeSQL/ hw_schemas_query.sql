---Inspect the CSVs and sketch out an ERD of the tables.
- -- create a table schema for each of the six CSV files.
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
	emp_title_id varchar  NOT NULL,
	birth_date date NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	sex varchar,
	hire_date DATE NOT NULL
	foreign key (emp_title_id) references (title_id)
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
	title_id varchar NOT NULL,
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
where dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_manager.emp_no,
employees.last_name, 
employees.first_name,
departments.dept_name
FROM dept_manager
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name ='Development'

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc



-- As you examine the data, you begin to suspect that the dataset is fake. 
--Maybe your boss gave you spurious data in order to test the data engineering skills of a new employee? 
--To confirm your hunch, you decide to create a visualization of the data to present to your boss. Follow these steps: 

-- 1. Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.)
--This step may require some research. Feel free to use the following code to get started. 
--Be sure to make any necessary modifications for your username, password, host, port, and database name:

--    ```sql
--    from sqlalchemy import create_engine
--    engine = create_engine('postgresql://localhost:5432/<your_db_name>')
--    connection = engine.connect()
--    ```

--     * Consult the [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.

--     * If you’re using a password, do not upload your password to your GitHub repository. 
---    * Review this [video](https://www.youtube.com/watch?v=2uaTPmNvH0I) and 
--     * the [GitHub website](https://help.github.com/en/github/using-git/ignoring-files) for more information.

-- 2. Create a histogram to visualize the most common salary ranges for employees.

-- 3. Create a bar chart of average salary by title.





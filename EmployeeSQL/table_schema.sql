
-- Table schema for each of the six CSV files.

-- 1 ****department csv****
CREATE TABLE departments (
	dept_no varchar primary key,
	dept_name VARCHAR
);

-- 2 ****dept_emp.csv*****
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no varchar,
	foreign key (emp_no) references EMPLOYEES
);

--3***dept_manager.csv
CREATE TABLE dept_manager (
	dept_no varchar,
	emp_no INT,
	foreign key (emp_no) references EMPLOYEES,
	foreign key (dept_no) references departments
);

--4***employees.csv
CREATE TABLE EMPLOYEES (
	emp_no INT primary key,
	emp_title_id varchar  NOT NULL,
	birth_date date NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	sex varchar,
	hire_date DATE NOT NULL
);	

--5***salaries.csv
CREATE TABLE SALARIES (
	emp_no INT NOT NULL,
	SALARY VARCHAR, 
	foreign key (emp_no) references EMPLOYEES
);

--6****titles.csv
CREATE TABLE TITLES (
	title_id varchar NOT NULL,
	TITLE VARCHAR 
);

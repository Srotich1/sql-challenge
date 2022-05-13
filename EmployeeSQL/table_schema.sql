
-- Table schema for each of the six CSV files.

-- 1 ****department csv****
CREATE TABLE departments (
	dept_no varchar primary key,
	dept_name VARCHAR
);
-- 2 ****dept_emp.csv*****
CREATE TABLE dept_emp (
	emp_no int,
	dept_no varchar
);
--3***dept_manager.csv
CREATE TABLE dept_manager (
	dept_no varchar,
	emp_no VARCHAR
);
--4***employees.csv
CREATE TABLE EMPLOYEES (
	emp_no VARCHAR NOT NULL,
	emp_title_id varchar  NOT NULL,
	birth_date date NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	sex varchar,
	hire_date DATE NOT NULL
);	
	--foreign key (emp_title_id) references TITLES
--5***salaries.csv
CREATE TABLE SALARIES (
	emp_no VARCHAR NOT NULL,
	SALARY VARCHAR 
);

--6****titles.csv
CREATE TABLE TITLES (
	title_id varchar NOT NULL,
	TITLE VARCHAR 
);

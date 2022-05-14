--  ****** Final Queries*******

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no as employee_number, last_name, first_name, sex, salary
FROM EMPLOYEES
LEFT JOIN SALARIES
ON EMPLOYEES.EMP_NO = SALARIES.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
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




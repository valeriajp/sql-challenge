--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no


--2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees 
WHERE 
		employees.hire_date > '1985-12-31' AND 
		employees.hire_date < '1987-01-01'
;


--3. List the manager of each department along with: 
--their department number, department name, employee number, 
--last name, and first name


SELECT dept_managers.dept_no, 
departments.dept_name,
employees.emp_no,
employees.last_name, 
employees.first_name
FROM dept_managers
LEFT JOIN departments
ON dept_managers.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_managers.emp_no = employees.emp_no
ORDER BY emp_no

--4.List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name 

SELECT
dept_emp.dept_no,
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
order by dept_no;

-- 5. List first name, last name, and sex of each employee whose first name
--is Hercules and whose last name begins with the letter B

SELECT 
employees.emp_no,
employees.first_name,
employees.last_name,
employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name like 'B%'
order by emp_no;

-- 6.List each employee in the Sales department, including their employee number, 
--last name, and first name

SELECT 
departments.dept_name,
dept_emp.dept_no,
employees.emp_no, 
employees.last_name, 
employees.first_name
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales'
order by emp_no;

-- 7. List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name

SELECT 
departments.dept_name,
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development')
order by emp_no;

-- 8. List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name) 

SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;
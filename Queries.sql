--DATA ANALYSIS
--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

---3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.

SELECT departments.dept_no, dept_name,employees.emp_no, last_name, first_name
FROM dept_manager
INNER JOIN departments
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees
ON employees.emp_no = dept_manager.emp_no;

--4. List the department number for each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no;

--5. List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, 
-- last name, and first name.
SELECT employees.emp_no, last_name, first_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

--8. List the frequency count in descending order of 
--employee last names (how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;
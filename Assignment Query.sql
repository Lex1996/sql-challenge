-- List the employee number, last name, first name, sex, 
-- and salary of each employee.
SELECT
e.emp_no,
e.last_name,
e.first_name,
e.sex,
s.salary
FROM employees AS e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no;


-- List the first name, last name, and hire date for 
-- the employees who were hired in 1986.
SELECT
first_name,
last_name,
hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'; 


-- List the manager of each department along with their 
-- department number, department name, employee number, 
-- last name, and first name.
SELECT
dm.emp_no,
e.first_name,
e.last_name,
dm.dept_no,
d.dept_name
FROM employees AS e
INNER JOIN department_manager AS dm
ON dm.emp_no = e.emp_no
INNER JOIN departments AS d
ON dm.dept_no = d.dept_no;


-- List the department number for each employee along 
-- with that employee’s employee number, last name, 
-- first name, and department name.
SELECT
de.emp_no,
e.first_name,
e.last_name,
de.dept_no,
d.dept_name
FROM employees AS e
INNER JOIN department_employee AS de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no;


-- List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins 
-- with the letter B.
SELECT
first_name,
last_name,
sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- List each employee in the Sales department, including 
-- their employee number, last name, and first name.
SELECT
de.emp_no,
e.first_name,
e.last_name,
de.dept_no,
d.dept_name 
FROM employees AS e
INNER JOIN department_employee AS de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, 
-- and department name.
SELECT
de.emp_no,
e.first_name,
e.last_name,
de.dept_no,
d.dept_name 
FROM department_employee AS de 
INNER JOIN employees AS e
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Developement');


-- List the frequency counts, in descending order, of all the 
-- employee last names (that is, how many employees share 
-- each last name).
SELECT last_name,
COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
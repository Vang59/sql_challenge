-- 1. List each employee's:
	-- 'employee #', 'last name', 'first name' & 'salary'
-- View table ----------
SELECT * FROM employees;
SELECT * FROM salaries;
------------------------
-- List columns
SELECT e.emp_no AS "Employee #",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex AS "Sex",
	s.salary AS "Salary"
FROM employees AS e
-- Join 'employees' & 'salaries' ON 'emp_no'
INNER JOIN salaries AS s 
ON e.emp_no = s.emp_no;

-- 2. List each employee's:
	-- 'first name', 'last name' & 'hire date'
	-- hired in 1986
-- View table ----------
SELECT * FROM employees;
------------------------
-- List columns
SELECT first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM employees
-- Narrow data to year 1986
WHERE (hire_date BETWEEN '01/01/1986'
	  AND '12/31/1986');
	
-- 3. List dept. manager's:
	-- 'dept. #', 'dept. name', 'emp. #', 'last name', & 'first name'
-- View table -------------
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM employees;
---------------------------
-- List columns
SELECT d.dept_no AS "Department #",
	d.dept_name AS "Department",
	m.emp_no AS "Employee #",
	e.last_name AS "Last Name",
	e.first_name AS "First Name"
FROM dept_manager AS m
-- Join 'dept_manager' & 'departments' ON 'dept_no'
LEFT JOIN departments AS d 
ON m.dept_no = d.dept_no
	-- Join 'dept_manager' & 'employees' ON 'emp_no'
	INNER JOIN employees AS e
	ON m.emp_no = e.emp_no;

-- 4. List each employee's:
	-- 'dept. #', 'emp. #', 'last name', 'first name', & 'dept name'
-- View table -------------
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM departments;
---------------------------
-- List columns
SELECT d.dept_no AS "Department #",
	e.emp_no AS "Employee #",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM dept_manager AS m
-- Join 'dept_manager' & 'employees' ON 'emp_no'
INNER JOIN employees AS e
ON m.emp_no = e.emp_no
	-- JOIN 'dept_manager' & 'departments' ON 'dept_no'
	Left JOIN departments AS d
	ON m.dept_no = d.dept_no;

-- 5. List each employee's:
	-- 'first name', 'last name' & 'sex'
	-- first name = 'Hercules'
	-- AND last name begins with 'B'
-- View table -------------
SELECT * FROM employees;
---------------------------
-- List columns
SELECT first_name AS "First Name",
	last_name AS "Last name",
	sex AS "Sex"
FROM employees
-- Narrow data to 'Hercules B...'
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List each employee's:
	-- 'emp. #', 'last name', 'first name'
	-- in the 'Sales' department
-- View table -------------
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM employees;
---------------------------
-- 'sales dept' -> 'dept_no' -> 'emp_no' -> 'last name' & 'first name'
SELECT emp_no AS "Employee #",
	last_name AS "Last Name",
	first_name AS "First Name"
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'));
		
-- 7. List each employee's:
	-- 'emp. no', 'last name', 'first name', & 'dept. name'
	-- in the 'Sales' & 'Development' departments
-- View table -------------
SELECT * FROM deparments;
SELECT * FROM dept_manager;
SELECT * FROM employees;
---------------------------
-- List columns
SELECT e.emp_no AS "Employee #",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department"
FROM employees AS e
-- Join 'employees' & 'dept_manager' ON "emp_no"
INNER JOIN dept_manager AS m
ON e.emp_no = m.emp_no
	-- Join 'dept_manager' & 'departments' ON 'dept_no'
	LEFT JOIN departments AS d
	ON m.dept_no = d.dept_no
	-- Narrow data by 'Sales' & 'Development' departments
	WHERE dept_name = 'Sales'
	OR dept_name = 'Development';
	
-- 8. List each employee's:
	-- last name
	-- in frequency counts (desc)
	-- # of employees w/same last name
-- View table -------------
SELECT * FROM employees;
---------------------------
-- List column(s) & count
SELECT last_name AS "Last Name", COUNT(last_name) AS "Count"
FROM employees
GROUP BY last_name
ORDER BY "Count" DESC;

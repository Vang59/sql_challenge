-- 1. Create 'titles' table
CREATE TABLE titles (
	title_id VARCHAR (5) NOT NULL,
	title VARCHAR (30) NOT NULL,
	PRIMARY KEY (title_id)
);
-- View table--------
SELECT * FROM titles;

-- 2. Create 'departments' table
CREATE TABLE departments (
	dept_no VARCHAR (4) NOT NULL,
	dept_name VARCHAR (30) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);
-- View table------------
SELECT * FROM departments;

-- 3. Create 'employees' table
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title VARCHAR (5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (30) NOT NULL,
	last_name VARCHAR NOT (30) NULL,
	sex VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no, emp_title),
	FOREIGN KEY (emp_title) REFERENCES titles (title_id),
	UNIQUE (emp_no)
);
-- View table-----------
SELECT * FROM employees;

-- 4. Create 'dept_manager' table
CREATE TABLE dept_manager (
	dept_no VARCHAR (4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
-- View table-------------
SELECT * FROM dept_manager;

-- 5. Create 'dept_emp' table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
-- View table---------
SELECT * FROM dept_emp;

-- 6. Create 'salaries' table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
-- View table---------
SELECT * FROM salaries;


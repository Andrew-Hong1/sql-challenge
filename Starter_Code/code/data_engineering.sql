-- Creating the tables
CREATE TABLE departments (
	dept_no varchar PRIMARY KEY,
	dept_name varchar NOT null
);

CREATE TABLE titles (
	title_id varchar PRIMARY KEY,
	title varchar NOT null
);

CREATE TABLE employees (
	emp_no int PRIMARY KEY,
	emp_title varchar NOT null,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
	birth_date date NOT null,
	first_name varchar NOT null,
	last_name varchar NOT null,
	sex varchar NOT null,
	hire_date date NOT null
);

CREATE TABLE dept_emp (
	emp_no int NOT null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no varchar,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no varchar NOT null,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	emp_no int not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
	emp_no int NOT null,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	salary int NOT null
);

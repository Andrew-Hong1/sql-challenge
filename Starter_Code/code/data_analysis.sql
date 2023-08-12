--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON (s.emp_no = e.emp_no);

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date >= '01/01/1986' AND hire_date <= '12/31/1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees AS e
JOIN dept_manager AS dm
ON (e.emp_no = dm.emp_no)
	JOIN departments AS d
	ON (d.dept_no = dm.dept_no);
	
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
	JOIN departments AS d
	ON (d.dept_no = de.dept_no);
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE e.emp_no in
	(SELECT emp_no
	from dept_emp
	where dept_no = 'd007')
	
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN departments AS d
ON (d.dept_no = de.dept_no)
WHERE de.dept_no in ('d007', 'd005');
		
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, count(e.last_name) AS "Last_name_count"
FROM employees AS e
GROUP BY last_name
ORDER BY "Last_name_count" desc

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT a.emp_no, a.last_name, a.first_name, a.sex, s.salary 
FROM "Employees" as a
INNER JOIN "Salaries" as s
ON (a.emp_no = s.emp_no);

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date between '1986-01-01' and '1986-12-31';


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT M.dept_no, d.dept_name, M.emp_no, e.last_name, e.first_name
FROM "Dept_Manager" as M
JOIN "Departments" as d
ON (M.dept_no = d.dept_no)
	  JOIN "Employees" as e
	  ON (M.emp_no = e.emp_no); 
	  


--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT M.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" as M
JOIN "Departments" as d
ON (M.dept_no = d.dept_no)
	  JOIN "Employees" as e
	  ON (M.emp_no = e.emp_no) 
Group by M.emp_no, e.last_name, e.first_name, d.dept_name, d.dept_name;


--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT M.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" as M
JOIN "Departments" as d
ON (M.dept_no = d.dept_no)
	  JOIN "Employees" as e
	  ON (M.emp_no = e.emp_no) 
	  WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT M.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" as M
JOIN "Departments" as d
ON (M.dept_no = d.dept_no)
	  JOIN "Employees" as e
	  ON (M.emp_no = e.emp_no) 
	  WHERE d.dept_name in ('Sales', 'Development');
	

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS Distinct 
FROM "Employees"
group by last_name
order by count(last_name) desc;


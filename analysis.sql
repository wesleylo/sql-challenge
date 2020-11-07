-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
  FROM Employees
  INNER JOIN Salaries
  ON Salaries.emp_no = Employees.emp_no;


-- List first name, last name, and hire date for Employees who were hired in 1986.
SELECT Employees.first_name, Employees.last_name, Employees.hire_date
  FROM Employees
  Where extract(year from hire_date)= '1986'
  ORDER BY hire_date NULLS LAST;


-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT Dept_Manager.dept_no, Departments.dept_name, Dept_Manager.emp_no, Employees.last_name, Employees.first_name
  FROM Dept_Manager
  LEFT JOIN Departments
  ON Dept_Manager.dept_no = Departments.dept_no
  LEFT JOIN Employees
  ON Dept_Manager.emp_no = Employees.emp_no;


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
  FROM Dept_Emp
  LEFT JOIN Departments
  ON Dept_Emp.dept_no = Departments.dept_no
  LEFT JOIN Employees
  ON Dept_Emp.emp_no = Employees.emp_no
  ORDER BY Departments.dept_name NULLS LAST;


-- List first name, last name, and sex for Employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
  FROM Employees
  WHERE first_name = 'Hercules' and last_name like 'B%';


-- List all Employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
  FROM Dept_Emp
  LEFT JOIN Departments
  ON Dept_Emp.dept_no = Departments.dept_no
  LEFT JOIN Employees
  ON Dept_Emp.emp_no = Employees.emp_no
  WHERE Departments.dept_name = 'Sales';


-- List all Employees in the Sales and Development Departments, including their employee number, last name, first name, and department name.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
  FROM Dept_Emp
  LEFT JOIN Departments
  ON Dept_Emp.dept_no = Departments.dept_no
  LEFT JOIN Employees
  ON Dept_Emp.emp_no = Employees.emp_no
  WHERE Departments.dept_name = 'Sales' or Departments.dept_name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many Employees share each last name.
SELECT last_name, COUNT(last_name) AS "last_name_frequency"
  FROM Employees
  GROUP BY last_name
  ORDER BY "last_name_frequency" DESC NULLS LAST;

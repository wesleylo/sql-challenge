DROP TABLE IF EXISTS Dept_Manager CASCADE; -- Drop and import/create in reverse orders to satisfy constraints
DROP TABLE IF EXISTS Dept_Emp CASCADE;
DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Titles CASCADE;


CREATE TABLE Titles (
  title_id varchar NOT NULL,
  title varchar NOT NULL,
  PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
  emp_no varchar NOT NULL,
  emp_title_id varchar NOT NULL,
  birth_date date NOT NULL,
  first_name varchar NOT NULL,
  last_name varchar NOT NULL,
  sex varchar NOT NULL,
  hire_date date NOT NULL,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Salaries (
  emp_no varchar NOT NULL,
  salary int NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Departments (
  dept_no varchar NOT NULL,
  dept_name varchar NOT NULL,
  PRIMARY KEY (dept_no)
);

CREATE TABLE Dept_Emp (
  emp_no varchar NOT NULL, -- Make sure data column order matches for importing
  dept_no varchar NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Dept_Manager (
  dept_no varchar NOT NULL, -- Make sure data column order matches for importing
  emp_no varchar NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

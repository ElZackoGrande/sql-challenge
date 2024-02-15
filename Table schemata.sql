--DATA ENGINEERING
--Create the tables in this order and set up keys:
--Departments
--Titles
--Employees
--Dept_Emp
--Salaries
--Dept_Manager

--Drop any old tables

DROP TABLE departments;
DROP TABLE titles;
DROP TABLE employees;
DROP TABLE dept_emp;
DROP TABLE salaries;
DROP TABLE dept_manager;

--Create departments table

CREATE TABLE departments (
	dept_no VARCHAR(30) NOT NULL, 
	dept_name VARCHAR(30) NOT NULL,
   PRIMARY KEY (dept_no));

select * from departments;

-- Create titles table

create table titles (
     title_id VARCHAR(10) NOT NULL,
	 title VARCHAR(50) NOT NULL,
   Primary Key (title_id)
);
select * from titles;

-- Create employees table

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(30) NOT NULL,
    birth_date  DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(5) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY (emp_no)
);
select * from employees; 

-- Create dept_emp table

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no) );
	
select* from dept_emp;

-- Create salaries table

create table salaries (
      emp_no INT not null,
      salary INT not null,
    Primary Key (emp_no),
	Foreign key (emp_no) references employees(emp_no));

select * from salaries;

--- Create dept_manager table

CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);
select * from dept_manager;

--NOW IMPORTING CSV FILES TO THESE NEW TABLES
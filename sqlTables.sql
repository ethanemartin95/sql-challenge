--Table 1
CREATE TABLE employees (
  emp_no INTEGER NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  gender VARCHAR NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (emp_no)
);

COPY employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
FROM '/private/tmp/sql-homework/employees.csv'
DELIMITER ',' CSV HEADER;

--Table 2
CREATE TABLE titles (
  emp_no INTEGER NOT NULL,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  PRIMARY KEY (emp_no, title, from_date),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY titles(emp_no, title, from_date, to_date)
FROM '/private/tmp/sql-homework/titles.csv'
DELIMITER ',' CSV HEADER;

--Table 3
CREATE TABLE departments (
  dept_no VARCHAR NOT NULL,
  dept_name VARCHAR NOT NULL,
  PRIMARY KEY (dept_no)
);

COPY departments(dept_no, dept_name)
FROM '/private/tmp/sql-homework/departments.csv'
DELIMITER ',' CSV HEADER;

--Table 4
CREATE TABLE salaries (
  emp_no INTEGER NOT NULL,
  salary INTEGER NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY salaries(emp_no, salary, from_date, to_date)
FROM '/private/tmp/sql-homework/salaries.csv'
DELIMITER ',' CSV HEADER;

--Table 5
CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  emp_no INTEGER NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY dept_manager(dept_no, emp_no, from_date, to_date)
FROM '/private/tmp/sql-homework/dept_manager.csv'
DELIMITER ',' CSV HEADER;

--Table 6
CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  dept_no VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY dept_emp(emp_no, dept_no, from_date, to_date)
FROM '/private/tmp/sql-homework/dept_emp.csv'
DELIMITER ',' CSV HEADER;

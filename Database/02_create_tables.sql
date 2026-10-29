use employee_role_management;
create table departments(dept_id int primary key auto_increment, dept_name varchar(100) not null unique);
CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    dept_id INT,
    role_id INT,
    manager_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

CREATE TABLE salary_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    change_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);
show tables;

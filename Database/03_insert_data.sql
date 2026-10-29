USE employee_role_management;

INSERT INTO departments (dept_name)
VALUES
('HR'),
('IT'),
('Finance'),
('Sales'),
('Marketing');
INSERT INTO roles (role_name)
VALUES
('Manager'),
('Developer'),
('Data Analyst'),
('HR Executive'),
('Tester');
INSERT INTO employees
(emp_name, email, salary, dept_id, role_id, manager_id, hire_date)
VALUES
('Rahul', 'rahul@gmail.com', 50000, 2, 2, NULL, '2024-01-10'),
('Priya', 'priya@gmail.com', 65000, 2, 3, 1, '2024-03-15'),
('Anita', 'anita@gmail.com', 45000, 1, 4, NULL, '2023-06-20'),
('Kiran', 'kiran@gmail.com', 55000, 3, 3, NULL, '2024-07-01'),
('Vijay', 'vijay@gmail.com', 40000, 4, 5, NULL, '2023-09-12');
INSERT INTO salary_history
(emp_id, old_salary, new_salary, change_date)
VALUES
(1, 45000, 50000, '2024-01-10'),
(2, 60000, 65000, '2024-03-15'),
(3, 40000, 45000, '2023-06-20');
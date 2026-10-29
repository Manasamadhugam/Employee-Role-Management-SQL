USE employee_role_management;

CREATE INDEX idx_employee_name
ON employees(emp_name);
SHOW INDEX FROM employees;
SELECT *
FROM employees
WHERE emp_name = 'Rahul';

EXPLAIN
SELECT *
FROM employees
WHERE emp_name = 'Rahul';
SHOW CREATE TABLE employees;
SELECT VERSION();

ALTER TABLE employees
ADD CONSTRAINT chk_employee_salary
CHECK (salary >= 0);
SHOW CREATE TABLE employees;

INSERT INTO employees
(emp_name, salary)
VALUES
('TestUser', -5000);
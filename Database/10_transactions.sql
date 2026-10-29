USE employee_role_management;

SELECT emp_id, emp_name, salary
FROM employees
WHERE emp_id = 1;

START TRANSACTION;

UPDATE employees
SET salary = 55000
WHERE emp_id = 1;

SELECT * FROM employees
WHERE emp_id = 1;

COMMIT;

START TRANSACTION;

UPDATE employees
SET salary = 60000
WHERE emp_id = 1;

SELECT * FROM employees
WHERE emp_id = 1;

ROLLBACK;

SELECT * FROM employees
WHERE emp_id = 1;

START TRANSACTION;

UPDATE employees
SET salary = 57000
WHERE emp_id = 1;

SAVEPOINT salary_point;

UPDATE employees
SET salary = 58000
WHERE emp_id = 1;

ROLLBACK TO SAVEPOINT salary_point;

COMMIT;
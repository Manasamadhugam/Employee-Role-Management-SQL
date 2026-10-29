USE employee_role_management;

DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;
SHOW TRIGGERS;
INSERT INTO employees
(emp_id, emp_name, dept_id, role_id, salary)
VALUES
(999, 'TestEmployee', 1, 1, -5000);
DESCRIBE salary_history;
USE employee_role_management;

DELIMITER //

CREATE TRIGGER after_employee_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_history
            (emp_id, old_salary, new_salary, change_date)
        VALUES
            (OLD.emp_id, OLD.salary, NEW.salary, CURDATE());
    END IF;
END //

DELIMITER ;
UPDATE employees
SET salary = 52000
WHERE emp_id = 1;
SELECT *
FROM salary_history
WHERE emp_id = 1;

USE employee_role_management;

DELIMITER //

CREATE TRIGGER before_employee_delete
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Employee deletion is not allowed';
END //

DELIMITER ;
SHOW TRIGGERS;
DELETE FROM employees
WHERE emp_id = 1;


USE employee_role_management;

DELIMITER //

CREATE FUNCTION GetAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //

DELIMITER ;
SELECT GetAnnualSalary(25000) AS annual_salary;

USE employee_role_management;

DELIMITER //

CREATE FUNCTION GetEmployeeAnnualSalary(emp_id_input INT)
RETURNS DECIMAL(12,2)
READS SQL DATA
BEGIN
    DECLARE annual_salary DECIMAL(12,2);

    SELECT salary * 12
    INTO annual_salary
    FROM employees
    WHERE emp_id = emp_id_input;

    RETURN annual_salary;
END //

DELIMITER ;
SELECT GetEmployeeAnnualSalary(1) AS annual_salary;
USE employee_role_management;

DELIMITER //

CREATE FUNCTION GetSalaryCategory(emp_salary DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE category VARCHAR(20);

    IF emp_salary >= 60000 THEN
        SET category = 'High Salary';
    ELSEIF emp_salary >= 30000 THEN
        SET category = 'Medium Salary';
    ELSE
        SET category = 'Low Salary';
    END IF;

    RETURN category;
END //

DELIMITER ;
SELECT GetSalaryCategory(50000) AS salary_category;

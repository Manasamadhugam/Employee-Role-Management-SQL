USE employee_role_management;

DELIMITER //

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM employees;
END //

DELIMITER ;
CALL GetAllEmployees();
USE employee_role_management;

DELIMITER //

CREATE PROCEDURE GetEmployeeByID(IN emp_id_input INT)
BEGIN
    SELECT *
    FROM employees
    WHERE emp_id = emp_id_input;
END //

DELIMITER ;
CALL GetEmployeeByID(1);
USE employee_role_management;

DELIMITER //
SHOW PROCEDURE STATUS
WHERE Db = 'employee_role_management';
DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id_input INT)
BEGIN
    SELECT *
    FROM employees
    WHERE dept_id = dept_id_input;
END //

DELIMITER ;

CALL GetEmployeesByDepartment(1);
USE employee_role_management;

DELIMITER //

CREATE PROCEDURE GetEmployeesByMinSalary(
    IN min_salary DECIMAL(10,2)
)
BEGIN
    SELECT *
    FROM employees
    WHERE salary > min_salary;
END //

DELIMITER ;


CALL GetEmployeesByMinSalary(30000);

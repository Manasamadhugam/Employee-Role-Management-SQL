USE employee_role_management;

CREATE VIEW employee_department_view AS
SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id;
-- Q2: Display all records from the view
SELECT * FROM employee_department_view;
-- Q3: Display employee names and salaries using the view
select emp_name, salary from employee_department_view;
-- Q4: Display employees earning more than 40000
select * from employee_department_view where salary > 40000;
-- Q5: Create a view for employee role details
create view employee_role_view as select e.emp_id, e.emp_name, r.role_name, e.salary from employees e join roles r on e.role_id = r.role_id;
-- Q6: Display employee role details
SELECT * FROM employee_role_view;
-- Q7: Create a view for employees earning more than 40000
create view high_salary_employees as select emp_id, emp_name, salary from employees where salary > 40000;
-- Q8: Display high salary employees
SELECT * FROM high_salary_employees;
-- Q9: Create a view showing the number of employees in each department.
CREATE VIEW department_employee_count AS
SELECT
    d.dept_id,
    d.dept_name,
    COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;
-- Q10: Display department-wise employee count
SELECT * FROM department_employee_count;
-- Q11: Create a view showing the average salary in each department.
CREATE VIEW department_average_salary AS
SELECT
    d.dept_id,
    d.dept_name,
    AVG(e.salary) AS average_salary
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;
-- Q12: Display average salary by department
SELECT * FROM department_average_salary;
-- Q13: Display all views in the current database
show full tables where table_type = 'view';

select * from employees;



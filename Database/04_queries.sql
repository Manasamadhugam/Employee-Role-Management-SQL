USE employee_role_management;

DESCRIBE departments;
DESCRIBE roles;
DESCRIBE employees;
DESCRIBE salary_history;
-- Q1: Display all employees
SELECT * FROM employees;
-- Q2: Display employee names and salaries
select emp_name, salary from employees;
-- Q3: Display employees earning more than 40,000
select * from employees where salary > 40000;
-- Q4: Display employees in descending salary order
select emp_name, salary from employees order by salary desc;
-- Q5: Display the top 3 highest-paid employees
select emp_name, salary from employees order by salary desc limit 3;
-- Q6: Find the highest salary
select max(salary) as highest_salary from employees;
-- Q7: Find the lowest salary
select min(salary) as lowest_salary from employees;
-- Q8: Calculate the average salary
select avg(salary) as average_salary from employees;
-- Q9: Count total employees
select count(*) as total_employees from employees;
-- Q10: Find employees earning between 30,000 and 60,000
select * from employees where salary between 30000 and 60000;
-- Q11: Count employees in each department
select dept_id, count(*) as total_employees from employees group by dept_id;
-- Q12: Find average salary in each department
select dept_id, avg(salary) as average_salary from employees group by dept_id;
-- Q13: Display departments having more than one employee
select dept_id, count(*) as total_employees from employees group by dept_id having count(*) > 1;
-- Q14: Find departments with an average salary above 40,000
select dept_id, avg(salary) as average_salary from employees group by dept_id having avg(salary) > 40000;
-- Q15: Display employee names with department names
select e.emp_name, d.dept_name from employees e join departments d on e.dept_id = d.dept_id;
-- Q16: Display employee names with their roles
select e.emp_name, r.role_name from employees e join roles r on e.role_id = r.role_id;
-- Q17: Display employee, department, role and salary
select e.emp_id, e.emp_name, d.dept_name, r.role_name, e.salary from employees e join departments d on e.dept_id = d.dept_id join roles r on e.role_id = r.role_id;
-- Q18: Display all departments, including those without employees
select d.dept_name, e.emp_name from departments d left join employees e on d.dept_id = e.dept_id;
-- Q19: Display all roles, including roles without employees
select r.role_name, e.emp_name from roles r left join employees e on r.role_id = e.role_id;
-- Q20: Find employees earning above average salary
select emp_name, salary from employees where salary > (select avg(salary) from employees);
-- Q21: Find the second-highest salary
select max(salary) as second_highest_salary from employees where salary < (select max(salary) from employees);
-- Q22: Find employees earning the highest salary
select emp_name, salary from employees where salary = (select max(salary) from employees);
-- Q23: Find employees earning more than the average salary in their own department
select e.emp_name, e.salary , e.dept_id from employees e where e.salary > (select avg(e2.salary) from employees e2 where e2.dept_id = e.dept_id);
-- Q24: Find the total salary expenditure
select sum(salary) as total_salary_expenditure from employees;
-- Q25: Display employees whose salary is not between 30,000 and 60,000
select emp_name, salary from employees where salary not between 30000 and 60000;

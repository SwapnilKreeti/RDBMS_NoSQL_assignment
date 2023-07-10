/*MySql*/

/*1. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.*/
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary ASC;

/*2. Write the query to get the department, total no. employee of each department, total(sum) salary with respect to department from "Employee" table.*/
SELECT department_id, COUNT(*) AS total_employees, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

/*3. Get department wise maximum salary from "Employee" table order by salary ascending*/
SELECT department_id, MAX(salary) AS max_salary
FROM employees
GROUP BY department_id
ORDER BY max_salary ASC;

/*4. Write a query to get the departments where average salary is more than 60k*/
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 60000;

/*5. Write down the query to fetch department name assign to more than one Employee*/
SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 1;

/*6. Write a query to show department_name and assigned To where assigned To will be “One candidate” if it is assigned to only one employee otherwise “Multiple candidates”*/
SELECT department_name, 
    CASE 
        WHEN COUNT(*) = 1 
        THEN 'One candidate'
        ELSE 'Multiple candidates'
    END AS assigned_to
FROM employees
GROUP BY department_name;
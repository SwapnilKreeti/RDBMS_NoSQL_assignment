/*MySql*/

/*1. From the following tables write a SQL query to find the details of an employee.Return full name, email, salary, Department Name, postal code, and City.*/
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.email,
    e.salary,
    d.department_name,
    l.postal_code,
    l.city
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
JOIN
    locations l ON d.location_id = l.location_id
WHERE
    e.employee_id = 001;
    
/*2. Write a SQL query to find the departments whose location is in "Jammu Kashmir" or "Jharkhand". Return Department Name, state_province,street_address. */
SELECT
    d.department_name,
    l.state_province,
    l.street_address
FROM
    departments d
JOIN
    locations l ON d.location_id = l.location_id
JOIN
    countries c ON l.country_id = c.country_id
WHERE
    c.region_id IN (
        SELECT region_id
        FROM regions
        WHERE region_name IN ('Jammu Kashmir', 'Jharkhand')
    );
    
/*3. From the following tables write a SQL query to find the count of employees present in different jobs whose average salary is greater than 10,000. Return all the jobs with employee count, Job Name, and average salary. */
SELECT
    j.job_title AS job_Name,
    COUNT(*) AS Employee_Count,
    AVG(e.salary) AS Average_Salary
FROM
    employees e
JOIN
    jobs j ON e.job_id = j.job_id
GROUP BY
    j.job_title
HAVING
    AVG(e.salary) > 10000;
    
/*4. From the following table write a SQL query to find all the first_names and last_names in both dependents and employees tables. Return the duplicate records as well and order the records in descending order of the last_name column.*/
SELECT
    first_name,
    last_name
FROM
    dependents
UNION ALL
SELECT
    first_name,
    last_name
FROM
    employees
ORDER BY
    last_name DESC;
    
/*5. From the following table write a SQL query to list every employee that has a manager with the name of his or her manager.*/
SELECT
	e.employee_id,
    e.first_name,
    e.last_name,
    m.first_name AS manager_name
FROM
    employees e
JOIN
    employees m ON e.manager_id = m.employee_id;

/*6. Find the departments that have more than 5 employees earning a salary greater than 50,000 and are located in either New York or California. Include the department name, location, and the number of employees meeting the criteria*/
SELECT
    d.department_name,
    l.city,
    COUNT(*) AS employee_count
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
JOIN
    locations l ON d.location_id = l.location_id
WHERE
    e.salary > 50000
    AND (l.state_province = 'New York' OR l.state_province = 'California')
GROUP BY
    d.department_name,
    l.city
HAVING
    COUNT(*) > 5;
    

/*7. List any employees who have dependents and have a job title that includes the word 'manager', and sort the results by department name in ascending order.*/
SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
JOIN
    jobs j ON e.job_id = j.job_id
WHERE
    EXISTS (
        SELECT 1
        FROM dependents
        WHERE employee_id = e.employee_id
    )
    AND j.job_title LIKE '%manager%'
ORDER BY
    d.department_name ASC;
    
/*8. Add a column in the dependent table called “city” depicting their current location ofstay. Find all employees who have been hired in the past 3 years and have dependentsliving in a city that is different from the city they work in (if I work in Kolkata, then mydependent should not be in Kolkata).
Additionally, only include employees whose salary is greater than the average salary oftheir job title(suppose, my job_title is ”developer” and the salary is 80k, and the averagesalary under the same job_title “developer” is 70k), and whose manager's job titleincludes the word 'director'. Finally, include the department name and location of eachemployee, and sort the results by department name in ascending order */
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    d.department_name,
    l.city AS work_city,
    dep.city AS dependent_city
FROM
    employees e
JOIN
    departments d ON e.department_id = d.department_id
JOIN
    locations l ON d.location_id = l.location_id
JOIN
    employees m ON e.manager_id = m.employee_id
JOIN
    jobs j ON e.job_id = j.job_id
JOIN
    (
        SELECT
            employee_id,
            city
        FROM
            dependents
    ) dep ON e.employee_id = dep.employee_id
WHERE
    e.hire_date >= DATE_SUB(NOW(), INTERVAL 3 YEAR)
    AND dep.city != l.city
    AND e.salary > (
        SELECT AVG(salary)
        FROM employees
        WHERE job_id = e.job_id
    )
    AND m.job_title LIKE '%director%'
ORDER BY
    d.department_name ASC;
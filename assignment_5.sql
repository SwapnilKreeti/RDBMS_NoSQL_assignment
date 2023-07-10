/*MySql*/

/*1. Find all the departments where the minimum salary is less than 2000*/
SELECT department_name
FROM departments
WHERE department_id IN (
  SELECT department_id
  FROM employees
  WHERE salary = (
    SELECT MIN(salary)
    FROM employees)
) AND (SELECT MIN(salary) FROM employees) < 2000;

/*2. Find all the countries where no employees exist.*/
SELECT country_name
FROM countries
WHERE country_id NOT IN (
  SELECT country_id
  FROM locations
  WHERE location_id IN (
    SELECT location_id
    FROM departments
    WHERE department_id IN (
      SELECT department_id
      FROM employees)
  )
);

/*3. From the following tables write a query to find all the jobs, having at least 2 employees in a single department.(don’t use joins)*/
SELECT job_title
FROM jobs
WHERE job_id IN (
  SELECT job_id
  FROM employees
  WHERE department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(DISTINCT job_id) >= 2
  )
);

/*4. From the following tables write a query to find all the countries, having cities with all the city names starting with 'a'.(don’t use joins)*/
SELECT country_name
FROM countries
WHERE country_id IN (
  SELECT country_id
  FROM locations
  WHERE location_id IN (
    SELECT location_id
    FROM locations
    WHERE city LIKE 'a%'
  )
  GROUP BY country_id
  HAVING COUNT(DISTINCT city) = (
    SELECT COUNT(DISTINCT city)
    FROM locations
    WHERE city LIKE 'a%'
  )
);
/*5. From the following tables write a query to find all the departments, having no cities*/
SELECT department_name
FROM department
WHERE department_id NOT IN (
  SELECT department_id
  FROM locations
  WHERE city IS NOT NULL
);
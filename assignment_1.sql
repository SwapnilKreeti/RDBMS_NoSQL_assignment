/*MySql*/

/*1.Create the following schema*/
CREATE TABLE regions (
	region_id INT PRIMARY KEY,
	region_name VARCHAR (50) DEFAULT NULL
);

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (50) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) 
);

CREATE TABLE locations (
	location_id INT PRIMARY KEY,
	street_address VARCHAR (50) DEFAULT NULL,
	postal_code VARCHAR (10) DEFAULT NULL,
	city VARCHAR (50) NOT NULL,
	state_province VARCHAR (50) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) 
);

CREATE TABLE jobs (
	job_id INT PRIMARY KEY,
	job_title VARCHAR (50) NOT NULL,
	min_salary INT CHECK (min_salary > 1000),
	max_salary INT CHECK (max_salary > 1000)
);

CREATE TABLE departments (
	department_id INT PRIMARY KEY,
	department_name VARCHAR (50) NOT NULL,
	location_id INT NOT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) 
);

CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (50) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary INT CHECK (salary > 1000),
	manager_id INT NOT NULL,
	department_id INT NOT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id)
	FOREIGN KEY (department_id) REFERENCES departments (department_id) 
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

CREATE TABLE dependents (
	dependent_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) 
);

/*2.Insert 5 rows in the jobs, dependents, regions, countries, locations, departments table and 10 rows in the Employee table. */

/*2.1.Region Table*/
INSERT INTO regions(region_id,region_name) VALUES (1,'Asia');
INSERT INTO regions(region_id,region_name) VALUES (2,'Europe');
INSERT INTO regions(region_id,region_name) VALUES (3,'North America');
INSERT INTO regions(region_id,region_name) VALUES (4,'South America');
INSERT INTO regions(region_id,region_name) VALUES (5,'Africa');

/*2.2.Countries Table*/
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','Canada',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazi',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',5);

/*2.3.Location Table*/
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (101,'Bandra Street','1111111','Bandra','Mumbai','IN');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (202,'Saint Louis Street','2222222','Saint Louis','Paris','FR');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (303,'North York Street','3333333','North York','Toronto','CN');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (404,'Sao Paulo Street','4444444','Sao Paulo','Rio','BR');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (505,'Maryland Street','5555555','Maryland','Lagos','NG');

/*2.4.Jobs Table*/
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Software Developer',1100,9900);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Marketing Manager',1200,9800);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Accountant',1300,9700);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'Data Analyst',1400,9600);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'HR Manager',1500,9500);

/*2.5.Department Table*/
INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Marketing Dept.',101);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Human Resource Dept.',202);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Technical Dept.',303);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Analysis Dept.',404);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Finance Dept.',505);

/*2.6.Employee Table*/
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (001,'Rashmi','Kar','rashmi@gmail.com','9873546756','2022-01-01',1,36000,30001,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (002,'Kamala','iyyer','iyyer@gmail.com','9845373635','2022-02-05',1,38000,30001,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (003,'Suman','Barman','suman@gmail.com','9845378456','2022-03-07',2,43000,10001,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (004,'Kavita','Prabhu','prabhu@gmail.com','9938373635','2022-04-16',2,56000,10001,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (005,'Nikita','Roy','nikita@gmail.com','912121212','2022-05-17',3,36000,50001,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (006,'Sunil','Upadhyay','sunil@gmail.com','9546454645','2022-06-06',3,68000,50001,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (007,'Amar','Chetri','amar@gmail.com','8938373635','2022-07-01',4,67000,40001,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (008,'Nitesh','Kumar','nitesh@gmail.com','9873390756','2022-08-01',4,78000,40001,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (009,'Aditya','Kar','aditya@gmail.com','9809876756','2022-09-01',5,55000,20001,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (010,'Rashmi','Nath','nath@gmail.com','9233546756','2022-09-19',5,66000,20001,2);

/*2.7.Dependents Table*/
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (1,'Ramesh','Kumar','Child',008);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (2,'Navneil','Upadhyay','Child',006);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (3,'Neha','Kar','Child',001);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (4,'Rohit','Barman','Child',003);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (5,'Johnny','Prabhu','Child',004);

/*3.a.In departments table, add a new field ‘manager_name’ of type VARCHAR.*/
ALTER TABLE departments
ADD manager_name VARCHAR(50);
SELECT * FROM departments;

/*3.b.REMOVE field max_salary from jobs.*/
ALTER TABLE jobs
DROP COLUMN max_salary;
SELECT * FROM jobs;

/*3.c.In the locations table, rename postal_code column to pincode.*/
ALTER TABLE locations
RENAME COLUMN postal_code TO pincode;
SELECT * FROM locations;


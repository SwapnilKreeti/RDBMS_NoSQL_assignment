/*MySql*/

/*1. Create a trigger to fill up the full_name column in the dependents table while inserting any new records*/
use assignment_1;
ALTER TABLE dependents
ADD COLUMN full_name VARCHAR(50);

delimiter //
CREATE TRIGGER fill_full_name
BEFORE INSERT ON dependents
FOR EACH ROW
BEGIN
    SET NEW.full_name = CONCAT(NEW.first_name, ' ', NEW.last_name);
END;
//

/*2. */
CREATE TABLE locations_info (
    transaction_id INT AUTO_INCREMENT,
    transaction_type VARCHAR(10),
    transaction_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    location_id INT,
    street_address VARCHAR(255),
    postal_code VARCHAR(10),
    city VARCHAR(100),
    state_province VARCHAR(100),
    country_id INT,
    PRIMARY KEY (transaction_id)
);
 delimiter //
CREATE TRIGGER locations_insert_trigger AFTER INSERT ON locations
FOR EACH ROW
BEGIN
    INSERT INTO locations_info (transaction_type, location_id, street_address, postal_code, city, state_province, country_id)
    VALUES ('INSERT', NEW.location_id, NEW.street_address, NEW.postal_code, NEW.city, NEW.state_province, NEW.country_id);
END;
CREATE TRIGGER locations_update_trigger AFTER UPDATE ON locations
FOR EACH ROW
BEGIN
    INSERT INTO locations_info (transaction_type, location_id, street_address, postal_code, city, state_province, country_id)
    VALUES ('UPDATE', NEW.location_id, NEW.street_address, NEW.postal_code, NEW.city, NEW.state_province, NEW.country_id);
END;
CREATE TRIGGER locations_delete_trigger AFTER DELETE ON locations
FOR EACH ROW
BEGIN
    INSERT INTO locations_info (transaction_type, location_id, street_address, postal_code, city, state_province, country_id)
    VALUES ('DELETE', OLD.location_id, OLD.street_address, OLD.postal_code, OLD.city, OLD.state_province, OLD.country_id);
END;
 //
SELECT *FROM locations_info;

/*3.*/
CREATE VIEW employee_information AS
SELECT e.first_name, e.last_name, e.salary, d.department_name, l.city, l.postal_code
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE LENGTH(a.postal_code) < 5;

/*4. Explain ACID properties with an example
-Atomicity ensures that a transaction is treated as a single, indivisible unit of work. It guarantees that all changes made by a transaction are either successfully applied or none are applied at all. For example, a bank transfer transaction deducts funds from one account and adds them to another. If any part of the transaction fails, the entire transaction is rolled back, ensuring the consistency of the database.
-Consistency ensures that a transaction brings the database from one valid state to another. It enforces integrity constraints and rules, ensuring that only valid and allowed changes are applied to the database. For instance, if a transaction violates a constraint (e.g., age must be above 18), it is rolled back, preserving the consistency of the data.
-Isolation guarantees that concurrent transactions do not interfere with each other. Each transaction operates independently and does not see intermediate or uncommitted changes made by other transactions. This property prevents data inconsistencies due to concurrent access. For example, two users simultaneously updating the same bank account balance will not interfere with each other, ensuring data integrity.
-Durability ensures that once a transaction is committed, its changes are permanent and survive subsequent failures. Committed data is stored in a durable medium (e.g., disk) and can be recovered even after system crashes or power outages. For instance, if a successful deposit transaction is committed, the deposited amount remains intact and can be retrieved after system recovery.
*/

/*5.The Occupation field is the index field for the values 1, 3, 2, 5 and 4 because the Occupational field will produce the numbers 1, 3, 2, 5 and 4 when sorted lexicographically.*/
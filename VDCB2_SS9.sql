CREATE DATABASE IF NOT EXISTS hospital_db;

USE hospital_db;

DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
    id int PRIMARY KEY AUTO_INCREMENT,
    full_name varchar(255) NOT NULL,
    phone varchar(20) NOT NULL,
    age int,
    address varchar(255)
);

DELIMITER //
CREATE PROCEDURE seedPatients ()
BEGIN
DECLARE
    i int DEFAULT 1;
    START TRANSACTION;
    WHILE i <= 500000 DO INSERT INTO patients (full_name, phone, age, address)
        VALUES (CONCAT('Patient ', i), CONCAT('090', i), FLOOR(RAND () * 100), 'Ho Chi Minh City');
    SET i = i + 1;
END WHILE;
    COMMIT;
END //
DELIMITER ;
CALL seedPatients ();

EXPLAIN
SELECT
		*
FROM
		patients
WHERE
		phone = '090400000';
    
SELECT 
    *
FROM
    patients
WHERE
    phone = '090400000';
    
CREATE INDEX idx_patients_phone ON patients (phone);

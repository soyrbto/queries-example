
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);


CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;


INSERT INTO employee VALUES(100, 'Jose', 'Hernandez', '1955-10-15', 'M', 310000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Central Branch - Madrid', 100, '2000-01-07');


UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES (101, 'Maria', 'Romero', '1969-09-19', 'F', 160000, 100, 1);




INSERT INTO employee VALUES(102, 'Manuel', 'Garcia', '1955-03-22', 'M', 81000, 100, NULL);

INSERT INTO branch VALUES(2, 'Barcelona', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Cristina', 'Martin', '1980-09-13', 'F', 59000, 102, 2);
INSERT INTO employee VALUES(104, 'Marta', 'Diaz', '1990-02-10', 'F', 50000, 102, 2);
INSERT INTO employee VALUES(105, 'Carlos', 'Ramirez', '1982-01-21', 'M', 60000, 102, 2);




INSERT INTO employee VALUES(106, 'Javier', 'Serrano', '1956-10-17', 'M', 91000, 100, NULL);

INSERT INTO branch VALUES(3, 'Valencia', 106, '1995-04-19');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Alberto', 'Sanz', '1974-05-28', 'M', 72000, 106, 3);
INSERT INTO employee VALUES(108, 'Ruben', 'Ortega', '1970-10-06', 'M', 60000, 106, 3);




INSERT INTO branch_supplier VALUES(2, 'Finlo', 'Internet Provider');
INSERT INTO branch_supplier VALUES(2, 'Lussoto', 'Computer Hardware');
INSERT INTO branch_supplier VALUES(3, 'Laz LTD', 'Phone Software and Hardware');
INSERT INTO branch_supplier VALUES(2, 'A.G.P', 'Security');
INSERT INTO branch_supplier VALUES(3, 'Loop On', 'Marketing');
INSERT INTO branch_supplier VALUES(3, 'RRA LTD', 'Machinery');
INSERT INTO branch_supplier VALUES(3, 'Ressled', 'Accounting');




INSERT INTO client VALUES(400, 'Limmul University', 2);
INSERT INTO client VALUES(401, 'Berledo University', 2);
INSERT INTO client VALUES(402, 'Waldot College', 2);
INSERT INTO client VALUES(403, 'Sarzedo College', 2);
INSERT INTO client VALUES(404, 'Firrobe School', 2);
INSERT INTO client VALUES(405, 'Landwir School', 2);
INSERT INTO client VALUES(406, 'Rundan School', 2);




INSERT INTO works_with VALUES(105, 400, 130000);
INSERT INTO works_with VALUES(102, 401, 33000);
INSERT INTO works_with VALUES(108, 402, 150000);
INSERT INTO works_with VALUES(107, 403, 66000);
INSERT INTO works_with VALUES(108, 403, 18000);
INSERT INTO works_with VALUES(105, 404, 101000);
INSERT INTO works_with VALUES(107, 405, 120000);
INSERT INTO works_with VALUES(102, 406, 16000);
INSERT INTO works_with VALUES(105, 406, 19000);

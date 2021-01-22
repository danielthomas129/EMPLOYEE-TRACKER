DROP DATABASE IF EXISTS employeesdb;
CREATE DATABASE employeesdb;
USE employeesdb;
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

INSERT INTO department
    (name)
VALUES
    ('Operations'),
    ('Support'),
    ('Sales'),
    ('Executive');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('General Manager', 120000, 1),
    ('Department Manager', 65000, 1),
    ('Brand Manager', 60000, 2),
    ('Sales Associate', 40000, 3),
    ('Makeup Artist',50000, 2);
  
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Erica', 'Brown', 1, NULL),
    ('April', 'Porter', 2, 1),
    ('Daniel', 'Thomas', 3, NULL),
    ('Sarah', 'Brown', 4, 3),
    ('Lana', 'Mock', 5, NULL),
    ('Juju', 'Choy', 5, 5),
    ('Rolanda', 'Brown', 5, NULL),
    ('Alex', 'Moore', 5, 7);
    

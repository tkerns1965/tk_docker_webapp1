DROP DATABASE IF EXISTS tkdw-db1;
CREATE DATABASE IF NOT EXISTS tkdw-db1;
USE tkdw-db1;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS company,
                     job,
                     timesheet,
                     phase, 
                     employee, 
                     class, 
                     hours;

CREATE TABLE company (
    company_no  TINYINT  NOT NULL,
    PRIMARY KEY (company_no)
);

CREATE TABLE job (
    company_no  TINYINT      NOT NULL,
    job_id      INT          NOT NULL  AUTO_INCREMENT,
    job_code    VARCHAR(10)  NOT NULL,
    PRIMARY KEY (job_id)
);

CREATE TABLE timesheet (
    job_id          INT          NOT NULL,
    timesheet_id    INT          NOT NULL  AUTO_INCREMENT,
    timesheet_date  DATE         NOT NULL,
    craft_code      VARCHAR(10)  NOT NULL,
    weather         VARCHAR(50),
    temperature     VARCHAR(20),
    PRIMARY KEY (timesheet_id)
);

CREATE TABLE phase (
    timesheet_id  INT           NOT NULL,
    phase_id      INT           NOT NULL  AUTO_INCREMENT,
    phase_code    VARCHAR(20)   NOT NULL,
    phase_note    VARCHAR(100),
    PRIMARY KEY (phase_id)
);

CREATE TABLE employee (
    timesheet_id   INT           NOT NULL,
    employee_id    INT           NOT NULL  AUTO_INCREMENT,
    employee_code  VARCHAR(11)   NOT NULL,
    employee_note  VARCHAR(100),
    PRIMARY KEY (employee_id)
);

CREATE TABLE class (
    employee_id     INT           NOT NULL,
    class_id        INT           NOT NULL  AUTO_INCREMENT,
    class_code      VARCHAR(10)   NOT NULL,
    class_note      VARCHAR(100),
    equipment_code  VARCHAR(10),
    equipment_note  VARCHAR(100),
    PRIMARY KEY (class_id)
);

CREATE TABLE hours (
    phase_id         INT           NOT NULL,
    class_id         INT           NOT NULL,
    labor_hours      DECIMAL(4,2)  NOT NULL,
    equipment_hours  DECIMAL(4,2),
    PRIMARY KEY (phase_id,class_id)
);

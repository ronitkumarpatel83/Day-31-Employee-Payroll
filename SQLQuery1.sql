create database payroll_service_DB;
use payroll_service_DB;
------------UC-2--------------
CREATE TABLE employee_payroll_DB (
Id int identity(1,1) Primary key,
Name varchar(200),
Salary float,
Startdate datetime
);
------------UC-3--------------
INSERT INTO employee_payroll_DB (Name,Salary,Startdate) 
VALUES ('Ronit',25000,'1999-01-04'),('Dibya',20000,'2002-11-06'),
('KD',24000,'2010-01-01'),('Abhi',20000,'2022-02-21');
-----------UC-4---------------
select * from employee_payroll_DB;

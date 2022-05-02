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
-----------UC-5---------------
select * from employee_payroll_DB where Name = 'Ronit';
select * from employee_payroll_DB where Startdate between CAST('2000-01-01' as Date) and GETDATE();
-----------UC-6---------------
select * from employee_payroll_DB;
ALTER TABLE employee_payroll_DB add Gender char(1);
UPDATE employee_payroll_DB set Gender = 'F' where Id = 2;
UPDATE employee_payroll_DB set Gender ='M' where Id = 1 or Id = 3 or Id = 4;
----------------UC-7--------------
select * from employee_payroll_DB;
select SUM(Salary) as Total_Salary from employee_payroll_DB;
select AVG(Salary) as Average_Salary from employee_payroll_DB;
select MIN(Salary) as Minimum_Salary from employee_payroll_DB;
select MAX(Salary) as Maximum_Salary from employee_payroll_DB;
select COUNT(Salary) as NUmber_of_Employee from employee_payroll_DB;
select MAX(Salary),Gender from employee_payroll_DB GROUP BY gender;
---------------UC-8-----------------------
select * from employee_payroll_DB;
ALTER TABLE employee_payroll_DB Add Phone bigint;
ALTER TABLE employee_payroll_DB Add Department varchar(200) not null default 'Information Technology';
ALTER TABLE employee_payroll_DB Add Address varchar(200) default 'Odisha';

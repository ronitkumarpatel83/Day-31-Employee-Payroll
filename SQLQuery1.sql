create database payroll_service_DB;
use payroll_service_DB;
------------UC-2--------------
CREATE TABLE employee_payroll_DB (
Id int identity(1,1) Primary key,
Name varchar(200),
Salary float,
Startdate datetime
);

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
---------------UC-9-----------------------
select * from employee_payroll_DB;
EXEC sp_rename 'employee_payroll_DB.Salary','BasicPay','COLUMN';
ALTER TABLE employee_payroll_DB Add Deduction float,TaxablePay float,IncomeTax float,NetPay float;
----------------UC-10---------------------
INSERT INTO employee_payroll_DB (Name,BasicPay,Startdate,Gender)
VALUES ('Terissa',3000000,'2010-05-03','F');
UPDATE employee_payroll_DB set Address = NULL where Name = 'Terissa';
UPDATE employee_payroll_DB set Startdate = '2019-11-13' where Name = 'Terissa';
UPDATE employee_payroll_DB set Department = 'Sales' where Name = 'Terissa';
INSERT INTO employee_payroll_DB (Name,BasicPay,Startdate,Gender,Phone,Department,Address,Deduction,TaxablePay,IncomeTax,NetPay)
VALUES ('Terissa',3000000,'2018-01-03','F',1234567890,'Marketing','Mumbai',1000000,2000000,500000,1500000);
select * from employee_payroll_DB;
select * from employee_payroll_DB where Name = 'Terissa';

----------------UC-11----------------------
create table Department( dept_id int primary key identity(1,1),
dept_name varchar(255),
emp_id int FOREIGN KEY REFERENCES employee_payroll_DB(Id));

create table pay_roll(basic_pay float,
deduction float,
income_tax float,
net_pay float,
taxable_pay float,
emp_id int FOREIGN KEY REFERENCES employee_payroll_DB(Id));

create table company( company_id int primary key identity(1,1),
company_name varchar(255),
emp_id int FOREIGN KEY REFERENCES employee_payroll_DB(Id));


---------------UC-12----------------------
select * from employee_payroll_DB; ----UC-4--
select * from employee_payroll_DB where Name = 'Ronit';------UC-5--------
select * from employee_payroll_DB where Startdate between CAST('2000-01-01' as Date) and GETDATE();------UC-5--------
select SUM(BasicPay) as Total_Salary from employee_payroll_DB;
select AVG(BasicPay) as Average_Salary from employee_payroll_DB;
select MIN(BasicPay) as Minimum_Salary from employee_payroll_DB;
select MAX(BasicPay) as Maximum_Salary from employee_payroll_DB;
select COUNT(BasicPay) as NUmber_of_Employee from employee_payroll_DB;
select SUM(BasicPay)as Total_Group_Of_Female from employee_payroll_DB WHERE Gender = 'F' GROUP BY gender;

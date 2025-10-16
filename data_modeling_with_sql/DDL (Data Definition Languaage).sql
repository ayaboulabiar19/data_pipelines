-- create database company 
create database company ;
--use the database company 
use company;

--Create table department 
--Tracks department details, including its number, label, and manager's name.
create table department(
num_s int primary key , -- type of num_s is integer and  primary key 
labeel varchar(255) , -- type of labes is string 
manager_name varchar(255)); -- type of manager_name is  string 

--Create table employee
--Tracks employee information such as number, name, position, salary, and the department they belong to. 
create table employee(
num_e int primary key , --  type of num_e is integer and is a  primary key 
name_e varchar(255), -- type of name is string
position varchar (255),--type of position is string 
salary decimal(10,2),--type of salary is decimal 
num_s int ,--type of num_s if integer 
foreign key (num_s) references department (num_s) ); -- foreign key num_s  references  in department table 


--Create table project 
--Tracks project information like number, title, start date, end date, and the department it is assigned to.
create table project (
num_p int primary key , -- type of num_p is integer and is a primary key 
title varchar(255), --type of title is string 
starte_date date,-- type of start_date is DATE 
end_date date , -- type of end_date is DATE 
num_s int, --type of num_s is integer 
foreign key (num_s) references department (num_s));  -- Define foreign keys to establish relationships between tables, ensuring referential integrity. 

--Create employee_project 
--Tracks the participation of employees in projects, including their roles.
create table employee_project ( -- table d'assocication contient des primary key et foreign key au mm temps 
num_e int ,--type of num_e is integer 
num_p int, -- type of num_p is integer 
--Include Primary and Foreign Keys
--Define foreign keys to establish relationships between tables, ensuring referential integrity.
primary key (num_e ,num_p) ,-- num_p and num_e both of them are primary key's
foreign key (num_e) references employee(num_e), -- num_e is a foreign key from employee 
foreign key (num_p) references project (num_p));  --num_p is a foreign key from project

 use company;

--Insert Records: 
--Department

--Num_S = 1, Label = "IT", Manager_Name = "Alice Johnson"
--Num_S = 2, Label = "HR", Manager_Name = "Bob Smith"
--Num_S = 3, Label = "Marketing", Manager_Name = "Clara Bennett" 
 insert into department values (1,'IT','alice johnson'); 
 insert into department values (2,'HR','BOB Smith');
 insert into department values (3,'Marketing','Clara Bennett');

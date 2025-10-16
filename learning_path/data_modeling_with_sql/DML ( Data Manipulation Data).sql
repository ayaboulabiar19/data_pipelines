use  company;
1--Insert Records:
--  Write the appropriate SQL queries to insert all the provided records into their respective tables.
	INSERT INTO department VALUES (1, 'IT', 'Alice Johnson'),
								(2, 'HR', 'Bob Smith'),
								(3, 'Marketing' , 'Clara Bennett');

	INSERT INTO employee VALUES (101, 'Joe Doe', 'Developer', 60000.0 , 1),
								(102, 'Jane Smith' , 'Analyst', 55000.00, 2),
								(103, 'Mike Brown', 'Designer ', 50000.00, 3),
								(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
								(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);



	INSERT INTO employee_Project VALUES (101, 201, 'Frontend Developer'),
										(104, 201, 'Backend Developer'),
										(102, 202, 'Trainer'),
										(105, 202, 'Coordinator'),
										(103, 203, 'Research Lead'),
										(101, 204, 'Network Specialist');
										
	INSERT INTO project VALUES (201,'Website Redesign', '2024-01-15', '2024-06-30', 1),
							(202,'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
							(203,'Market Research', '2024-02-01', '2024-07-31', 3),
							(204,'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);

--2/Update a Record: 
--Update the Role of Employee_Num_E = 101 in the Employee_Project table to "Full Stack Developer".

	update Employee_Project
	set role='Full Stack Developer'
	where  Employee_Num_E = 101; 


--3/ Delete a Record:
-- Delete the employee with Num_E = 103 from the Employee table 
--and remove their corresponding entries in the Employee_Project table

	DELETE FROM employee_project WHERE  Num_E=103;
	DELETE FROM employee WHERE  Num_E=103;


-- DQL part (select queries):
--1/ select names from employee
	select name_e  
	from employee;  

--2
	select e.name_e as employee_name,-- select names as alias  
	e.salary 
	from employee as e -- from which table 
	where salary >5000; --condition 

--3 
	select name_e , position, salary -- select name , postion AND salary 
	from employee --Which table 
	where position ='developer' or salary >5000 ; -- conditions: salary >5000 and position=developer

--4
	select name_e 
	from employee 
	where name_e like '%e%'; -- where in the names there is "e" 

--5 

	select name_e , salary 
	from employee
	where salary between 30000 and 70000 ; -- where salary between 30000 and 70000 includ 

--6
	select name_e , position 
	from employee 
	where position in ('Developer','Analyst','Designer ');-- select all employees who is her position developer or nalyst or designer 

--7

	select num_e
	from employee 
	where num_e is  NOT NULL ;-- where the column num_e is not null 

--8
	select *
	from employee 
	where name_e like 'Jane Smith' and position ='Analyst';	-- 2 conditions name and position 

--9 
	select *
	from employee 
	order by salary   ;--ordred ASC per default (to the highest salary )
	
--10 
	select CONCAT (name_e,' ', position) AS full_name , salary -- CONCAT: concatination the  name_e and  position As  full_name  and salary 
	from employee 
	ORDER BY full_name ASC ; -- ordred by ASC er default 

--11
select position , max(salary) as highest_salary -- show the highest salary in each position into the column highest_salary
from employee
group by position; 

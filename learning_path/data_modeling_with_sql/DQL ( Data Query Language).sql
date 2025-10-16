-- use the dataset company 
use company ; 
-- 1 Write a query to retrieve the names of employees 
--who are assigned to more than one project,
-- including the total number of projects for each employee.
select  name_e  ,COUNT(p.num_p) AS numberofproject 
from employee  as e -- which table can we used 
join project  as p -- join with other table 
on e.num_s = p.num_s -- on which data are joined 
Group by  e.name_e  -- grouped by employees names
having COUNT(p.num_p) > 1 -- count the number of project 
order by numberofproject  DESC; -- order DESC the number of project for each employee

--2 Write a query to retrieve the list of projects managed by each department,
-- including the department label and manager’s name
select title as listofprojects , labeel, manager_name
from project as p 
join  department as d
on p.num_s = d.num_s 
;

--3 Write a query to retrieve the names of employees working on the project "Website Redesign,
--including their roles in the project.

select name_e as nameofemployee , title as titleofproject , role as roledemployee 
from employee as  e 
join project as p 
on e.num_s = p.num_s

 join employee_project as ep
 on e.num_e = ep.num_e
where title='website Redesign'; 


--4 Write a query to retrieve the department with the highest number of employees,
-- including the department label, manager name, and the total number of employees.

SELECT   TOP 1
    D.labeel  AS DepartmentLabel, D.manager_name AS DepartmentManager ,   COUNT(E.num_e)  AS TotalEmployees 
	from employee as E
	join  department  as D
	on E.num_s = D.num_s
	GROUP BY  D.labeel , D.manager_name 
	ORDER BY
    TotalEmployees DESC 
	 ;  
--5 Write a query to retrieve the names and positions of employees 
--earning a salary greater than 60,000, including their department names.

select name_e AS NamesOfEmployees  , position , labeel As DepartementName
from employee as e
join department as d 
on e.num_s = d.num_s
where  salary > 60.000 ;


--6 Write a query to retrieve the number of employees assigned to each project, including the project title.
select  p.num_p AS NumProject , p.title AS  TitleOfProject , count( num_e) AS NombreDemployee 
from employee as e 
join project as p 
on e.num_s=p.num_s 
GROUP BY p.num_p  , p.title -- wa9ali nel9aw each 
 ; 

--7 Write a query to retrieve a summary of roles employees have across different projects, 
--including the employee name, project title, and role.

SELECT E.name_e AS NameEmployee,  P.title AS ProjectTitle, EP.role AS ProjectRole
FROM  employee AS E
JOIN
    employee_project AS EP 

	ON E.num_e = EP.num_e
JOIN
    project AS P 
	
	ON EP.num_p = P.num_p
ORDER BY  E.name_e,  P.title , EP.Role; 



--8 Write a query to retrieve the total salary expenditure for each department, 
--including the department label and manager name.

 select sum(salary) AS TotalSalary , d.labeel as DepartmentLabel , d.manager_name AS DepartmentManager 
 from employee as e 
 join department as d 
 on e.num_s = d.num_s 
 group by  d.labeel , d.manager_name   
  ORDER BY
     TotalSalary , d.manager_name  ;


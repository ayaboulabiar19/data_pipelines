use company ; 


-- 1 
select  name_e  ,COUNT(p.num_p) AS numberofproject 
from employee  as e
join project  as p 
on e.num_s = p.num_s
Group by  e.name_e 
having COUNT(p.num_p) > 1 
order by numberofproject  DESC; 

--2 
select title as listofprojects , labeel, manager_name
from project as p 
join  department as d
on p.num_s = d.num_s 
;

--3 
select name_e as nameofemployee , title as titleofproject , role as roledemployee 
from employee as  e 
join project as p 
on e.num_s = p.num_s

 join employee_project as ep
 on e.num_e = ep.num_e
where title='website Redesign'; 

use company;


use company;
--4
SELECT   TOP 1
    D.labeel  AS DepartmentLabel, D.manager_name AS DepartmentManager ,   COUNT(E.num_e)  AS TotalEmployees 
	from employee as E
	join  department  as D
	on E.num_s = D.num_s
	GROUP BY  D.labeel , D.manager_name 
	ORDER BY
    TotalEmployees DESC 
	 ;  
--5 
select name_e AS NamesOfEmployees  , position , labeel As DepartementName
from employee as e
join department as d 
on e.num_s = d.num_s
where  salary > 60.000 ;


--6
select  p.num_p AS NumProject , p.title AS  TitleOfProject , count( num_e) AS NombreDemployee 
from employee as e 
join project as p 
on e.num_s=p.num_s 
GROUP BY p.num_p  , p.title -- wa9ali nel9aw each 
 ; 

--7

SELECT E.name_e AS NameEmployee,  P.title AS ProjectTitle, EP.role AS ProjectRole
FROM  employee AS E
JOIN
    employee_project AS EP 

	ON E.num_e = EP.num_e
JOIN
    project AS P 
	
	ON EP.num_p = P.num_p
ORDER BY  E.name_e,  P.title , EP.Role; 

--8
 select sum(salary) AS TotalSalary , d.labeel as DepartmentLabel , d.manager_name AS DepartmentManager 
 from employee as e 
 join department as d 
 on e.num_s = d.num_s 
 group by  d.labeel , d.manager_name   
  ORDER BY
     TotalSalary , d.manager_name  ;


--ex01 
select count(*)
from employees
where salary < (select avg(salary)
                from employees);
                
--ex02
select employee_id,
       first_name,
       salary
from employees
where salary >= (select avg(salary)
                 from employees)
order by salary asc;
                                                
--ex03
select emp.first_name||last_name as "Name",
       loc.location_id,
       loc.street_address,
       loc.postal_code,
       loc.city,
       loc.state_province,
       loc.country_id
from employees emp, departments dep, locations loc
where emp.department_id = dep.department_id
  and dep.location_id = loc.location_id
  and (emp.first_name, emp.last_name) =all (select first_name, last_name
                                      from employees
                                      where first_name ='Steven' and
                                            last_name = 'King');
                                           
--ex04
select employee_id,
       first_name,
       salary
from employees
where salary <any (select salary
                   from employees
                   where job_id = 'ST_MAN')
order by salary desc;

--ex05
select *
from employees emp
where (emp.department_id, emp.salary) in (
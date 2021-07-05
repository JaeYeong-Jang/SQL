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
select emp.employee_id,
       emp.first_name,
       emp.salary,
       emp.department_id
from employees emp
where (emp.department_id, emp.salary) in (select department_id, max(salary)
                                          from employees
                                          group by department_id)
order by salary desc;

--ex06
select job_title,
       sum(salary)
from jobs job, employees emp
where job.job_id = emp.job_id
group by job_title
order by sum(salary) desc;

--ex07
select emp.employee_id,
       emp.first_name,
       emp.salary
from employees emp, (select department_id, avg(salary) salary
                     from employees
                     group by department_id) s
where emp.department_id = s.department_id and emp.salary > s.salary;
                
--ex08

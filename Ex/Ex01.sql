--ex01
    select first_name "이름",
    salary "월급",
    phone_number "전화번호",
    hire_date "입사일"
    from employees
    order by hire_date asc;
    
 --ex02
   select job_title,
   max_salary
   from jobs
   order by max_salary desc;
   
--ex03
   select first_name,
   manager_id,
   commission_pct,
   salary
   from employees
   where manager_id is not null and
   commission_pct is NULL and salary > 3000;
   
--ex04
   select job_title,
   max_salary
   from jobs
   where max_salary >= 10000
   order by max_salary desc;
   
--ex05
   select first_name,
   salary,
   nvl(commission_pct, 0)
   from employees
   where salary >= 10000 and salary < 14000
   order by salary desc;
   
--ex06
   select first_name,
   salary,
   to_char(hire_date,'yyyy-mm'),
   department_id
   from employees
   where department_id = 10 or department_id = 90 or department_id = 100;
   
--ex07
   select first_name,
   salary
   from employees
   where first_name like('%s%') or first_name like('%S%');
   
--ex08
   select department_name
   from departments
   order by LENGTH(department_name)desc;
   
--ex09
   select upper(country_name)
   from countries
   order by country_name asc;
   
--ex10
   select first_name,
   salary,
   replace(phone_number, '.', '-'),
   hire_date
   from employees;
   
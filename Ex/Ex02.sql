--ex01
select count(manager_id) as "haveMngCnt"
from employees;

--ex02
select 
    max(salary)as "최고임금", 
    min(salary)as "최저임금",
    max(salary) - min(salary) as "최고임금 - 최저임금"
from employees;

--ex03
select max(to_char(hire_date,'yyyy"년"mm"월"dd"일"'))as "마지막 사원 입사일"
from employees;

--ex04
select 
    department_id as"부서아이디",
    avg(salary) as "평균 임금",
    max(salary) as "최고 임금",
    min(salary) as "최저 임금"
from employees
group by department_id
order by department_id desc;

--ex05
select 
    job_id as "업무",
    round(avg(salary),0) as "평균 임금",
    max(salary) as "최고 임금",
    min(salary) as "최저 임금"
from employees
group by job_id
order by 
    min(salary) desc,
    avg(salary)asc;

--ex06
select min(to_char(hire_date,'yyyy"-"mm"-"dd day')) as "최장기 근속 직원"
from employees;

--ex07
select
    department_id as "부서",
    avg(salary) as "평균임금",
    min(salary) as "최저임금",
    avg(salary)-min(salary) as "(평균임금-최저임금)"
from employees
group by department_id
having (avg(salary)-min(salary)) <2000
order by (avg(salary)-min(salary)) desc;

--ex08 employees
select 
    job_id as "부서",
    max(salary) as "최고임금",
    min(salary) as "최저임금",
    max(salary)-min(salary) as "임금차이"
from employees
group by job_id
order by max(salary)-min(salary) desc;

--ex08 jobs
select 
    job_title as "업무명",
    max_salary as "최고임금",
    min_salary as "최저임금",
    max_salary-min_salary as "최고,최저 임금차이"
from jobs
order by max_salary-min_salary desc;

--ex09 
select 
    manager_id as "관리자",
    hire_date,
    round(avg(salary),1) as "평균급여",
    min(salary) as "최소급여",
    max(salary) as "최대급여"
from employees
group by hire_date,manager_id
having to_char(hire_date) >= '05/00/00' and avg(salary) >= 5000
order by avg(salary) desc;

--ex10
select 
    hire_date,
    case when hire_date <= '02/12/31' then '창립멤버'
    when hire_date >= '03/01/01' and hire_date < '04/01/01' then '03년입사'
    when hire_date >= '04/01/01' and hire_date < '05/01/01' then '04년입사'
    else '상장이후입사'
    end as "입사일"
from employees
order by hire_date asc;
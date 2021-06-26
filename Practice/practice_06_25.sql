--그룹함수 avg() null일 때 0으로 변환해서 사용
select 
count(*), --전체 갯수 107
count(commission_pct), --35 commission_pct 값이 있는 직원
sum(commission_pct), -- 전체 합계

avg(commission_pct), -- null을 제외한 평균값 평균은 35 인원으로 계산
sum(commission_pct)/count(commission_pct), -- null 제외 --> 7.8/35

avg(nvl(commission_pct,0)), -- null을 0으로 변경해서 평균에 계산
sum(commission_pct)/count(*) --null 포함 --> 7.8/107
from employees;

-- 그룹함수 max() min()
select max(salary), min(salary)
from employees;

select first_name, salary
from employees
order by salary desc;

select first_name,max(salary) -- 오류 --> 최종적으로는 이렇게 표현해야함(?)
from employees;

-- Group by 절
--전체 부서 , 급여 출력
select department_id, salary
from employees
order by department_id asc;

--부서번호, 부서별 평균
select department_id, avg(salary)
from employees
group by department_id --> 그룹별로 묶기
order by department_id asc;

--group by 절 사용 시 주의사항

select department_id, count(*), sum(salary)
from employees
group by department_id
order by department_id asc;

-- 잘못된 경우
select department_id, job_id, count(*), sum(salary) -- group by에 참여한 컬럼이나 그룹함수만 올 수 있다.
from employees
group by department_id
order by department_id asc;

--그룹 세분화
select department_id, job_id, avg(salary)
from employees
group by department_id, job_id;

select department_id, job_id, count(*), sum(salary)
from employees
group by department_id, job_id
order by department_id asc, job_id asc;

--group by 예제
select department_id,count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000 --> group by절은 where절을 사용 할 수 없다. having 절을 사용해야 한다.
order by department_id;

-- sum(salary) > 20000 이상이면서 부서코드 100인 숫자, 급여합계
select department_id, count(*), sum(salary)
from employees
where department_id = 100
group by department_id
having sum(salary) >= 20000
order by department_id asc;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000 and department_id = 100
order by department_id asc; -- 정렬은 언제나 마지막에

--case ~end 문 (case when then else ~ end)
 select 
    employee_id, 
    job_id, 
    salary,
    case
        when job_id = 'AC_ACCOUNT' then salary+salary*0.1
        when job_id = 'SA_REP' then salary+salary*0.2
        when job_id = 'ST_CLERK' then salary+salary*0.3
        else salary
    end as realSalary
    
 from employees;
 
 -- decode()
 select 
    employee_id,
    salary,
    
    decode(job_id,
        'AC_ACCOUNT',salary + salary*0.1,
            'SA_REP', salary+salary*0.2,
                'ST_CLERK',salary+salary*0.3,
                    salary)as realSalary
                    
 from employees;
 
select 
    first_name, 
    department_id,
    decode(department_id,
            department_id between 10 and 50, 'A-TEAM',
                department_id between 60 and 110, 'B-TEAM',
                    department_id between 110 and 150, 'C-TEAM',
                        '팀없음')as team
from employees;
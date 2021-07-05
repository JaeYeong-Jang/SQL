/*EQUI join --> null 포함되지 않음

OUTER join (left outer join) --> null 포함시켜야 할 때
(+) <-- 오라클 표현법
self join 

*/

--SUB QUERY 
--salary가 Den보다 높은 사람 출력
-------------------------------
--두번에 나눠서 표현한 잘못된 사례
select salary
from employees
where first_name = 'Den';

select first_name,
       salary
from employees
where salary >= '11000';
-------------------------------

--SUB QUERY를 사용하여 한번에 표현
select employee_id,
       first_name,
       salary
from employees
where salary >= (select salary
                from employees
                where first_name ='Den');
                
--급여를 가장 적게 받는 사람의 이름,급여,사번
select first_name as "이름",
       salary as "급여",
       employee_id as "사번"
from employees
where salary = (select min(salary)
                from employees);
                
--평균 급여보다 적게 받는 사람의 이름, 급여
select first_name,
       salary
from employees
where salary <= (select avg(salary)
                from employees);

-- 다중행 SubQuery
--부서 번호가 110번인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요
--잘못된 표현

-------------------------------
select first_name, salary
from employees
where department_id = 110;

select first_name,
       salary
from employees
where salary = 12008 
      or salary = 8300;
      
select first_name,
       salary
from employees
where salary in(12008,8300);
-------------------------------

--올바른 표현
select employee_id,
       first_name,
       employees.salary
from employees
where salary in (select salary
                 from employees
                 where department_id = '110');

--각 부서별 최고급여를 받는 사원 출력

select  department_id,
        max(salary)
from employees
group by department_id;


--다중행in 을 사용하여 department_id 와 salary가 동시에 같은 경우의 정보를 가져온다.
--(동시에 여러가지 값을 비교할 수 있음)
select first_name,
       employee_id,
       department_id,
       salary
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                         from employees
                                         group by department_id);
                                         
-- 다중행 ANY
--부서 번호가 110번인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요 ( any --> or연산 -->8300보다 큰)

--1.부서번호가 110번인 사원 리스트 
select salary
from employees
where department_id = 110;

--2.부서번호가 110번인 직원급여 ( 12008, 8300 ) 보다 급여가 큰 직원리스트
select employee_id,
       first_name,
       salary
from employees
where salary > 12008 or
      salary > 8300;

--다중행 any연산자 사용
select first_name,
       salary
from employees
where salary >any (select salary
                   from employees
                   where department_id = 110);
                   
--다중행 all연산자 사용
select first_name,
       salary
from employees
where salary >all (select salary
                   from employees
                   where department_id = 110;
                   
-- 각 부서별로 최고급여를 받는 사원을 출력

select first_name,
       department_id,
       salary
from employees
where (department_id,salary) in (select department_id,
                                        max(salary)
                                 from employees
                                 group by department_id);
                                 
--각 부서별 최고급여를 받는 사원을 출력 (join)
--1.각 부서별 최고 급여 테이블. s

select department_id, 
       max(salary)
from employees
group by department_id;

--2.직원 테이블과 조인한다. e
    --e.부서번호 = s.부서번호   e.급여 = s.급여(최고급여)
select e.first_name,
       e.employee_id,
       e.salary,
       s.department_id,
       s.salary
from employees e, (select department_id,
                           max(salary) as salary
                   from employees
                   group by department_id) s
where e.department_id = s.department_id
      and e.salary = s.salary;

-- Rownum 
--급여를 가장 많이 받는 5명의 직원의 이름을 출력.

select first_name,
       salary
from employees
order by salary desc;


--정렬을 하면 rownum이 섞인다. --> 정렬을 하고 rownum한다.
select rownum,
       first_name,
       salary
from employees
order by salary desc;

--정렬을 하고 rownum

select rownum rnum,
       ot.employee_id,
       ot.first_name,
       ot.salary,
       ot.hire_date
from (select employee_id,
             first_name,
             salary,
             hire_date
      from employees
      order by salary desc) ot -- 테이블을 정렬이 된 상태의 것을 사용할때 
where rownum >= 1 
      and rownum <= 5;
      
-- 정렬을 하고, rownum하고 where절을 한다.
select employee_id,
       first_name,
       salary
from employees
order by salary desc; -- 테이블로 본다. (정렬한 테이블)

select ort.rn,
       ort.employee_id,
       ort.first_name,
       ort.salary
from (select rownum rn,
             ot.employee_id,
             ot.first_name,
             ot.salary
      from (select employee_id,
                   first_name,
                   salary
            from employees
            order by salary desc) ot
            ) ort
where rn >= 2
      and rn <= 5;
      
-- 07년 입사한 직원중 급여가 많은 직원 중 3에서 7등의 이름, 급여, 입사일 출력
select ort.rn,
       ort.first_name,
       ort.salary,
       ort.hire_date
from (select rownum rn,
       ot.first_name,
       ot.salary,
       ot.hire_date
      from (select first_name,
                   salary,
                   hire_date
            from employees
            where hire_date > '07/01/01'
                  and hire_date <= '07/12/31'
            order by salary desc) ot) ort
where rn >= 3
      and rn <= 7;

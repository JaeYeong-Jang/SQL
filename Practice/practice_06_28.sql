--EQUI JOIN

-- 카티젼 프로젝트
SELECT
    employee_id,
    first_name,
    emp.department_id
FROM
    employees    emp,
    departments  dep
WHERE
    emp.department_id = dep.department_id;

SELECT
    *
FROM
    employees;

SELECT
    *
FROM
    departments;

SELECT
    *
FROM
    locations;

--Primary key --> 특정 개인의 정보를 출력하기 위한 이정표(?)

--Foreign key --> 

SELECT
    emp.first_name         AS "이름",
    dep.department_name    AS "부서명",
    job.job_title          AS "업무명"
FROM
    employees    emp,
    departments  dep,
    jobs         job
WHERE
        emp.department_id = dep.department_id
    AND emp.job_id = job.job_id;
      
-- OUTER JOIN

-- left outer join (왼쪽 테이블의 모든 row를 결과 테이블에 나타냄)

SELECT
    emp.first_name,
    emp.department_id,
    dep.department_id
FROM
    employees    emp
    LEFT OUTER JOIN departments  dep ON emp.department_id = dep.department_id;
    
--oracle 표현법
SELECT
    emp.first_name,
    emp.department_id,
    dep.department_id
FROM
    employees    emp,
    departments  dep
WHERE
    emp.department_id = dep.department_id (+);

--right outer join (오른쪽 테이블의 모든 row 결과를 테이블에 나타냄)

SELECT
    emp.first_name,
    emp.department_id,
    dep.department_id,
    dep.department_name
FROM
    employees    emp
    RIGHT OUTER JOIN departments  dep ON emp.department_id = dep.department_id;
    
--oracle 표현법 
SELECT
    emp.first_name,
    emp.department_id,
    dep.department_id,
    dep.department_name
FROM
    employees    emp,
    departments  dep
WHERE
    emp.department_id (+) = dep.department_id;

-- righ join --> left join 위치교환
SELECT
    emp.first_name,
    emp.department_id,
    dep.department_id,
    dep.department_name
FROM
    departments  dep
    LEFT OUTER JOIN employees    emp ON dep.department_id = emp.department_id;
     
--Full outer join -->매칭 x 시 한번은 표현
SELECT
    *
FROM
    employees    emp
    FULL OUTER JOIN departments  dep ON emp.department_id = dep.department_id;
     
--Self join
SELECT
    emp.first_name,
    emp.employee_id,
    emp.department_id,
    emp.manager_id,
    man.first_name,
    man.employee_id,
    man.manager_id
FROM
    employees  emp,
    employees  man
WHERE
    emp.manager_id = man.employee_id;

-- 전혀 연관이 없는 salary와 location_id의 값이 같아서 join이 될 뿐 올바르지 않은 사용법이다.
SELECT
    *
FROM
    employees  em,
    locations  lo
WHERE
    em.salary = lo.location_id;
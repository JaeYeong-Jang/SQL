--ex01
SELECT
    emp.employee_id        AS "사번",
    emp.first_name         AS "이름",
    emp.last_name          AS "성",
    dep.department_name    AS "부서명"
FROM
    employees    emp,
    departments  dep
WHERE
    emp.department_id = dep.department_id
ORDER BY
    dep.department_name DESC,
    emp.employee_id;
         
--ex02
SELECT
    emp.employee_id        AS "사번",
    emp.first_name         AS "이름",
    emp.salary             AS "급여",
    dep.department_name    AS "부서명",
    job.job_title          AS "업무"
FROM
    employees    emp,
    departments  dep,
    jobs         job
WHERE
        emp.department_id = dep.department_id
    AND emp.job_id = job.job_id
ORDER BY
    emp.employee_id ASC;

--ex02-1
SELECT
    emp.employee_id        AS "사번",
    emp.first_name         AS "이름",
    emp.salary             AS "급여",
    dep.department_name    AS "부서명",
    job.job_title          AS "업무"
FROM
    employees    emp
    LEFT OUTER JOIN departments  dep ON emp.department_id = dep.department_id,
    jobs         job
WHERE
    emp.job_id = job.job_id
ORDER BY
    emp.employee_id ASC;

--ex03
SELECT
    loc.location_id        AS "도시아이디",
    loc.city               AS "도시명",
    dep.department_name    AS "부서명",
    dep.department_id      AS "부서아이디"
FROM
    departments  dep
    LEFT OUTER JOIN locations    loc ON dep.location_id = loc.location_id
ORDER BY
    loc.location_id ASC;

--ex03-1
SELECT
    loc.location_id        AS "도시아이디",
    loc.city               AS "도시명",
    dep.department_name    AS "부서명",
    dep.department_id      AS "부서아이디"
FROM
    locations    loc
    LEFT OUTER JOIN departments  dep ON loc.location_id = dep.location_id
ORDER BY
    loc.location_id ASC;

--ex04
SELECT
    reg.region_name     AS "지역이름",
    con.country_name    AS "나라이름"
FROM
    regions    reg,
    countries  con
WHERE
    reg.region_id = con.region_id
ORDER BY
    reg.region_name ASC,
    con.country_name DESC;

--ex05
SELECT
    emp.employee_id    AS "사번",
    emp.first_name     AS "이름",
    emp.hire_date      AS "고용일",
    man.first_name     AS "매니저이름",
    man.hire_date      AS "매니저 고용일"
FROM
    employees  emp,
    employees  man
WHERE
        emp.manager_id = man.employee_id
    AND man.hire_date > emp.hire_date;

--ex06
SELECT
    con.country_name       AS "나라명",
    con.country_id         AS "나라아이디",
    loc.city               AS "도시명",
    loc.location_id        AS "도시아이디",
    dep.department_name    AS "부서명",
    dep.department_id      AS "부서아이디"
FROM
    countries    con,
    locations    loc,
    departments  dep
WHERE
        con.country_id = loc.country_id
    AND loc.location_id = dep.location_id
ORDER BY
    con.country_name ASC;

--ex07
SELECT
    emp.employee_id                       AS "사번",
    emp.first_name || emp.last_name       AS "풀네임",
    emp.job_id                            AS "업무아이디",
    joh.start_date                        AS "시작일",
    joh.end_date                          AS "종료일"
FROM
    job_history  joh,
    employees    emp
WHERE
        joh.job_id = emp.job_id
    AND joh.job_id = 'AC_ACCOUNT';

--ex08
SELECT
    dep.department_id      AS "부서번호",
    dep.department_name    AS "부서명",
    emp.first_name         AS "매니저이름",
    loc.city               AS "도시명",
    con.country_name       AS "나라명",
    reg.region_name        AS "지역명"
FROM
    employees    emp,
    departments  dep,
    locations    loc,
    countries    con,
    regions      reg
WHERE
        emp.department_id = dep.department_id
    AND emp.employee_id = dep.manager_id
    AND dep.location_id = loc.location_id
    AND loc.country_id = con.country_id
    AND con.region_id = reg.region_id;

--ex09
SELECT
    emp.employee_id        AS "사번",
    emp.first_name         AS "이름",
    dep.department_id,
    dep.department_name    AS "부서명",
    man.first_name         AS "매니저이름"
FROM
    employees    emp,
    employees    man,
    departments  dep
WHERE
        emp.manager_id = man.employee_id
    AND emp.department_id = dep.department_id (+)
ORDER BY
    emp.employee_id ASC;

SELECT
    *
FROM
    employees    emp,
    employees    man,
    departments  dep
WHERE
        emp.manager_id = man.employee_id
    AND man.department_id = dep.department_id;
      
      
--ex09-2
SELECT
    emp.employee_id        AS "사번",
    emp.first_name         AS "이름",
    dep.department_name    AS "부서명",
    man.first_name         AS "매니저 이름"
FROM
    employees    emp,
    employees    man,
    departments  dep
WHERE
        man.employee_id = emp.manager_id
    AND emp.department_id = dep.department_id (+)
ORDER BY
    emp.employee_id ASC;
-- man.employee_id = emp.manager_id 랑 emp.manager_id = man.employee_id 가 다른가?
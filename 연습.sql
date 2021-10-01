-- 데이터조회 SELECT문(Statement)

SELECT
    *
FROM departments;

SELECT department_id, department_name, location_id, manager_id
FROM departments;

SELECT department_id as "부서  _번호", department_name as 부서이름, manager_id 매니저
FROM departments;
-- 공백이나 특수문자 사용해서 별칭 넣을 땐 큰따옴표("")로 묶기.
-- 'as'는 생략 가능

SELECT last_name, first_name, job_id, salary 월급, salary+130 "월급+130", salary-salary/10 "월급-10%"
FROM employees;

SELECT last_name, first_name, job_id, salary, (salary-1000)-(salary*0.05) 몰라
FROM employees;


-- 중복값 제거
SELECT distinct job_id
FROM employees;

SELECT employee_id, first_name, last_name
FROM employees;

SELECT first_name, salary, salary*1.1 as 급여인상
FROM employees;

SELECT employee_id 사원번호, first_name 이름, last_name 성
FROM employees;

SELECT first_name || ' apple ' || job_id as "직업 정보"
FROM employees;

SELECT employee_id, first_name || ' ' || last_name, email || '@naver.com'
FROM employees;


------------------------------------whrer 절--------------------------
SELECT salary
FROM employees
where salary > 4000;

SELECT last_name
FROM employees
WHERE last_name='King';












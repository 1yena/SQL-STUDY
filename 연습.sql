-- WHERE 절 사용하기

SELECT salary, last_name
FROM employees
WHERE salary > 14000;

SELECT last_name, first_name
FROM employees
WHERE last_name='King';

SELECT
    *
FROM employees
WHERE hire_date < '02/06/10';

SELECT
    *
FROM employees
WHERE employee_id=100;

SELECT
    *
FROM employees
WHERE first_name='David';

SELECT
    *
FROM employees
WHERE employee_id <= 105;

SELECT
    *
FROM job_history
WHERE start_date >= '06/03/03';

SELECT
    *
FROM departments
WHERE location_id != 1700;

SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60
AND salary > 5000
or department_id = 80
and salary > 10000
ORDER BY salary DESC;

SELECT last_name, department_id, salary
FROM employees
WHERE (department_id=60
OR department_id=80)
AND salary >= 9000;

SELECT
    *
FROM employees
WHERE hire_date > '08/04/04'
OR (salary > 13000
AND job_id='AD_VP');

SELECT *
FROM employees
WHERE NOT( hire_date > '04/01/01' OR salary > 5000);

SELECT job_id, salary, first_name, last_name
FROM employees
WHERE salary > 4000
AND job_id = 'IT_PROG';

SELECT salary, job_id, first_name, last_name
FROM employees
WHERE salary > 4000
AND (job_id = 'IT_PROG'
OR job_id = 'FI_ACCOUNT');

SELECT *
FROM employees
WHERE salary IN (10000,17000,24000);

SELECT *
FROM employees
WHERE department_id NOT IN ( 30, 50, 80, 100, 110 );

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';

SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

SELECT *
FROM employees
WHERE last_name LIKE 'B%';

SELECT job_id
FROM employees
WHERE job_id LIKE '%AD%';

SELECT *
FROM employees
WHERE job_id LIKE '%AD___';

SELECT *
FROM employees
WHERE phone_number LIKE '%1234';

SELECT *
FROM employees
WHERE phone_number NOT LIKE '%3%'
AND phone_number LIKE '%9';

SELECT *
FROM employees
WHERE job_id LIKE '%MGR%'
OR job_id LIKE '%ASST%'; 

SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT manager_id, first_name, last_name, salary, department_id
FROM employees
WHERE manager_id is null;

SELECT last_name
FROM employees
ORDER BY last_name ASC; -- 내림차순(정방향)

SELECT last_name
FROM employees
ORDER BY last_name DESC; -- 오름차순(역방향)

SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id;
-- 부서번호로 정렬 후 사원번호로 정렬

SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 연봉;

SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 2 DESC;

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id ASC;

SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

SELECT *
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY  department_id DESC, salary DESC;




















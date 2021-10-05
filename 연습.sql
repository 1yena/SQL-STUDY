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
OR salary > 13000
AND job_id='AD_VP'





















































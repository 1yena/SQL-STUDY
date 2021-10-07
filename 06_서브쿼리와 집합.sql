-- 서브쿼리(SUBQUERY) : 메인쿼리 안에 서브쿼리 '()' 안에 들어감.
SELECT last_name 이름, hire_date 고용일
FROM employees
WHERE hire_date > ( SELECT hire_date FROM employees WHERE last_name = 'Popp' );
-- Popp 직원의 고용일보다 최근(이후)에 고용된 사람.
-- SELECT hire_date FROM employees WHERE last_name = 'Popp' : Popp 직원의 고용일.
/* 주의점 : 단일행 서브쿼리를 사용할 때는 해당 서브쿼리의 결과가 비교하는 데이터와 같도 하나만 출력되어야 함.
   결과는 하나만 나와야 함 -> 결과나 비교 대상이 두 개 이상 나오면 에러남.*/

-- 그룹함수의 결과를 서브쿼리로 사용
SELECT last_name 이름, job_id 직종, salary 월급
FROM employees
WHERE salary = ( SELECT min(salary) FROM employees );

-- 예제 1
SELECT last_name 이름, salary 월급
FROM employees
where salary > ( SELECT salary FROM employees WHERE last_name = 'Abel' );

-- 예제 2
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE department_id = ( SELECT department_id FROM employees WHERE last_name = 'Bull')
AND salary > ( SELECT salary FROM employees WHERE last_name = 'Bull' );

-- 예제 3
SELECT last_name 이름, salary 급여, manager_id 매니저
FROM employees
where manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell' );

-- 예제 4
SELECT *
FROM employees
where job_id = ( SELECT job_id FROM jobs WHERE job_title = 'Stock Manager' );



-- 다중행 서브쿼리 : 서브쿼리 결과가 여러개의 행으로 출력.
-- 다중행 서브쿼에서는 ' = < > ' 등 비교표시를 사용할 수 없다.
SELECT min(salary) FROM employees GROUP BY department_id; -- 부서별 최저월급.

-- [IN]연산자 : 값이 하나라도 같으면 검색됨.
SELECT department_id 부서번호, employee_id, last_name, salary
FROM employees
WHERE salary IN ( SELECT min(salary) FROM employees GROUP BY department_id )
ORDER BY department_id;

-- [ANY]연산자 : 값이 하나라도 맞으면 검색됨.
SELECT department_id 부서번호, last_name, salary, job_id
FROM employees
WHERE salary < ANY( SELECT salary FROM employees WHERE job_id = 'IT_PROG' )
AND job_id != 'IT_PROG'
ORDER BY salary DESC;

-- [ALL]연산자 : 값이 전부 다 만족해야 검색됨.
SELECT department_id 부서번호, last_name, salary, job_id
FROM employees
WHERE salary < ALL( SELECT salary FROM employees WHERE job_id = 'IT_PROG' )
AND job_id != 'IT_PROG'
ORDER BY salary DESC;

-- 예제 1
SELECT employee_id, first_name, job_id 직종, salary 급여
FROM employees
WHERE manager_id IN ( SELECT manager_id FROM employees WHERE department_id = 20 )
AND department_id != 20;

-- 예제 2
SELECT employee_id, last_name, job_id 직종, salary 급여
FROM employees
WHERE salary < ANY ( SELECT salary FROM employees WHERE job_id = 'ST_MAN' );

-- 예제 3
SELECT employee_id, last_name, job_id 직종, salary 급여
FROM employees
WHERE salary < ALL ( SELECT salary FROM employees WHERE job_id = 'IT_PROG' );



-- 다중열 서브쿼리 : 열이 여러개일 때 사용한다.
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN (SELECT manager_id, job_id
                                FROM employees
                                WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';
-- 이름이 브루스인 직원과 같은 매니저, 같은 직업인 직원 출력(브루스는 제외).

-- 부서별 최소 급여를 받는 직원 출력
-- 예제 1
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)  FROM employees GROUP BY department_id)
ORDER BY department_id DESC;

-- 예제 1
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, MIN(salary)  FROM employees GROUP BY job_id)
ORDER BY salary DESC;































































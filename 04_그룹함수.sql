-- 그룹함수 (다중행 함수, 집계함수)
SELECT ROUND(AVG(salary)) 평균값, MAX(salary) 최대값, MIN(salary) 최소값, SUM(salary) 합계, COUNT(salary) 카운트
FROM employees
WHERE job_id LIKE '%REP%';
-- 그룹함수를 쓸 땐 그룹함수만 써야 함. 다른 값(LAST_NAME, SALARY 등) 넣으면 에러.
-- 카운트는 행(줄)의 개수다.

SELECT COUNT(*) -- employees 테이블의 모든 행 개수.
FROM employees;

SELECT COUNT(*)
FROM employees
WHERE department_id = 80; -- 80번 부서의 행 개수(직원수는=34명)

SELECT COUNT(department_id)
FROM employees;
-- EMPLOYEES는 107명인데 부서 수는 106개.
-- 1명이 부서가 없음(사장님) -> NULL 값
-- 그룹함수에서는 NULL값을 제외하고 계산한다.
-- 예외 : COUNT(*) ->'*'을 하면 다 센다.

SELECT COUNT(DISTINCT department_id)
FROM employees;
-- 중복되지 않은 부서의 개수

SELECT AVG(commission_pct)
FROM  employees;
-- NULL 값을 제외한 모든 직원들의 커미션 평균.



-- GROUP BY 절 : 특정 그룹으로 나누어서 그룹함수를 사용.
SELECT department_id 부서번호, ROUND(AVG(SALARY)) 평균급여
FROM employees
GROUP BY department_id 
ORDER BY 부서번호;
-- 부서번호로 그룹을 나누고 평균급여 내림차순으로 오름차순 정렬.

SELECT *
FROM employees
WHERE department_id IS NULL;
-- 부서가 없는 사람(사장 제외하고 입사한 지 얼마 안돼서 배정된 부서가 없다.)

-- 예제 1
SELECT department_id 부서명, COUNT(*) 사원수, MAX(salary) 최대급여, MIN(salary) 최소급여, SUM(salary) 급여합계, ROUND(AVG(salary))평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;

-- 예제 2
SELECT department_id 부서번호, job_id 직업, SUM(salary) 급여합계, COUNT(*) 사원수
FROM employees
GROUP BY department_id, job_id
ORDER BY 부서번호 ASC;

-- 예제 3
SELECT ROUND(AVG(MAX(salary))) 최고평균, ROUND(AVG(MIN(SALARY))) 최저평균
FROM employees
GROUP BY department_id;


-- HAVING 절 : [GROUP BY]절로 나눈 경우에 사용하는 조건절(그룹함수의 조건절) -> [WHERE]절은 [GROUP 함수]에 사용 못 함.
SELECT department_id 부서번호, COUNT(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;
-- 사원수가 5명이 넘는 부서.

-- 예제 1
SELECT job_id 직종, SUM(salary) 월급합계
FROM employees
WHERE job_id <> 'AC_MGR'
GROUP BY job_id
HAVING ROUND(AVG(salary)) > 10000
ORDER BY 월급합계 DESC;

-- 예제 2
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
WHERE department_id <> 40
GROUP BY department_id
HAVING ROUND(AVG(salary)) <= 7000;

-- 예제 3
SELECT job_id 직종, SUM(salary) 급여총액
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) >= 13000
ORDER BY 급여총액 DESC;






































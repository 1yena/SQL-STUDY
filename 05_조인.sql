-- 조인(Join)
-- [ON]을 사용한 기본 조인 > 최신 조인방법
SELECT e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, d.department_name 부서이름
FROM employees E
JOIN departments D
    on E.department_id = D.department_id;

-- [WHERE]절을 사용한 예전 조인방법
SELECT e.employee_id 직원번호, e.last_name 이름, d.department_id 부서번호, d.department_name 부서이름
FROM employees E, departments D
WHERE E.department_id = D.department_id;

-- 3개 테이블을 Join (직원, 부서, 로케이션 테이블 조인)
SELECT e.employee_id 직원번호, d.department_name 부서이름, L.city 도시, L.location_id
FROM employees E
JOIN departments D
    ON e.department_id = d.department_id
JOIN locations L
    ON L.location_id = d.location_id;

-- [WHERE]절을 사용한 조건 조인방법
SELECT e.employee_id, e.last_name, d.department_id, e.salary
FROM employees E
JOIN departments D
    ON e.department_id = d.department_id
WHERE d.department_id = 50
    AND e.salary >= 5000;
    
-- 예제 1
SELECT d.department_name 부서명, l.city 도시명, c.country_name 국가명
FROM departments D
JOIN locations L
    ON D.location_id = L.location_id
JOIN countries C
    ON C.country_id = L.country_id
WHERE (l.city = 'Seattle'
    OR l.city = 'London')
    AND c.country_name LIKE 'United%';
    
-- 예제 1 답안
SELECT d.department_name 부서명, l.city 도시명, c.country_name 국가명
FROM departments D
JOIN locations L
    ON D.location_id = L.location_id
JOIN countries C
    ON C.country_id = L.country_id
WHERE l.city in('Seattle','London') AND c.country_name LIKE 'United%';


-- 자체조인(SELF JOIN)
SELECT e.employee_id 직원번호, E.last_name 직원, m.manager_id 매니저번호, M.last_name 매니저
FROM employees E
JOIN employees M
    ON E.manager_id = M.employee_id
ORDER BY e.employee_id ASC;







































































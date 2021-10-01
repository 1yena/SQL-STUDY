--한 줄 주석 단축키 [CTRL + /]
/*
여러줄 
주석
*/
-- 1. 테이블의 모든 행과 열을 읽어오기, 명령문 실행은 [CTAL + ENTER]
-- 명령문 끝에는 세미콜론(;)이 있어야 함(없으면 에러).
-- "*"은 전체 열 조회

SELECT * 
FROM departments;

--2. 특정 열만 조회하기.
SELECT department_id, department_name
FROM departments;

-- 3. 별칭 붙이기 (열의 이름: aaa 'as' 땡땡이, as 생략해도 바로 뒤에 문자열이 오면 됨.)
SELECT department_id as 부서번호, department_name 부서이름
FROM departments;

-- 4. 산술 연산자 (+,-,*,/)
SELECT first_name 이름, job_id 직책, salary 월급
FROM employees;
-- 월급에서 100씩 뺀 열을 만들기(salary에서 -100)
SELECT first_name 이름, job_id 직책, salary 월급, salary-100 월급수정
FROM employees;
-- 월급 10% 차감
SELECT first_name 이름, job_id 직책, salary 월급, salary-salary/10 월급수정
FROM employees;
-- 보너스를 주는데 salary에 1000을 뺀 값의 5%로 책정
SELECT
    last_name 성,
    first_name 이름,
    job_id 직책,
    salary 월급,
    (salary-1000)*0.05 as 보너스
FROM employees;

-- distinct : 중복 값을 제거!
SELECT DISTINCT job_id 직책
FROM employees;

-- 예제 1
SELECT employee_id, first_name, last_name
from employees;

-- 예제 2
SELECT first_name, salary, salary*1.1 as 뉴셀러리
FROM employees;

-- 예제 3
SELECT employee_id as 사원번호, first_name as 이름, last_name as 성
from employees;

-- 연결연산자(||) : 열을 붙여서 하나의 열로 출력.
SELECT LAST_NAME || ' is a yes ' || JOB_ID as 직업정보
FROM EMPLOYEES;

-- 예제 4 : 이름을 한 칸 띄우고 붙여서 열, 이메일에 문자열 붙여서 출력.
SELECT 
    EMPLOYEE_ID as 사원번호,
    FIRST_NAME || ' ' || LAST_NAME as 풀네임,
    EMAIL || '@company.com ' as 이메일
FROM EMPLOYEES;

DESC EMPLOYEES;
-- number : 숫자열 -> 숫자(8,2)=숫자는 8자리까지 가능하며 소수는 두 자리까지 출력.
-- varchar2 : 문자열(한글,영문 등)
-- date : 날짜

DESC DEPARTMENTS;








































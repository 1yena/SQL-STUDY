-- 단일행 함수


-- 문자 함수
-- 대소문자 변환 UPPER LOWER INITCAP
SELECT UPPER('SQL course') FROM DUAL; -- 듀얼은 테스트용 테이블을 말함. 대문자로 바꾸기.
SELECT LOWER('SQL course') FROM DUAL; -- 듀얼은 테스트용 테이블을 말함. 소문자로 바꾸기.

SELECT UPPER('SQL course'), LOWER('SQL course'), INITCAP('SQL course') FROM DUAL; -- 첫글자만 대문자로 바꾸기.

-- SUBSTR
SELECT SUBSTR('ABCDEFG',3,4) --3번째부터 4글자 출력.
FROM DUAL;

SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG')
FROM DUAL;

SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABSDEFG','G')
FROM DUAL;

SELECT TRIM('   헬로   '), '   헬로   ' FROM DUAL; -- TRIM은 공백 제거.

-- 예제 1
SELECT department_id, last_name, department_id
FROM employees
WHERE lower(last_name) = 'higgins';

-- 예제 2
SELECT department_id, last_name, email
FROM employees
WHERE initcap(email) = 'Sking';

-- 예제 3
SELECT last_name, CONCAT('직업명이  ', job_id) as 직업명
FROM employees
WHERE substr(job_id, 4, 3) = 'REP';

-- 예제 4
SELECT last_name, SUBSTR(last_name, -1, 1)
FROM employees;

-- 예제 4-1
SELECT last_name, SUBSTR(last_name, -2, 2)
FROM employees;

-- 예제 5 (다시해봐)
SELECT employee_id, CONCAT(first_name, LAST_NAME) 전체이름,
                    last_name,
                    LENGTH('last_name') 길이,
                    INSTR('last_name','a') "'a'가 몇번째?"
FROM employees;

-- TRANSLATE : 문자열 바꾸기
SELECT job_id, replace(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

-- 예제 1
SELECT first_name, LOWER(last_name), UPPER(last_name), UPPER(email), INITCAP(email)
FROM employees;

-- 예제 2
SELECT job_id 직업명, SUBSTR(job_id, 1, 2) 앞에2개
FROM employees;

-- 숫자형 함수
SELECT ROUND(15.195), ROUND(15.195, 0), ROUND(15.195, 1), ROUND(15.195, 2) -- 반올림
FROM DUAL;

SELECT TRUNC(15.7988, 0), TRUNC(15.7988, 1), TRUNC(15.7988, 2), TRUNC(15.7988, 3)  -- 절삭
FROM DUAL;

SELECT employee_id 짝수번째, last_name
FROM EMPLOYEES
WHERE MOD(employee_id, 2)=0 -- 짝수
ORDER BY employee_id;































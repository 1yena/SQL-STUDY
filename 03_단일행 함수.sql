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

SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG','C')
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
SELECT employee_id 사원번호,
    concat(first_name, last_name) 전체이름,
    last_name,
    LENGTH(last_name) 길이,
    INSTR(last_name, 'a') "'a'가 몇번째?"
FROM employees;


-- TRANSLATE : 문자열 바꾸기
SELECT job_id, replace(job_id, 'ACCOUNT', '낼름') 적용결과
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

SELECT employee_id as 짝수번째, last_name as 성
FROM EMPLOYEES
WHERE MOD(employee_id, 2) = 0 -- 짝수
ORDER BY employee_id;

SELECT employee_id as 홀수번째, last_name as 성
FROM EMPLOYEES
WHERE MOD(employee_id, 2) = 1 -- 홀수
ORDER BY employee_id;

-- 예제 1
SELECT salary, ROUND(salary/30, 0) 정수, ROUND(salary/30, 1) 소수1, ROUND(salary/30, -1) 열자리
FROM employees;



-- 날짜형 함수

SELECT sysdate 현재날짜, 
        round(sysdate, 'DD') 일, 
        round(sysdate, 'MM') 월, 
        round(sysdate, 'YY') 연도, 
        round(months_between('2021/10/05', '2021/06/10'), 1) "개월수 차이"
FROM dual;
-- 'sysdate'는 현재 날짜를 의미
-- round(sysdate, 'DD') : 시간을 일로 반올림. > 일은 시간이 12시가 지나야 +1일됨.
-- round(sysdate, 'MM') : 일을 월로 반올림.
-- round(sysdate, 'YY') : 월을 연도로 반올림.


SELECT sysdate-2 그저께, sysdate-1 어제, sysdate 오늘, sysdate+1 내일, sysdate+2 모레
FROM dual;
-- 날짜에 더하기 빼기를 하면 실제 날짜가 더하거나 빼진다.


SELECT hire_date
FROM employees;
-- 'hire_date'는 고용된 날짜

-- 예제 1
SELECT sysdate 오늘, hire_date 고용일, round(months_between(sysdate, hire_date), 0) "개월 수"
FROM employees
WHERE department_id=100;

-- 예제 2
SELECT hire_date 고용일, ADD_MONTHS(hire_date, 3) "+3개월", ADD_MONTHS(hire_date, -3) "-3개월"
FROM employees
WHERE employee_id BETWEEN 100 and 106;


-- 변환형 함수

-- 숫자를 문자로 변환.(TO_CHAR 사용)
SELECT to_char(12345678, '999,999,999') "콤마형식(,)",
        to_char(12345678.678, '999,999,999.99') 콤마소수점, -- 자동으로 반올림도 됨.
        to_char(12345678, '$999,999,999') 달러,
        to_char(12345678, 'L999,999,999') 로컬통화 -- '원'은 'L'로 표기해야 함.
FROM dual;


-- 날짜를 문자로 변환.(TO_CHAR 사용)
SELECT to_char(SYSDATE, 'YYYY-MM-DD') 날짜표시, -- 문자열로 표시됨.
        to_char(SYSDATE, 'YYYY-MM-DD / HH24:MI:SS') "날짜/시간"
FROM DUAL;

-- 예제 1
SELECT employee_id, to_char(hire_date, 'YY/MM') 입사월
FROM employees
WHERE department_id=100;

-- 예제 2
SELECT last_name 이름, to_char(salary, '$999,999,999.00') 월급
FROM employees
WHERE salary > 10000 ORDER BY salary DESC;


-- 문자를 날짜로 변환.(TO_DATE)
SELECT TO_DATE('2011-01-01', 'YYYY-MM-DD') 문자날짜
FROM DUAL;

-- 문자를 숫자로 변환.(TO_NUMBER)
SELECT to_number('0123')+100
FROM DUAL;


-- 널(NULL)값 관련 함수
-- NYV1 : NVL(값, 0) -> 만약 값이 널(NULL)이면 0으로 변환.
SELECT last_name 이름, NVL(manager_id, 0) 매니저번호
FROM employees
WHERE last_name='King';

-- NYV2 : NVL(값, 1, 0) -> 만약 값이 널(NULL)이 아니면 첫번째(1), 아니면 두번째(0) 출력.
SELECT last_name 이름, NVL2(manager_id, 1, 0) 매니저번호
FROM employees
WHERE last_name='King';

-- 예제 1
SELECT last_name 이름, salary 월급, salary*12 연봉, NVL(commission_pct, 0) 커미션, (salary*12)+(salary*12*NVL(commission_pct, 0)) "연봉+커미션"
FROM employees
ORDER BY salary DESC;

-- 예제 2
SELECT last_name 이름, salary 월급, salary*12 연봉, NVL(commission_pct, 0) 커미션, salary*12+salary*12*NVL(commission_pct, 0) "연봉+",
        NVL2(commission_pct, '월급+보너스', '월급만') 월급계산방법
FROM employees
ORDER BY 연봉 DESC;


-- DECODE 함수
SELECT last_name 이름, job_id 사원아이디, salary 월급,
        DECODE(job_id, 'IT_PROG',   SALARY*1.10,
                        'ST_CLERK', SALARY*1.15,
                        'SA_REP',   SALARY*1.20,
                                    SALARY) 수정월급
FROM employees;

SELECT last_name 이름, job_id 직무, salary 월급, 
        DECODE( TRUNC(salary/2000), 0, 0, -- 월급이 2000 미만이면 값이 '0'이다.
                                   1, 0.09,
                                   2, 0.2,
                                   3, 0.3,
                                   4, 0.4,
                                   5, 0.42,
                                   6, 0.44,
                                      0.45) 세율
FROM employees;


-- CASE 함수
SELECT last_name 이름, job_id 직무, salary 월급,
        CASE WHEN SALARY<5000 THEN 'LOW'
             WHEN SALARY<10000 THEN 'MEDIUM'
             WHEN SALARY<20000 THEN 'GOOD'
             ELSE                   'ENCELLENT'
        END "급여 수준"
FROM employees;

-- 예제 1
SELECT employee_id, first_name, last_name, salary,
       CASE WHEN SALARY>=9000 THEN '상위급여'
            WHEN SALARY>=6000 THEN '중위급여'
            ELSE                   '하위급여'
       END "급여 등급"
FROM employees
WHERE job_id='IT_PROG';




-- DDL 테이블 생성 수정 삭제

-- 테이블 생성
CREATE TABLE 테스트 (
    문자열 VARCHAR2(100),
    숫자  NUMBER,
    날짜  DATE DEFAULT SYSDATE
    );
    
-- 확인
DESC 테스트;

SELECT *
FROM 테스트;

-- 데이터 입력
INSERT INTO 테스트
VALUES ('HTML', 5, '2021-10-08');
-- 날짜만 들어가고 시간은 입력 안 됨.
INSERT INTO 테스트
VALUES ('CSS', 3, SYSDATE);
-- [ SYSDATE ] : 날짜에 시간까지 입력됨.
INSERT INTO 테스트(문자열, 숫자)
VALUES ('자바', 7 );
-- 기본 초기값(DEFAULT)이 [SYSDATE]이기 때문에 날짜란 비워둬도 자동으로 입력됨.


/* DDL (CREATE, DROP) : 테이블 생성 & 삭제
   자동 커밋이 되기 때문에 롤백이 안 됨. 롤백하려면 삭제하고 커밋*/
   
-- 기존에 만들어져 있는 테이블을 복사하는 방법***
CREATE TABLE EMP_TEMP
AS
SELECT * FROM employees WHERE 1 <> 1;
-- [employees] 테이블의 열구조만 복사

-- 확인 --------------------------------
SELECT * FROM stmans;
DESC emp_80;
----------------------------------------

CREATE TABLE EMP_80
AS
SELECT employee_id 직원번호, last_name 이름, salary 월급, salary*12 연봉, hire_date 고용일 
FROM employees WHERE department_id = 80;
-- 80번 부서의 직원들만 따로 테이블 복사 생성


-- 테이블 삭제
DROP TABLE 테스트;


-- 예제 1
CREATE TABLE stmans
AS
SELECT employee_id ID, job_id JOB, salary SAL
FROM employees WHERE job_id = 'ST_MAN';

























































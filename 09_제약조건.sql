-- 제약조건

-- NOT NULL : 널값은 입력이 안 됨.

DESC departments; 
-- DEPARTMENT_ID, DEPARTMENT_NAME은 널값 안 됨.

-- NOT NULL : 널값 안 됨.
-- UK 유니크 : 중복되지 않음.

CREATE TABLE EMP1 (
    ENO         NUMBER(3),
    emp_name    VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL, -- 널값 안 돼
    email       VARCHAR2(30),
    CONSTRAINT emp1_email_uk UNIQUE (email) -- 'UNIQUE' 유니크 : 중복 안 돼
);
-- emp_name은 NOY NULL 제약조건, email은 유니크 제약조건

-- 데이터 입력
INSERT INTO emp1 VALUES(208, 'Kim', 'KJS@naver.com');
INSERT INTO emp1 VALUES(209, NULL, 'ABC@naver.com'); -- 널값을 입력할 수 없어서 에러 발생.
INSERT INTO emp1 VALUES(210, 'Lee', 'KJS@naver.com'); -- 유니크(unique) 어김 => email은 유니크 제약조건이 걸려서 중복 안 됨.

-- Check 제약조건
CREATE TABLE EMP2 (
    ENO         NUMBER(3),
    emp_name    VARCHAR2(20),
    sal         NUMBER(10),
    CONSTRAINT emp2_sal_check CHECK (sal>1000) -- sal에 들어오는 값이 1000보다 커야 함.
);

INSERT INTO emp2 VALUES(208, 'Kim', 1200);
INSERT INTO emp2 VALUES(209, 'Lee', 900); -- sal의 값이 1000보다 작아서 에러 발생.

-- 제약조건 이름 없이 테이블 생성
DROP TABLE emp;

CREATE TABLE emp (
    eno     NUMBER(4) PRIMARY KEY,
    ename   VARCHAR2(20) NOT NULL,
    gno     VARCHAR2(13) UNIQUE CHECK (length(gno) >= 8), -- 8글자 이상
    gender  VARCHAR2(5) CHECK (gender in('woman', 'man'))
    );

INSERT INTO emp VALUES(1, 'Kim', '12345678', 'man');
INSERT INTO emp VALUES(2, 'Kim', '123456789', 'woman');

CREATE TABLE members (
    member_id   NUMBER(2)       PRIMARY KEY,
    first_name  VARCHAR2(50)    NOT NULL,
    last_name   VARCHAR2(50)    NOT NULL,
    gender      VARCHAR2(5)     CHECK (gender in('Woman', 'Man')),
    birth_day   DATE   DEFAULT  SYSDATE,
    email       VARCHAR2(200)   UNIQUE NOT NULL
    );


--21-10-22 수업 시작=============================================================
-- 제약조건 pk, fk 기본키 외래키 관계

-- 부서 테이블 만들기
-- 기본키 (PK)
CREATE TABLE 부서 (
    부서번호 NUMBER(4) PRIMARY KEY,
    부서이름 VARCHAR2(20)
    );
    
INSERT INTO 부서 VALUES (1, '개발');
-- INSERT INTO 부서 VALUES (null, '회계'); 기본키 열은 중복 또는 널값 입력이 안 된다. > 오류 발생
-- INSERT INTO 부서 VALUES (1, '회계'); 기본키 열은 중복 또는 널값 입력이 안 된다. > 오류 발생


-- 외래키 (FK)
-- 외래키 문법 FOREIGN KEY (열이름) REFERENCES 참조테이블(참조열) [ON DELETE CASCADE 또는 ON DELETE SET NULL]
-- 옵션 [ON DELETE CASCADE 또는 ON DELETE SET NULL]은 생략 가능
CREATE TABLE 직원 (
    직원번호   NUMBER(4) PRIMARY KEY,
    이름      VARCHAR2(20),
    월급      NUMBER(10),
    부서번호   NUMBER(4),
    FOREIGN KEY (부서번호) REFERENCES 부서(부서번호) -- 직원 테이블의 부서번호는 부서 테이블의 부서번호를 참조한다.
);
-- 부서 테이블 데이터 입력
INSERT INTO 부서 VALUES (1, '개발');
INSERT INTO 부서 VALUES (2, '경영');
INSERT INTO 부서 VALUES (3, '회계');

-- 직원 테이블 데이터 입력
INSERT INTO 직원(직원번호, 이름, 월급, 부서번호) VALUES (100, '찬차라', 150, 1);
INSERT INTO 직원(직원번호, 이름, 월급, 부서번호) VALUES (110, '꿍꾸르', 100, 1);
-- INSERT INTO 직원(직원번호, 이름, 월급, 부서번호) VALUES (110, '꿍꾸르', 100, 4); 부서번호가 3번까지만 있어서 다른 번호는 입력 안 됨.
INSERT INTO 직원(직원번호, 이름, 월급, 부서번호) VALUES (120, '뒤뚱이', 200, NULL); -- 외래키는 널값 입력 가능.

-- 삭제 시 오류 발생
DELETE FROM 부서 WHERE 부서번호 = 1; 
-- 현재 이 부서번호를 다른 테이블에서 외래키로 참조해서 사용하고 있기 때문에 삭제가 안 됨.


-- 강제로 삭제하는 방법 [ON DELETE CASCADE 또는 ON DELETE SET NULL]
CREATE TABLE 직원 (
    직원번호    NUMBER(4) PRIMARY KEY,
    이름       VARCHAR2(20),
    월급      NUMBER(10),
    부서번호   NUMBER(4),
    FOREIGN KEY (부서번호) REFERENCES 부서(부서번호) 
    ON DELETE CASCADE -- 부서테이블에 부서번호가 삭제되면 참조한 값도 같이 삭제됨.
);

DELETE FROM 부서 WHERE 부서번호 = 1; -- 부서번호 1번 삭제

CREATE TABLE 직원 (
    직원번호    NUMBER(4) PRIMARY KEY,
    이름       VARCHAR2(20),
    월급      NUMBER(10),
    부서번호   NUMBER(4),
    FOREIGN KEY (부서번호) REFERENCES 부서(부서번호) 
    ON DELETE SET NULL -- 부서테이블에 부서번호가 삭제되면 참조한 값이 널값으로 바뀜.
);

DELETE FROM 부서 WHERE 부서번호 = 1; -- 부서번호 1번 삭제


-- 제약조건 추가(1. 기본테이블생성 2. 제약조건 추가)

-- 1. 기본테이블생성
CREATE TABLE 과목(
    과목번호 VARCHAR2(2),
    과목이름 VARCHAR2(50)
);
INSERT INTO 과목 VALUES ('01', '데이터');
INSERT INTO 과목 VALUES ('02', '프로그래밍');


CREATE TABLE 학생(
    학번 VARCHAR2(4),
    이름 VARCHAR2(50),
    과목번호 VARCHAR2(2)
);
INSERT INTO 학생 VALUES ('0414', '홍길동', '01');
INSERT INTO 학생 VALUES ('0415', '임꺽정', '02');
INSERT INTO 학생 VALUES ('0416', '이순신', '03');


-- 2. 제약조건 추가

ALTER TABLE 과목
ADD PRIMARY KEY (과목번호);
-- 과목 테이블 과목번호에 기본키 제약조건 추가함

ALTER TABLE 과목
ADD UNIQUE (과목이름);
-- 과목 테이블 과목이름에 유니크 제약조건 추가함


ALTER TABLE 학생
ADD PRIMARY KEY (학번);
-- 학번에 기본키 추가

ALTER TABLE 학생
MODIFY 이름 NOT NULL;
-- 이름에 NOT NULL 추가(MODIFY 열이름 NOT NULL;)

ALTER TABLE 학생
ADD FOREIGN KEY (과목번호) REFERENCES 과목(과목번호);
-- 과목번호에 외래키 추가 
--<INSERT INTO 학생 VALUES ('0416', '이순신', '03');> 이게 과목번호가 03번이라서 오류남

-- 학생 업데이트 이순신의 과목번호를 '01'로 수정
UPDATE 학생 SET 과목번호 = '01' WHERE 학번 = '0416';


-- 제약조건 삭제
ALTER TABLE 과목
DROP PRIMARY KEY; 
-- 과목번호 기본키를 학생 테이블에서 참조 중이기 때문에 삭제가 안 됨.
-- 따라서 CASCADE 옵션으로 외래키 조건과 같이 삭제해야 함.
ALTER TABLE 과목
DROP PRIMARY KEY CASCADE; 
-- 과목 테이블의 기본키를 삭제함.

ALTER TABLE 과목
DROP CONSTRAINT SYS_C007049; 
-- 과목 테이블의 유니크 제약조건을 제약조건의 이름으로 삭제함.


-- 학생 테이블의 제약조건 삭제
ALTER TABLE 학생
DROP CONSTRAINT SYS_C007050;
ALTER TABLE 학생
DROP CONSTRAINT SYS_C007051;



-- 테이블에 열을 추가 / 수정 / 삭제
-- 서브쿼리로 테이블 카피
CREATE TABLE 직원(직원번호, 이름, 급여, 부서번호)
AS SELECT employee_id, first_name, salary, department_id  
FROM employees
WHERE department_id = 90; -- 90번 부서의 직원들

-- 열을 추가
ALTER TABLE 직원 ADD(성별 VARCHAR2(3));
ALTER TABLE 직원 ADD(커미션 NUMBER DEFAULT 0); -- 널값 대신에 초기값을 '0'으로 설정.


-- 열을 수정 (데이터 타입을 바꾸거나 용량을 늘릴 때)

ALTER TABLE 직원 MODIFY (성별 VARCHAR2(10));
-- 성별을 VARCHAR2(3) -> 성별 VARCHAR2(10)로 용량을 늘림.

ALTER TABLE 직원 MODIFY (성별 NUMBER);
-- 성별 타입을 VARCHAR2 ->  NUMBER 변경.


-- 열을 삭제
ALTER TABLE 직원
DROP COLUMN 커미션;    -- 커미션 삭제
ALTER TABLE 직원
DROP COLUMN 성별;      -- 성별 삭제


-- 테이블의 이름 수정
RENAME 직원 TO 직원2;

DESC 직원2;






-- 제약조건 조회(테이블 이름만 수정)
SELECT *
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = '학생';
-- 테이블 이름은 '' 안에 넣어야 하고 영문일 땐 대문자로 적어야 함!!


DROP TABLE EMP;    -- 테이블 삭제

DESC 직원;         -- 테이블 구조 확인

SELECT *
FROM 직원;



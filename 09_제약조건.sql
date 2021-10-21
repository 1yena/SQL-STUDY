-- 제약조건

-- NOT NULL : 널값은 입력이 안 됨.

DESC departments; -- DEPARTMENT_ID, DEPARTMENT_NAME은 널값 안 됨.

-- UK 유니크 : 중복되지 않음.

-- emp_name은 NOY NULL 제약조건, email은 유니크 제약조건
CREATE TABLE EMP1 (
    ENO     NUMBER(3),
    emp_name VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL, -- 널값 안 돼
    email VARCHAR2(30),
    CONSTRAINT emp1_email_uk UNIQUE (email) -- 'UNIQUE' 유니크 : 중복 안 돼
);
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
    eno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(20) NOT NULL,
    gno VARCHAR2(13) UNIQUE CHECK (length(gno) >= 8), -- 8글자 이상
    gender VARCHAR2(5) CHECK (gender in('woman', 'man'))
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











DESC members;


SELECT *
FROM members;













































-- DML ( Data Manipulation Language ) 작업

-- 데이터 입력( INSERT ) : 테이블에 새로운 행을 삽입.
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);

-- 확인 ------------------------------------------------------------------------
SELECT *
FROM departments
ORDER by department_id DESC;

-- 테이블 열의 구조를 확인 --------------------------------------------------------
DESC departments;

-- 특정 열만 입력 시 미입력된 구간은 null 값이 됨.
INSERT INTO departments(department_id, department_name)
VALUES (280, 'Music');

-- 열의 이름들을 생략하더라도 값은 다 적어줘야지 삽입됨.
INSERT INTO departments
VALUES (290, 'Pusan', NULL, 1700); -- 안 적어도 NULL이고 'NULL'을 입력해도 NULL 값이 됨.

-- 예제 1
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (271, 'Sample Dept 1', 200, 1700);
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (272, 'Sample Dept 2', 200, 1700);
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (273, 'Sample Dept 3', 200, 1700);

-- 기본키는 중복값 안 됨 = 똑같은 값을 중복으로 삽입하려하면 에러남.



-- 데이터 수정( UPDATE ) [WHRER]절의 조건에 해당하는 행의 내용을 갱신함.
UPDATE departments
SET manager_id = 200
WHERE department_name = 'Game';

-- 예제 1
UPDATE departments
SET manager_id = 100
WHERE department_id BETWEEN 150 and 200;

-- 두 개 이상의 열을 업데이트하는 경우 SET에 (,) 찍고 조건 나열하면 됨.
UPDATE departments
SET manager_id = 100, location_id = 1800
WHERE department_name = 'Game';



-- 데이터 삭제( Delete ) : [WHRER]절의 조건에 해당하는 행단위로 데이터를 삭제한다.
DELETE FROM departments
WHERE department_id = 280;
-- music 삭제
DELETE FROM departments
WHERE department_id = 300;
-- game 삭제
DELETE FROM departments
WHERE department_id = 290;
-- pusan 삭제
DELETE FROM departments
WHERE department_name LIKE '%Sample%';
-- Sample 1,2,3 삭제

-- 전체삭제 : whrer 절을 안 적으면 전체삭제됨.
DELETE FROM departments; 
-- 다른 테이블에서 해당 테이블을 참조하고 있기 때문에 바로 삭제가 안 됨.

-- 120번 이상 부서들 삭제
DELETE FROM departments
WHERE department_id >= 120;

-- 커밋(commit) 전에는 롤백(rollback) 가능
ROLLBACK;

-- 게임 부서를 생성하고 커밋(commit)
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);

commit;
-- 이제 롤백을 해도 게임 부서는 남아있음
-- 게임 부서 없애고 싶으면 삭제하고 커밋하면 됨.


-- 자동 커밋 설정.
SHOW autocommit; 
-- on.off 상태 확인. <"IMMEDIATE"는 "즉시"라는 뜻으로 자동커밋된 상태임>
set autocommit on; 
-- 자동 커밋 on
set autocommit off; 
-- 자동 커밋 off > 수동으로 커밋해줘야 함.





































































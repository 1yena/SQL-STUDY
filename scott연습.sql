-- SCOTT 연습문제 1~10번
-- 문제 1
SELECT empno 사원번호, ename 이름, sal 월급, deptno 부서번호
FROM emp
WHERE deptno = 10;

-- 문제 2
SELECT ename 이름, hiredate 입사일, deptno 부서번호, empno 사원번호
FROM emp
WHERE empno = 7369;

-- 문제 3
SELECT *
FROM emp
WHERE ename = 'ALLEN';

-- 문제 4
SELECT ename 이름, deptno 부서번호, sal 월급, hiredate 입사일
FROM emp
WHERE hiredate = '81/02/20';

-- 문제 5
SELECT *
FROM emp
WHERE job != 'MANAGER'; -- '<>'도 사용가능.

-- 문제 6
SELECT *
FROM emp
WHERE hiredate >= '81/04/02';

-- 문제 7
SELECT ename 이름, sal 월급, deptno 부서번호
FROM emp
WHERE sal >= 800;

-- 문제 8
SELECT *
FROM emp
WHERE deptno >= 20;

-- 문제 9 ***** (복습 !)
SELECT *
FROM emp
WHERE ename >= 'L';

-- 문제 10
SELECT *
FROM emp
WHERE hiredate < '81/12/09';


-- SCOTT 연습문제 11~20번
-- 문제 11
SELECT empno 직원번호, ename 이름
FROM emp
WHERE empno <= 7698;

-- 문제 12
SELECT ename 이름, sal 월급, deptno 부서번호
FROM emp
WHERE hiredate >= '81/04/02'
AND hiredate <= '82/12/09';
-- BETWEEN 81/04/02 AND 82/12/09 써도 됨.
SELECT ename 이름, sal 월급, deptno 부서번호
FROM emp
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

-- 문제 13
SELECT ename 이름, job 직업, sal 급여
FROM emp
WHERE sal > 1600
AND sal < 3000;

-- 문제 14
SELECT *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;
-- OR 써도 됨.
SELECT *
FROM emp
WHERE empno < 7654
OR empno > 7782;

-- 문제 15
SELECT *
FROM emp
WHERE ename BETWEEN 'B' AND 'J';
-- BETWEEN 없이도 가능
SELECT *
FROM emp
WHERE ename >= 'B' 
AND ename <= 'J';

-- 문제 16 (내 답 : LIKE 쓰면 컴퓨터에 부하가 많이 걸려서 비추)
SELECT *
FROM emp
WHERE hiredate NOT LIKE '81%';
-- 16번 (1)
SELECT *
FROM emp
WHERE NOT (hiredate >= '81/01/01' AND hiredate <= '81/12/31');
-- 16번 (2)
SELECT *
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';
-- 16번 (3)
SELECT *
FROM emp
WHERE TO_CHAR(hiredate, 'YYYY') <> '1981';

-- 문제 17
SELECT *
FROM emp
WHERE job = 'MANAGER'
OR job = 'SALESMAN';

-- IN 써도 됨
SELECT *
FROM emp
WHERE job IN ( 'MANAGER','SALESMAN' );

-- 문제 18
SELECT ename 이름, empno 사원번호, deptno 부서번호
FROM emp
WHERE deptno NOT IN(20,30);
-- DEPTNO !=20 AND EPTNO !=30

-- 문제 19
SELECT empno 사원번호, ename 이름, hiredate 입사일, deptno 부서번호
FROM emp
WHERE ename LIKE 'S%';

-- 문제 20
SELECT *
FROM emp
WHERE hiredate LIKE '81/%';
-- BETWEEN 써도 가능.
SELECT *
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';


-- SCOTT 연습문제 21~30번
-- 문제 21
SELECT *
FROM emp
WHERE ename LIKE '%S%';

-- 문제 22
SELECT *
FROM emp
WHERE ename LIKE 'M____N';

-- 문제 23
SELECT *
FROM emp
WHERE ename LIKE '_A%';

-- 문제 24
SELECT *
FROM emp
WHERE comm IS NULL;

-- 문제 25
SELECT *
FROM emp
WHERE comm IS NOT NULL;

-- 문제 26
SELECT ename 이름, deptno 부서, sal 월급
FROM emp
WHERE deptno = 30
AND sal >= 1500;

-- 문제 27
SELECT empno 사원번호, ename 이름, deptno 부서
FROM emp
WHERE ename LIKE 'K%'
OR deptno = 30;

-- 문제 28
SELECT *
FROM emp
WHERE sal >= 1500
AND deptno = 30
AND job = 'MANAGER';

-- 문제 29
SELECT *
FROM emp
WHERE deptno = 30
ORDER BY empno ASC;

-- 문제 30
SELECT *
FROM emp
ORDER BY sal DESC;


-- SCOTT 연습문제 31~35번
-- 문제 31
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

-- 문제 32
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename ASC, sal DESC;

-- 문제 33
SELECT ename, sal, ROUND(sal*0.13) 보너스, deptno
FROM emp
WHERE deptno = 10;

-- 문제 34
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0) 총액
FROM emp
ORDER BY 총액 DESC;

-- 문제 35
SELECT ename, sal, TO_CHAR( SAL*0.15, '$999,999,999.9') 회비
FROM emp
WHERE sal BETWEEN 1500 AND 3000;


-- SCOTT 연습문제 35~40번
-- 문제 36
SELECT d.dname, COUNT(e.empno)
FROM emp e
JOIN dept d
    on e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(e.empno) > 5;
-- [e.empno]를 '*'로 처리해도 됨.
SELECT d.dname, COUNT(*)
FROM emp e
JOIN dept d
    on e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(*) > 5;

-- 문제 37
SELECT job, SUM(sal) 급여합계
FROM emp
GROUP BY job
HAVING SUM(sal) > 5000
AND job <> 'SALESMAN'; -- 그룹을 나눈 후 제외됨.(데이터가 방대할 경우 렉 걸림.)
-- 정답!
SELECT job, SUM(sal) 급여합계
FROM emp
WHERE job <> 'SALESMAN' -- where절에 적게 되면 그룹을 나누기 전에 제외됨.(데이터가 방대할 때 추천.)
GROUP BY job
HAVING SUM(sal) > 5000;

-- 문제 38
SELECT e.empno, e.ename, e.sal, s.grade
FROM emp e
JOIN salgrade s
    on e.sal BETWEEN s.losal and s.hisal;

-- 문제 39
SELECT deptno, COUNT(*) 사원수, COUNT(comm) 커미션사원
FROM emp
GROUP BY deptno;

-- 문제 40
SELECT empno 사원번호, deptno 부서번호, 
        decode(deptno, 10, '총무부',
                       20, '개발부',
                       30, '영업부'
                ) 부서명
FROM emp
ORDER BY 부서번호;
-- [case]절 사용할 경우
SELECT empno 사원번호, deptno 부서번호, CASE deptno
        WHEN 10 THEN '총무부'
        WHEN 20 THEN '개발부'
        WHEN 30 THEN '영업부'
end "부서명"
FROM emp
ORDER BY 부서번호;







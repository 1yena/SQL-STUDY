SELECT SYSDATE FROM DUAL;

-- �� �� �ּ��Դϴ�.
-- HR ����(���������)�� ����ϰ� ��й�ȣ 1234 ����
ALTER USER HR ACCOUNT UNLOCK 
IDENTIFIED BY 1234;

-- SCOTT 계정을 설치 및 비밀번호 설정
@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql;
ALTER USER scott ACCOUNT UNLOCK 
IDENTIFIED BY 1234;








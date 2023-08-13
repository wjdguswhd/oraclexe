/*
DDL(Data Definition Language) - ������ ���Ǿ�
    ������ ���̽� ���� ���� �� ��ü(���̺�, ������.. ��)�� ����, ����, �����ϱ� ���� ���Ǵ� SQL���Դϴ�.

*/

/*
CREATE TABLE ��
    �����͸� ������ ���̺��� �����մϴ�.

*/

CREATE TABLE dept(
        deptno NUMBER(6),
        dname VARCHAR2(200),
        loc VARCHAR2(200),
        create_date DATE DEFAULT SYSDATE
        );

DESC dept;

/*
������ ����
    VARCHAR2(size) : ���� ���� ���� ������ �ִ� (4000)
    NUMBER(p,s) ���� ���� ���� ������
    CHAR(size) ���� ���� ����(2000)
    DATE ��¥ �� �ð� ��
    CLOB ���� ������(�ִ� 4GB)
    BLOB ���̳ʸ� ������(�ִ� 4GB)
    BFILE ������ġ�� ��Ÿ������ ����(�ִ� 4GB)
*/

--departments ���̺��� dept�� �����ͺ����ϱ�
INSERT INTO dept
SELECT department_id, department_name, location_id, SYSDATE
FROM departments;

/*
CTAS�� "Create Table AS Select"�� ���ڷ�
�����ͺ��̽����� ���ο� ���̺��� �����ϴ� ����Դϴ�.
�� ����� ���� ���̺��� SELECT���� ����Ͽ� �����͸� ��ȸ�� ��,
�� ����� ���ο� ���̺�� �����ϴ� ����Դϴ�.

*/

--���̺� �����ϱ� -> ���������� ���簡 �ȵȴ�.
CREATE TABLE dept2 AS SELECT * FROM dept;

SELECT * FROM dept2;        
        
--���̺� ������ �����ϱ� (������ �׻� ������ �Ǵ� ������)
CREATE TABLE dept3 AS SELECT * FROM dept WHERE 1=2;

/*
ALTER ��
    �����ͺ��̽� ��ü ������ �Ӽ��� ������ �� ���Ǵ� SQL ��ɹ��Դϴ�. 
*/

CREATE TABLE simple(num NUMBER); 

SELECT * FROM simple;
--�÷� �߰��ϱ�
ALTER TABLE simple ADD(name VARCHAR2(3));
--�÷� �����ϱ�
ALTER TABLE simple MODIFY(name VARCHAR2(30));
--�÷� �����ϱ�
ALTER TABLE simple DROP COLUMN name;

ALTER TABLE simple ADD(addr VARCHAR(50));
--�÷� �����ϱ�2
ALTER TABLE simple DROP(addr);

DESC simple;

--DROP �� : ��ü�� ������ �� ���Ǵ� SQL��ɹ� �Դϴ�.
--���̺� ����
DROP TABLE simple;

/*
��������(Constraint)
    ���̺��� �ش��÷��� ������ �ʴ� �����͸� �Է�/����/���� �Ǵ� ���� �����ϱ�
    ���� ���̺� ���� �Ǵ� ����� �����ϴ� �����Դϴ�. (����� �������� �ŷڼ� ���̱� ����)
    
    NOT NULL
        NULL�� �Է��� �Ǿ�� �ȵǴ� �÷��� �ο��ϴ�
        �������� �÷� ���������� �ο��� �� �ִ� ���������Դϴ�.
    UNIQUE KEY(����Ű)
        ����� ���� �ߺ����� �ʰ� ���� �����ϰ� �����Ǿ�� �� ��
        ����ϴ� ���������Դϴ�.(NULL ���ȴ�)
        
    PRIMARY KEY(��ǥŰ, �⺻Ű)
        NOT NULL ���ǰ� UNIQUE ��ģ �����Դϴ�.
    CHECK
        ���ǿ� �´� �����͸� �Էµǵ��� ������ �ο��ϴ� ���������Դϴ�.
    FOREIGN KEY(�ܷ�Ű, ����Ű)
        �θ� ���̺��� PRIMARY KEY�� �����ϴ� �÷��� ���̴� ���������Դϴ�.
        
*/
CREATE TABLE dept4 (
    deptno NUMBER(2) CONSTRAINT dept4_deptno_pk PRIMARY KEY,
    dname VARCHAR2(15) DEFAULT '������',
    loc CHAR(1) CONSTRAINT dept4_loc_ck CHECK(loc IN('1','2'))
    );

SELECT * FROM dept4;

INSERT INTO dept4(deptno, loc)
VALUES(2,'1');

--�ܷ�Ű�� ����� ���ؼ��� �θ����̺� �ʿ�
--�θ����̺� ����
CREATE TABLE dept5(
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(15) NOT NULL
    );

--�θ����̺� dept5�� �����ϴ� �ڽ����̺�

CREATE TABLE emp(
    empno NUMBER(4) PRIMARY KEY,
    ename VARCHAR2(15) NOT NULL,
    deptno NUMBER(2),
CONSTRAINT emp_dept5_fk FOREIGN KEY(deptno)
    REFERENCES dept5(deptno)
    );

SELECT * FROM dept5;

INSERT INTO dept5 (deptno, dname) VALUES (1,'���ߺ�');
INSERT INTO dept5 (deptno, dname) VALUES (2,'��ȹ��');
INSERT INTO dept5 (deptno, dname) VALUES (3,'������');

COMMIT;

SELECT * FROM emp;

INSERT INTO emp(empno,ename,deptno) VALUES(1,'����ȣ',1);
INSERT INTO emp(empno,ename,deptno) VALUES(2,'������',3);

COMMIT;

DELETE FROM emp WHERE empno = 2;
ROLLBACK;

DELETE FROM dept5 WHERE deptno = 1;

SELECT * FROM user_constraints
WHERE constraint_name = 'EMP_DEPT5_FK';

SELECT * FROM user_constraints
WHERE table_name ='EMP';

--���������� ���� �Ұ���, ������ �����մϴ�.
ALTER TABLE emp DROP CONSTRAINT EMP_DEPT5_FK;

--�������� �߰��ϱ�
ALTER TABLE emp ADD(
     CONSTRAINT emp_dept5_fk FOREIGN KEY(deptno)REFERENCES dept5(deptno)
    );
    
SELECT * FROM user_constraints
WHERE constraint_name = 'SYS_C008366';








        
        
        
        
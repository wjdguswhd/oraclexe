/*

�����ͺ��̽� ��ü
    ���̺� : �⺻ ��������̸� ������ �����Ǿ� �ֽ��ϴ�.
    ��    : �ϳ� �̻��� ���̺� �ִ� �������� �κ� ������ �������� ��Ÿ���ϴ�.(���� ���̺�)
    ������ : �Ϸ��� ���ڸ� �ڵ����� �������ִ� ��ü�Դϴ�.
    �ε��� : ���̺��� �����Ϳ� ���� �����˻��� �������ִ� ���� ��ü�Դϴ�.
    ���Ǿ� : ��ü �ٸ� �̸��� �ο��մϴ�.

*/

--�� ����
CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
    FROM employees
    WHERE department_id = 80;
    
DESC empvu80;

SELECT * FROM empvu80;

--alias ��� �� ����
CREATE VIEW salvu50
AS SELECT employee_id  ID_NUMBER,last_name name, salary*12 ANN_SALARY
    FROM employees
    WHERE department_id = 50;
    
SELECT * FROM salvu50;






















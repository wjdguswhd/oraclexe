/*
ORDER BY��
    ORDER BY���� ����Ͽ� �˻��� ���� �����մϴ�.
        
        ASC  : ��������, �⺻��
        DESC : ��������
        
        SELECT ���� �� �������� �ɴϴ�.  
        
[SELECT �� �⺻����]   
SELECT (DISTICT) | �÷���1, �÷���2 ...      .5
FROM ���̺��                               .1
WHERE ������                                .2
GROUP BY �÷���                             .3
HAVING ������                               .4
ORDER BY �÷��� [ASC|DESC]                  .6

       
        
*/

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

--�������� ����
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

--�� alias�� �������� ����
SELECT employee_id, last_name, salary*12 annsal
FROM employees
ORDER BY annsal;

--�� ���� ��ġ�� ����Ͽ� ����
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 3;

--���� ���� �������� ����
SELECT last_name, job_id, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;





























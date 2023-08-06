/*
Subquery ����
    �ٸ� SELECT ���� ���ԵǴ� SELECT �� �Դϴ�.
    
*/

--���� �� Subquery ����
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Abel');

--Subquery���� �׷� �Լ� ���
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

/*
���� �� Subquery
 IN
    ����Ʈ�� ���� ����� ����
 ANY
    =, <> , >, <, <=, >= �����ڰ� �տ� �־�� �մϴ�.
    < ANY�� �ִ񰪺��� ������ �ǹ��մϴ�.
    > ANY�� �ּڰ����� ŭ�� �ǹ��մϴ�.
    = ANY�� IN�� �����ϴ�.
 ALL
    > ALL�� �ִ񰪺��� ŭ�� �ǹ��մϴ�.
    < ALL�� �ּڰ����� ������ �ǹ��մϴ�.
    
*/

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary IN(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

/*
EXISTS ������
    subquery���� �ּ��� �� ���� ���� ��ȯ�ϸ� TRUE�� �򰡵˴ϴ�.
*/
SELECT * FROM departments
WHERE NOT EXISTS
        (SELECT * FROM employees
        WHERE employees.department_id = departments.department_id);
        
/*
Subquery�� null ��
    ��ȯ�� �� �� �ϳ��� null ���̸� ��ü query�� ���� ��ȯ���� �ʽ��ϴ�.
    null ���� ���ϴ� ��� ������ ����� null�̱� �����Դϴ�.
*/

SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN
                    (SELECT mgr.manager_id
                    FROM employees mgr);





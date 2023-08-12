/*
WITH ��
    WITH���� �������� ����� �ӽ÷� �����ϰ� ����� �� �ִ� ����Դϴ�.
    ���� ���̺� ǥ���� : CTE(Common Table Expression)
    
    �ַ� ������ ������ �����ϰ� �ۼ��ϰų� �������� ���̴µ� Ȱ��˴ϴ�.
    
*/

--�μ��� ��ձ޿��� ����ϴ� ����
WITH AvgSalByDept AS (
    SELECT
        department_id,
        AVG(salary) AS avgsalary
    FROM employees
    GROUP BY department_id
)
SELECT d.department_name, AvgSalByDept.avgsalary
FROM departments d
JOIN AvgSalByDept
ON d.department_id = AvgSalByDept.department_id
;


WITH RecursiveCTE (id,name,manager_id, depth) AS (
    SELECT employee_id, last_name, manager_id,0
    FROM employees 
    WHERE manager_id IS NULL--�ֻ��� �Ŵ���
    UNION ALL
    SELECT e.employee_id, e.last_name, e.manager_id, rc.depth+1
    FROM employees e
    INNER JOIN RecursiveCTE rc ON e.manager_id = rc.id
)
SELECT id,name,manager_id , depth
FROM RecursiveCTE;





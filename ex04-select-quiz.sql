--Q1. "employees" ���̺��� ��� �������� ��(last_name), �̸�(first_name)�� �޿�(salary)�� ��ȸ�ϼ���
SELECT last_name,first_name,salary
FROM employees;

--Q2. "jobs"���̺��� ��� �������� ����ID(job_id)�� ������(job_title)�� ��ȸ
SELECT job_id, job_title
FROM jobs;

--Q3. "departments"���̺��� ��� �μ����� �μ�ID(department_id)�� �μ���(department_name)�� ��ȸ
SELECT department_id,department_name
FROM departments;

--Q4. "locations"���̺��� ��� �������� ���� ID(location_id)�� ����(city)�� ��ȸ
SELECT location_id,city
FROM locations;

--Q5. "employees"���̺��� �޿�(salary)�� 5000 �̻��� �������� �̸�(first_name)�� �޿�(salary)�� ��ȸ
SELECT first_name,salary
FROM employees
WHERE salary >=5000;

--Q6. "employees"���̺��� �ٹ� ������(hire_date)�� 2005�� ������ �������� �̸�(first_name)�� 
--    �ٹ� ������(hire_date)�� ��ȸ

SELECT hire_date,first_name

FROM employees
WHERE hire_date>= '05/01/01';
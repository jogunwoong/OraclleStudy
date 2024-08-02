SELECT *
FROM EMPLOYEE;

SELECT EMP_NAME "�����", SALARY "�޿�", BONUS "���ʽ�", JOB_CODE "�����ڵ�"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '__m%';

SELECT COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN (2, 4);

SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE ENT_YN = 'N';

SELECT COUNT(*)
FROM EMPLOYEE
WHERE EXTRACT(MONTH FROM HIRE_DATE) = 9;

SELECT EMP_NAME "�����", EMP_NO "�ֹε�Ϲ�ȣ", JOB_CODE "�����ڵ�", DEPT_CODE"�μ��ڵ�", SALARY "�޿�", BONUS "���ʽ�",EMAIL
FROM EMPLOYEE
WHERE (JOB_CODE = 'J6' OR JOB_CODE = 'J7') AND SALARY >= 2000000 AND BONUS IS NOT NULL
        AND SUBSTR(EMP_NO, 8, 1) IN (2, 4) AND EMAIL LIKE '___#_%' ESCAPE '#';
        
        /*
        1) �����ڵ忡 ���� ������ �켱������ ���� ����� ������� ����
            => ��ȣ�� �����ְų� IN �����ڷ� ��ü�ؾ� ��
        2)  �ۼ��� ������ SALARY ���� 200���� �ʰ� (>) �� �ۼ��Ǿ� ����
            => 200���� �̻��� ������ ��ȣ�� �߰��������(>=)
        3) �̸����� 4��°�ڸ��� ����ٸ� �����μ� ������ �ְ��� �Ѵٸ� ESCAPE�� ����Ͽ� ������ 
            ���ϵ�ī��� ��������� ��
        4) ���ʽ��� �ִ� ����� ��ȸ�ؾ� �ϴµ� ���� ����� ��ȸ�ϰ� ����
            => BONUS IS NULL --> BONUS IS NOT NULL�� ��������� ��
        5) ���ڻ�� ������ ������
            =>���ڻ�� ������ �߰������ �� SUBSTR(EMP_NO, 8, 1) IN ( 2, 4)
        
        */


/*
    ������ ��ȸ(����) : SELECT
    
        SELECT ��ȸ�ϰ��� �ϴ� ���� FROM ���̺��;
        SELECT * �Ǵ� �÷���1, �÷���2, .... FROM ���̺��;
        
*/
--��� ����� ������ ��ȸ
SELECT * FROM EMPLOYEE;

--��� ����� �̸�, �ֹι�ȣ, �ڵ�����ȣ�� ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE;

-- JOB ���̺��� �����̸��� ��ȸ
SELECT * FROM JOB;

SELECT JOB_NAME
FROM JOB;

-- DEPARTMENT ���̺��� ��� ������ ��ȸ
SELECT * FROM DEPARTMENT;

-- ���� ���̺��� �����, �̸���, ����ó, �Ի���, �޿� ��ȸ
SELECT * FROM EMPLOYEE;

SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY 
FROM EMPLOYEE;

/*
    �÷����� ��� �����ϱ�
    => SELECT���� �÷��� �ۼ��κп� ��������� �� �� ����
*/
-- ����̸�, �������� ��ȸ

SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- ����̸� �޿�, ���ʽ�, ����, ���ʽ� ���� ����(�޿� + (�޿� * ���ʽ�)) * 12 ������ ��ȸ

SELECT EMP_NAME, BONUS, SALARY * 12, (SALARY + (SALARY * BONUS)) *12 
FROM EMPLOYEE;

/*
    ���糯¥ �ð� ���� : SYSDATEE
    ���� ���̺� (�ӽ� ���̺�) : DUAL
*/
-- ���� �ð� ���� ��ȸ
SELECT SYSDATE FROM DUAL; --YY/DD/MM �������� ��ȸ��!

-- ����̸�, �Ի���, �ٹ��ϼ� ��ȸ
-- DATEŸ�� - DATEŸ�� - �Ϸ�ǥ�õ�!
SELECT EMP_NAME, HIRE_DATE, SYSDATE-HIRE_DATE
FROM EMPLOYEE;

/*
    * �÷��� ��Ī���� : ������� ����� ��� �ǹ��ľ��� ��Ʊ� ������, ��Ī�� �ο��Ͽ� ��Ȯ�ϰ� ����ϰ� ��ȸ����!
    
    [ǥ����] 1) �÷��� ��Ī
            2) �÷��� AS ��Ī
            3) �÷��� "��Ī"
            4) �÷��� AS "��Ī"
*/

-- ����̸� �޿�, ���ʽ�, ����, ���ʽ� ���� ����(�޿� + (�޿� * ���ʽ�)) * 12 ������ ��ȸ

SELECT EMP_NAME ����̸�, SALARY �޿�, BONUS ���ʽ�, SALARY * 12 ����, (SALARY + (SALARY * BONUS)) *12 "���ʽ� ���� ����" 
FROM EMPLOYEE;

/*
    * ���ͷ� : ���Ƿ� ������ ���ڿ� ('')
    -> SELECT ���� ����ϴ� ��� ��ȸ�Ȱ��(RESULT SET)�� �ݺ������� ǥ�õ�
*/
--�̸�,�޿�,�� ���

SELECT EMP_NAME �̸�, SALARY �޿�, '��' ����
FROM EMPLOYEE;

/*
    ���� ������ : || 
*/
SELECT SALARY || '��' AS �޿�
FROM EMPLOYEE;

--���, �̸�, �޿����� �ѹ��� ��ȸ
SELECT EMP_ID || EMP_NAME || SALARY 
FROM EMPLOYEE;

--XXX �� �޿��� XXXX�� �Դϴ�
SELECT EMP_NAME || '�� �޿���' || SALARY || '�Դϴ�.' �޿�����
FROM EMPLOYEE;

-- ������̺��� �����ڵ� ��ȸ
SELECT JOB_CODE
FROM EMPLOYEE;

/*
    + �ߺ����� : DISTINCT 
*/
-- ������̺��� �����ڵ� ��ȸ
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;


-- DISTINCT
-- DISTINCT�ϳ� ���� �ѽ����� ��� �ߺ�����
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMPLOYEE;

--=============================================

/*
    WHERE�� : ��ȸ�ϰ��� �ϴ� �����͸� Ư�� ���ǿ� ���� �����͸� �����ϰ��� �� �� ���
            
            (ǥ����)
                    SELECT �÷���, �÷�|�����ͱ��� �����
                    FROM ���̺��;
                    WHERE ����;
                    
    - �񱳿�����
        * ��Һ� : >, <, >=, <=
        * ����� : 
                - ������ : =
                - �ٸ��� : !=, <>, ^=     
*/
-- ������̺��� �μ��ڵ尡 'D9'�� ����鸸 ��ȸ
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- ������̺��� �μ��ڵ尡 'D1'�� ������� �����, �޿�, �μ��ڵ带 ��ȸ
SELECT DISTINCT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

--�μ��ڵ尡 D1�� �ƴ� ������� ���� ��ȸ
SELECT DISTINCT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE <> 'D1';

SELECT DISTINCT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY >= 4000000;

--========================================
-- 1. �޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ������ȸ (��Ī����)

-- 2. ������ 5õ���� �̻��� ������� �����, �޿�, ����, �μ��ڵ� ��ȸ(��Ī����)

-- 3. �����ڵ� 'J3' �� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ (��Ī����)

-- 4. �޿��� 350���� �̻� 600���� ������ ��� ����� �����, ���, �޿� ��ȸ
SELECT DISTINCT EMP_NAME �̸�, SALARY �޿�, HIRE_DATE �Ի���, SALARY * 12 ����
FROM EMPLOYEE
WHERE SALARY >= 3000000 ;

SELECT DISTINCT EMP_NAME �̸�, SALARY �޿�, SALARY * 12 ����, DEPT_CODE �μ��ڵ�
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000 ;

SELECT DISTINCT EMP_ID ���, EMP_NAME �����, JOB_CODE �����ڵ�, ENT_YN ��翩��
FROM EMPLOYEE
WHERE JOB_CODE <> 'J3' ;

SELECT DISTINCT EMP_NAME �����, SALARY �޿�, EMP_ID ���
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000 ;

-- 1. JOB ���̺��� ��� ���� ��ȸ
SELECT *FROM JOB;

-- 2. JOB ���̺��� ���� �̸� ��ȸ
SELECT JOB_NAME
FROM job;

-- 3. DEPARTMENT ���̺��� ��� ���� ��ȸ
SELECT * FROM DEPARTMENT;

-- 4. EMPLOYEE���̺��� ������, �̸���, ��ȭ��ȣ, ����� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE
FROM EMPLOYEE;

-- 5. EMPLOYEE���̺��� �����, ��� �̸�, ���� ��ȸ
SELECT HIRE_DATE, EMP_NAME, SALARY
FROM EMPLOYEE;

-- 6. EMPLOYEE���̺��� �̸�, ����, �Ѽ��ɾ�(���ʽ�����), �Ǽ��ɾ�(�Ѽ��ɾ� - (����*���� 3%)) ��ȸ
SELECT EMP_NAME, SALARY * 12, (SALARY + (SALARY * BONUS)) *12,((SALARY + (SALARY * BONUS)) *12 - (SALARY * 12 * 0.03))
FROM employee;

-- 7. EMPLOYEE���̺��� �Ǽ��ɾ�(6�� ����)�� 5õ���� �̻��� ����� �̸�, ����, �Ǽ��ɾ�, ����� ��ȸ
SELECT HIRE_DATE, EMP_NAME, SALARY,((SALARY + (SALARY * BONUS)) *12 - (SALARY * 12 * 0.03)),HIRE_DATE
FROM EMPLOYEE
WHERE ((SALARY + (SALARY * BONUS)) *12 - (SALARY * 12 * 0.03)) >= 50000000;

-- 8. EMPLOYEE���̺� ������ 4000000�̻��̰� JOB_CODE�� J2�� ����� ��ü ���� ��ȸ
SELECT * 
FROM EMPLOYEE
WHERE SALARY >= 4000000 AND JOB_CODE = 'J2';



-- 9. EMPLOYEE���̺� DEPT_CODE�� D9�̰ų� D5�� ��� �� 
--     ������� 02�� 1�� 1�Ϻ��� ���� ����� �̸�, �μ��ڵ�, ����� ��ȸ
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE = 'D9' OR DEPT_CODE = 'D5') AND HIRE_DATE < '02/01/01';
--===============================================
/*
    *BETWEEN AND : ���ǽĿ��� ���Ǵ� ����
        => ~�̻� ~~������ ������ ���� ������ �����ϴ� ����
        
        [ǥ����]
            �񱳴�� �÷��� BETWEEN �ּڰ� AND �ִ�
            =>�ش� �÷��� ���� �ּڰ� �̻��̰� �ִ� ������ ��� ��ȸ
*/
--�޿��� 350���� �̻��̰� 600���� ������ ����� �����,���,�޿� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;

/*
    * NOT : ����Ŭ ������������ 
*/
-- �޿��� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����, ���, �޿� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY < 3500000 OR SALARY >6000000;

SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
-- NOT�� BETWEEN �տ� ���̰ų� �÷��� �տ� �ٿ��� ��� ����!

/*
    * IN : �񱳴���÷����� ������ ���� �߿� ��ġ�ϴ� ���� �ִ� ��� ��ȸ�ϴ� ������
    
    [ǥ����]
        �񱳴���÷��� IN ('��','��','��', ...)
*/
-- �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5';

SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D6','D8','D5');

SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D9') AND HIRE_DATE < '02/01/01';

--=================================================================
/*
    *LIKE : ���ϰ����ϴ� �÷��� ���� ������ Ư�� ���ֿ� ������ ��� ��ȸ
    
        => Ư�� ���� : '%','_' �� ���ϵ�ī��� ���
            '%' : 0���� �̻�
            EX) �񱳴���÷��� LIKE '����%' => �񱳴��  �÷��� ���� ���ڷ� "����"�Ǵ� ���� ��ȸ
                �񱳴�� �÷��� LIKE '%����' => �񱳴�� �÷��� ���� ���ڷ� "��"���� ���� ��ȸ
                => �񱳴�� �÷��� LIKE'%����%' =>�񱳴�� �÷��� ���� ���ڰ� "����"�Ǵ� ���� ��ȸ
            '_' : 1����
            EX) �񱳴���÷��� LIKE '_����" => �񱳴���÷��� ������ ���� �տ� ������ �ѱ��ڰ� �� ��� ��ȸ
                �񱳴���÷��� LIKE '__����" => �񱳴���÷��� ������ ���� �տ� ������ �α��ڰ� �� ��� ��ȸ
                �񱳴���÷��� LIKE'_����_' => �񱳴���÷��� ������ ���� ��,�ڿ� ������ �ѱ��ھ� �� ��� ��ȸ
*/
-- ����� �߿� ������ ����� �����, �޿�, �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';

-- ��� �̸��� �ϰ� ���Ե� ����� �����, �ֹι�ȣ, ����ó ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

-- ��� �̸��� ��� ���ڰ� ���� ����� �����, ����ó ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_��_';

-- ������� ����ó�� 3��° �ڸ��� 1�� ����� ���, �����, ����ó, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- ����� �� �̸��Ͽ� 4��° �ڸ��� _�� ����� ���, �̸�, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '%%%_%';
-- ���ϵ�ī��� ���Ǵ� ���ڿ� �÷��� ��� ���ڰ� �����ϱ� ������ ��� ���ϵ�ī��� �λ��!
-- ����, ������ ����� ��! => ������ ���ϵ�ī�� ����ϱ�! ESCAPE �� ����Ͽ� ��� �� ����

SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$' ;
--============================================
/*
    * IS NULL / IS NOT NULL : �÷����� NULL�� ������� NULL���� ���� �� ����ϴ� ������
*/
-- ���ʽ��� �����ʴ� ������� ���, �̸�, �޿�, ���ʽ���ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- ����� ���»��(MANAGER_ID�� ���� NULL) �����, ������, �μ��ڵ� ��ȸ
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL;

-- �μ���ġ�� ���� �ʾҰ�, ���ʽ��� �ް��ִ� ����� �����, ���ʽ�, �μ��ڵ�
SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
--====================================================
/*
    * ������ �켱����
        (0) ()
        (1) ��������� : * / + -
        (2) ���Ῥ���� : ||
        (3) �񱳿����� : > < >= <= = !=
        (4) IS NULL/ LIKE '����' / IN
        (5) BETWEEN AND
        (6) NOT
        (7) AND
        (8) OR
*/
-- �����ڵ尡 J7 �̰ų� J2 �� ����� �� �޿��� 200���� �̻��� ����� ��� ���� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE IN ('J2', 'J7') AND SALARY >= 2000000;
--================================================
/*
    * ORDER BY : SELECT �� ���� ������ �ٿ� �ۼ�, ���� �������� �������� ����
    
    [ǥ����]
        SELECT ��ȸ�� �÷�
        FROM ���̺� ��
        WHERE ���ǽ�
        ORDER BY ���� ������ �Ǵ� �÷�|��Ī|�÷����� 
         ��������:ASC
         ��������:DESC
         NULLS FIRST : ���� �Ǿտ�(DESC �� ��� �⺻��)
         NULLS LAST : ���� �ǵڿ�(ASC �� ��� �⺻��)                                        
*/
-- ��� ����� �����, ���� ��ȸ (������ �������� ����)
SELECT EMP_NAME, SALARY * 12 ����
FROM EMPLOYEE
-- ORDER BY SALARY * 12 DESC;
-- ORDER BY ���� DESC;
ORDER BY 2 DESC; --�÷� ���� ���( ����Ŭ������ 1���� ����)

-- ���ʽ� �������� ����
SELECT *
FROM EMPLOYEE
-- ORDER BY BONUS; -- �⺻�� (ASC, NULLS LAST)
-- ORDER BY BONUS ASC; -- �⺻�� (ULLS LAST)
-- ORDER BY BONUS ASC NULLS LAST;
-- ORDER BY BONUS DESC;  -- NULLS FIRST (DESC ������ ��� �⺻��)
-- ���ʽ��� ��������, �޿��� ��������
-- =>���ʽ� ���� �������� �����ϴµ�, ���� ���� ��� �޿��� ���� ������������ ���� 
ORDER BY BONUS DESC, SALARY ASC;

-- 1. EMPLOYEE ���̺� ������� 90/01/01 ~ 01/01/01�� ����� ��ü ������ ��ȸ
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
-- 2. EMPLOYEE ���̺��� �̸� ���� '��'���� ������ ����� �̸� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';

-- 3. EMPLOYEE ���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ�� ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE NOT PHONE LIKE '010%';
-- 4. EMPLOYEE ���̺��� �����ּ� '_'�� ���� 4���̸鼭 DEPT_CODE�� D9 �Ǵ� D6�̰� 
--     ������� 90/01/01 ~ 00/12/01�̰�, �޿��� 270�� �̻��� ����� ��ü�� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '____$_%' ESCAPE '$'AND DEPT_CODE IN ('D9','D6') AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01' AND SALARY >= 2700000;



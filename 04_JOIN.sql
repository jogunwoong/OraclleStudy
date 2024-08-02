/*
    JOIN
    : �ΰ� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ���Ǵ� ����
      ��ȸ ����� �ϳ��� �����(RESULT SET) �� ����
      
      * ������ �����ͺ��̽�(RDB) ������ �ּ����� �����͸� ������ ���̺� ����
        �ߺ������� �ּ�ȭ�ϱ� ���� �ִ��� �ɰ��� ������
        
        => ������ �����ͺ��̽����� �������� �̿��� ���̺��� "����"�� �δ� ���
        (�� ���̺��� �����(�ܷ�Ű)�� ���ؼ� �����͸� ��Ī���� ��ȸ!)
        
        JOIN�� ũ�� "����Ŭ ���� ����" �� "ANSI ����" (�̱�����ǥ����ȸ)
        
                ����Ŭ ���뱸��              |             ANSI����
                ------------------------------------------------
                � ����                   |             ��������
              (EQUAL JOIN)                 |  (INNER JOIN --> JOIN USING/ON)
              ---------------------------------------------------
               ���� ����                                
               (LEFT JOIN)                 |     ���� �ܺ� ����(LEFT OUTER JOIN)
              (RIGHT JOIN)                 |     ������ �ܺ� ����(RIGHT OUTER JOIN)
                                                 ��ü �ܺ� ����(FULL OUTER JOIN)
                -------------------------------------------------------    
                ��ü����(SELF JOIN)         |       JOIN ON
                �� ����(NON EQUAL JOIN) |    
                ----------------------------------------------------
*/          
-- ��ü ������� ���, �����, �μ��ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;

-- �μ��ڵ�, �μ��� ��ȸ (�μ� ������ ����� ���̺� : DEPARTMENT)
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;

--��ü ������� ��� ����� �����ڵ�
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE;

--�����ڵ�, ���޸� ��ȸ (�������� : JOB)
SELECT JOB_CODE, JOB_NAME
FROM JOB;

/*
    * � ����(EQUAL JOIN) / ��������(INNER JOIN)
    => �����Ű�� �÷��� ���� ��ġ�ϴ� ��鸸 ��ȸ => �������� �ʴ� ���� ��ȸ�� ����
    
    --------------����Ŭ ���� ����
    
        *FROM���� ��ȸ�ϰ��� �ϴ� ���̺��� ���� (,�� ����)
        * WHERE ���� ��ĥ��ų �÷��� ���� ������ �ۼ�
        
*/
--����� ���, �̸�, �μ����� ��ȸ( �μ��ڵ� �÷�=> EMPLOYEE: DEPT_CODE, DEPARTMENT: DEPT_ID)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

--=> NULL(EMPLOYEE, DEPT_CODE), �����ú�(D3), �ؿ� ����3��(D7), ���� ������(D4) -> DEPARTMENT�� ���ܵ�

--> ����� ���, �̸�, ���޸��� ��ȸ(�����ڵ� �÷�=> EMPLOYEE, JOB_CODE, JOB JOB_CODE)
--> �� ���̺��� �÷����� ������ ��� ��Ī�� ���������ν� ������ �� ����!
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

-- ANSI ���� --
/*
    FROM���� ������ �Ǵ� ���̺��� �ϳ� �ۼ�
    JOIN���� �����ϰ��� �ϴ� ���̺��� ��� + ��Ī��Ű���� �ϴ� ������ �ۼ�
    - JOIN USING    : �÷����� ���� ���
    - JOIN ON       : �÷����� ���ų� �ٸ����
*/
-- ���, ���, �μ��� ��ȸ (EMPLOYEE: DEPT_CODE, DEPARTMENT: DEPT_ID)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
    JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

-- ���, �����, ���޸� ��ȸ(EMPLOYEE: JOB_CODE, JOB: JOB_CODE)
-- JOIN USING �������
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE
    JOIN JOB USING (JOB_CODE);

--JOIN ON ���� ���
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE E
    JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

-- �븮 ������ ����� ���, �����, ���޸�, �޿� ��ȸ

--**����Ŭ ���� ���
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE AND JOB_NAME = '�븮';

--**ANSI���� ���
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
    JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '�븮';

---------------------QUIZ--------------
-- [1] �μ��� �λ�������� ������� ���, �����, ���ʽ� ��ȸ
--**����Ŭ ����**
SELECT EMP_ID, EMP_NAME, BONUS
FROM DEPARTMENT D,EMPLOYEE E
WHERE DEPT_CODE = DEPT_ID AND DEPT_TITLE = '�λ������';

--**ANSI ����**
SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE = '�λ������';

--[2] �μ�(DEPARTMENT)�� ����(LOCATION) ������ �����Ͽ�
                        --��ü�μ��� �μ��ڵ�, �μ���, �����ڵ�, ������ ��ȸ

--** ����Ŭ ����**--
SELECT DEPT_ID, DEPT_TITLE, LOCAL_CODE, LOCATION_ID
FROM DEPARTMENT D, LOCATION L
WHERE LOCAL_CODE = LOCATION_ID;


--** ANSI ����**--
SELECT DEPT_ID, DEPT_TITLE, LOCAL_CODE, LOCATION_ID
FROM DEPARTMENT
        JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

 --[3] ���ʽ��� �޴� ������� ���, �����, ���ʽ�, �μ��� ��ȸ
 
--** ����Ŭ ����**--
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND BONUS IS NOT NULL;


--** ANSI ����**--    
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE
        JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE BONUS IS NOT NULL;
    
--[4] �μ��� �ѹ��ΰ� �ƴ� ������� �����, �޿� ��ȸ

--** ����Ŭ ����**--
SELECT EMP_NAME, SALARY
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID = DEPT_CODE AND DEPT_TITLE != '�ѹ���';


--** ANSI ����**--
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
        JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE != '�ѹ���';

-----------------------------------------------------
/*
    �������� / �ܺ����� (OUTER JOIN)
    : �� ���̺� ���� JOIN�� ��ġ���� �ʴ� �൵ �����Ͽ� ��ȸ�ϴ� ����
     ��, �ݵ�� LEFT/RIGHT �� �����ؾ� �� (������ �Ǵ� ���̺�)
*/
-- �������, �μ���, �޿�, ���� ������ ��ȸ
-- LEFT JOIN : �� ���̺� �� ���ʿ� �ۼ��� ���̺��� �������� ����

--**����Ŭ ����**

SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);

--**ANSI����**
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;
    
-- *RIGHT���� : �� ���̺� �� �����ʿ� �ۼ��� ���̺� �������� ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID
ORDER BY EMP_NAME;

-- ** ANSI���� **
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE
    RIGHT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;
    
-- * FULL JOIN : �� ���̺��� ���� ��� ���� ��ȸ�ϴ� ���α��� (����Ŭ ���뱸��X)
--** ANSI���� **
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 ����
FROM EMPLOYEE
    FULL JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;




    
    
    
    
    
    
    
    
    
    



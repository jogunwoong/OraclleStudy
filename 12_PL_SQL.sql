/*
    * PL/SQL : PROCEDURE LANGUAGE EXTENSION TO SQL
    
    ����Ŭ ��ü�� ����Ǿ� �ִ� ö���� ���
    SQL ���� ������ ���� ����, ����, �ݺ�, ���� �����Ͽ� SQL ������ ����
    �ټ��� SQL���� �ѹ��� ���� ����
    
    * ���� *
    [�����] : DECLARE �� ����.������ ����� �ʱ�ȭ�ϴ� �κ�
     ����� : BEGIN ���� ����.SQL�� �Ǵ� ���(���ǹ�,�ݺ���)���� ������ �ۼ��ϴ� �κ�
    [����ó����] : EXCEPTION ���� ����.���ܹ߻��� �ذ��ϱ� ���� �κ�
*/
SET SERVEROUTPUT ON;--ȭ�鿡 ǥ���ϱ� ���� ����

--HELLO ORACLE ���
BEGIN 
    --�ڹ� : System.out>println("HELLO JAVA');
    DBMS_OUTPUT.PUT_LINE('HELLO ORACLE');
END;

/*
    * ����� (DECLARE)
    : ���� �Ǵ� ����� �����ϴ� �κ� (����� ���ÿ� �ʱ�ȭ�� ����)
    
    -������ Ÿ�� ���� ����
        �Ϲ� Ÿ��
        ���۷��� Ÿ��
        ROW Ÿ��
*/
/*
    - �Ϲ� Ÿ�� ����
    
        ������ [CONSTANT] �ڷ���[:=��]
            ��� ����� CONSTANT�� �ٿ���
            �ʱ�ȭ �� ���� := ��ȣ�� ���
*/
DECLARE 
    EID NUMBER; --EID ��� �̸��� NUMBER Ÿ�� ���� ����
    ENAME VARCHAR2(20); --ENAME �̶�� �̸��� VARCHAR(20) Ÿ�� ��������
    PI CONSTANT NUMBER :=3.14; -- PI��� �̸��� NUMBER Ÿ�� ������� �� 3.14�� �ʱ�ȭ
BEGIN
    --������ ���� ����
    EID := 100; --EID ��� ������ 100�̶�� ���� ����
    ENAME := '�Ӽ���'; --ENAME �̶�� ������ �� �̸��� ������ ����
    
    --�� ����, ����� ����� ���� ȭ�鿡 ���
    --Ư�� ���ڿ� �Ť����� ���� ����ϰ��� �� �� ���� ������ (||)�� ���
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('PI : '|| PI);
END;
/
--���� �Է¹޾� ������ ����
DECLARE 
    EID NUMBER; --EID ��� �̸��� NUMBER Ÿ�� ���� ����
    ENAME VARCHAR2(20); --ENAME �̶�� �̸��� VARCHAR(20) Ÿ�� ��������
    PI CONSTANT NUMBER :=3.14; -- PI��� �̸��� NUMBER Ÿ�� ������� �� 3.14�� �ʱ�ȭ
BEGIN
    
    EID := &��ȣ; --EID ��� ������ 100�̶�� ���� ����
    ENAME := '�Ӽ���'; --ENAME �̶�� ������ �� �̸��� ������ ����
    
    --�� ����, ����� ����� ���� ȭ�鿡 ���
    --Ư�� ���ڿ� ������ ���� ����ϰ��� �� �� ���� ������ (||)�� ���
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('PI : '|| PI);
END;
/
------------------------------------------
/*
    *���۷��� Ÿ�� ����
     : � ���̺��� � �÷��� ������ Ÿ���� �����Ͽ� �ش� Ÿ������ ������ ����
     
     ������ ���̺��.�÷���%TYPE
*/
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE; --VARCHAR2
    ENAME EMPLOYEE.EMP_NAME%TYPE; --VARCHAR2
    SAL EMPLOYEE.SALARY%TYPE; --NUMBER
BEGIN
    --EID := '100';
    --ENAME := '�Ӽ���';
    --SAL := 3000000;
    
    --EMPLOYEE ���̺��� 200�� ����� ���, �����, �޿� ��ȸ
    SELECT EMP_ID, EMP_NAME, SALARY
    INTO EID, ENAME, SAL
    FROM EMPLOYEE
   -- WHERE EMP_ID = 200;
    WHERE EMP_ID = &���; --����� �Է¹޾� ��ȸ�� �� �� ����� ������ ����
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || SAL);
END;
/
--����--
/*
    ���۷��� Ÿ�� ������ EID, ENAME, JCODE, SAL, DTITLE�� �����ϰ�
    �� �ڷ����� EMPLOYEE ���̺��� EMP_ID, EMP_NAME, JOB_CODE, SALARY�÷���
    DEPARTMENT ���̺��� DEPT_TITLE �÷��� �����ϵ��� �� ��
    ����ڰ� �Է��� ����� ��������� ��ȸ�Ͽ� ������ ��� ���
    
    ������� : [���], [�̸�], [�����ڵ�], [����], [�μ���]
    
*/
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY, DEPT_TITLE
INTO EID, ENAME, JCODE, SAL, DTITLE
FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE EMP_ID = &���;
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('JCODE : ' || JCODE);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || SAL);
    DBMS_OUTPUT.PUT_LINE('DTITLE : ' || DTITLE);
END;
/

/*
    * ROW Ÿ�� ����
     : ���̺��� �� �࿡ ���� ��� �÷����� �ѹ��� ���� �� �ִ� ����
     
     ������ ���̺��%ROWTYPE;
*/
DECLARE
    E EMPLOYEE%ROWTYPE;
BEGIN
    SELECT *
    INTO E
    FROM EMPLOYEE
    WHERE EMP_ID = &���;
    
    --�����, �޿�, ���ʽ� ������ ���
    DBMS_OUTPUT.PUT_LINE('����� : ' || E.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || E.SALARY);
    DBMS_OUTPUT.PUT_LINE('���ʽ� : ' || NVL(E.BONUS, 0));
END;
/
----------------------------------------------------
/*
    * ����� (BRGIN)
    
    **���ǹ�**
        - ���� IF �� : IF ���ǽ�THEN ���೻�� END IF;
        - IF/ELSE �� : IF ���ǽ� THEN ���ǽ��� ���� �� ���೻�� 
                            ELSE ���ǽ��� ������ �� ���೻��
                            END IF;
        - IF/ELSE �� : IF���ǽ�1 THEN ���೻��1 ELSIF ���ǽ�2 THEN ���೻��2 ...[ELSE ���೻��] END IF;
        - CASE/WHEN/THEN ��
            CASE �񱳴�� WHEN ����񱳰�1 THEN �����1
                        WHEN �񱳰�2 THEN �����2
                        WHEN �񱳰�3 THEN �����3
                        ...
                        ELSE �����N
            END;
*/
-- ����ڿ��� ����� �Է¹��� �� �ش� ����� ���, �̸�, �޿�, ���ʽ� ������ ���
-- �� �����Ϳ� ���� ���� : ���(EID), �̸�(ENAME), ���ʽ�(BONUS)
-- ��, ���ʽ� ���� 0�� ����� ��� "���ʽ��� ���� �ʴ� ����Դϴ�." ���

DECLARE
EMP_ID EMPLOYEE.EMP_ID%TYPE;
EMP_NAME EMPLOYEE.EMP_NAME%TYPE;
DEPT_TITLE DEPARTMENT.DEPT_TITLE%TYPE;
NATIONAL_CODE LOCATION.NATIONAL_CODE%TYPE;
TEAM VARCHAR2(20);
BEGIN
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
INTO EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
FROM EMPLOYEE E, DEPARTMENT D, LOCATION L
WHERE E.DEPT_CODE = D. DEPT_ID AND D.LOCATION_ID = L.LOCAL_CODE AND EMP_ID = '&EMP_ID';
IF(NATIONAL_CODE = 'KO') THEN TEAM := '������';
ELSE TEAM := '�ؿ���';
END IF;
DBMS_OUTPUT.PUT_LINE('��� : ' || EMP_ID);
DBMS_OUTPUT.PUT_LINE('�̸� : ' || EMP_NAME);
DBMS_OUTPUT.PUT_LINE('�μ� : ' || DEPT_TITLE);
DBMS_OUTPUT.PUT_LINE('�Ҽ� : ' || TEAM);
END;
/
/*
    ����(SCORE)
    ���(GRADE) -'A','B','C','D','F'
    
    ����ڿ��� ������ �Է¹޾�
    90�� �̻��̸� 'A'
    80�� �̻��̸� 'B'
    70�� �̻��̸� 'C'
    60�� �̻��̸� 'D'
    �� �Ʒ��� 'F'
    
    <<���>>
    "������ XX����̰�, ����� X�Դϴ�."
    ���� F����̶�� "���� ����Դϴ�."
*/
DECLARE
    SCORE NUMBER;
    GRADE CHAR(1);
BEGIN
    SCORE := &����;
    
    IF SCORE >= 90
        THEN GRADE := 'A';
    ELSIF SCORE >= 80
        THEN GRADE := 'B';
    ELSIF SCORE >= 70
        THEN GRADE := 'C';
    ELSIF SCORE >= 60
        THEN GRADE := 'D';
    ELSE
        GRADE := 'F';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('������' || SCORE || '�̰�, �����' || GRADE || '�Դϴ�.');
    IF GRADE = 'F'
        THEN DBMS_OUTPUT.PUT_LINE('���� ����Դϴ�.');
        END IF;
END;
/
--����� �ش��ϴ� ����� �μ��ڵ� �������� �μ����� ��� (JOIN���X)
DECLARE
    EMP EMPLOYEE%ROWTYPE;
    DTITLE VARCHAR2(50);
BEGIN
    SELECT *
    INTO EMP
    FROM EMPLOYEE
    WHERE EMP_ID = &���;
    
    --�ش� ����� �μ��ڵ� ������ �μ��� ����
    DTITLE := CASE EMP.DEPT_CODE
                WHEN 'D1' THEN '�λ������'
                WHEN 'D2' THEN 'ȸ�������'
                WHEN 'D3' THEN '�����ú�'
                WHEN 'D4' THEN '����������'
                WHEN 'D5' THEN '�ؿܿ���1��'
                WHEN 'D5' THEN '�ؿܿ���2��'
                WHEN 'D5' THEN '�ؿܿ���3��'
                WHEN 'D5' THEN '���������'
                WHEN 'D5' THEN '�ѹ���'
                ELSE '�μ�����'
                END;
    DBMS_OUTPUT.PUT_LINE(EMP.EMP_NAME || '����� �ҼӺμ���' || DTITLE ||'�Դϴ�.');
END;
/

SELECT * FROM DEPARTMENT;
----------------------------------------
/*
    * �ݺ���
    
        - �⺻ ���� : LOOP 
                        �ݺ��� �׹�
                        �ݺ����� ������ ����
                EHD LOOP;
                
                *�ݺ����� ������ ����
                [1] IF ���ǽ� THEN EXIT; END IF;
                [2] EXIT WHEN ���ǽ�;
                
            - FOR LOOP��
                FOR ���� IN [REVERSE] �ʱⰪ..������
                LOOP �ݺ��� ���� END LOOP;
                
                * REVERSE : ���������� �ʱⰪ���� �ݺ�
                
            - WHILE LOOP ��
                WHILE ���ǽ�
                LOOP �ݺ��� ���� END LOOP;
*/
-- �⺻������ ����Ͽ� 'HELLO ORACLE!' �� 5�� ���
DECLARE
    N NUMBER :=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('HELLO ORACLE!');
        N:=N+1;
        
        IF N > 5 THEN EXIT;
        END IF;
    END LOOP;
END;
/
--FOR LOOP���� ����Ͽ� HELLO ORACLE! 5�� ���
BEGIN
    FOR I IN REVERSE 1..50555
    LOOP
        DBMS_OUTPUT.PUT_LINE(I || ')HELLO ORACLE!!');
    END LOOP;
END;
/
--TEST ���̺� ����
DROP TABLE TEST;

CREATE TABLE TEST(
    TNO NUMBER PRIMARY KEY,
    TDATE DATE
);

CREATE SEQUENCE SEQ_TWO
INCREMENT BY 2
MAXVALUE 1000
NOCYCLE
NOCACHE;

--TEST ���̺� �����͸� 100�� �߰� (TNO : ������ ���, TDATE : ���糯¥)

SELECT * FROM TEST;

DECLARE
    N NUMBER := 1;
BEGIN
    LOOP
        INSERT INTO TEST VALUES(SEQ_TWO.NEXTVAL, SYSDATE);
        N:=N+1;
        IF N >= 100 THEN EXIT;
        END IF;
    END LOOP;
END;
/
SELECT * FROM TEST;
---------------
/*
    * ����ó����
        -���� (EXCEPTION) : ������ �߻��ϴ� ����
        
    EXCEPTION
        WHEN ���ܸ� THEN ����ó������;
        WHEN ���ܸ� THEN ����ó������;
        ...
        WHEN OTHERS THEN ����ó������;
        
        * ����Ŭ���� �̸� ������ ���� => �ý��� ����
            - NO_DATA_FOUND : ��ȸ�� ����� ������
            - TOO_MANY_ROWS : ��ȸ�� ����� �������� �� (=> ������ ����..)
            - ZERO_DIVIDE : 0���� ���� �������� �� ��
            - DUP_VAL_ON_INDEX : UNIQUE ���ǿ� ����� �� (�ߺ��Ǵ� ���)
            ...
        *OTHERS : � ���ܵ� �߻��Ǿ��� ��
*/
--����ڿ��� ���ڸ� �Է¹޾� 10���� ���� ����� ���. (0�� �ԷµǾ��� ���� ������ �߻��� �� �ִ�.)
DECLARE
    N NUMBER;
BEGIN

    N := &����;
    DBMS_OUTPUT.PUT_LINE(10/N);
EXCEPTION
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('0�� �ԷµǾ����ϴ�.');
       
END;
/
--EMPLOYEE ���̺� EMP_ID �÷��� �⺻Ű�� ����
--ALTER TABLE EMPLOYEE ADD PRIMARY KEY(EMP_ID);

-- �⺻Ű(PRIMARY KEY) : UNIQUE + NOT NULL

BEGIN
    UPDATE EMPLOYEE
    SET EMP_ID = '&�����һ��'
    WHERE EMP_NAME = '���ö';
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('�ߺ��� ����Դϴ�.');
END;
/
-----------����
/*
    * ����� ����� �Է¹޾� �ش� ����� ���, �̸��� ���
*/
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO EID, ENAME
    FROM EMPLOYEE
    WHERE MANAGER_ID = '&������';
    
    DBMS_OUTPUT.PUT_LINE('��� : ' || EID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || ENAME);
EXCEPTION
    WHEN NO_DATE_FOUND THEN DBMS_OUTPUT.PUT_LINE('�Է��� �������� ���� ����� �����ϴ�.');
    WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('�ش� ����� ���� ����� �����ϴ�.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�. �����ڿ��� �����ϼ���.');
END;
/


    

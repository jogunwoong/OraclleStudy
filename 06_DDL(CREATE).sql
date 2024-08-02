/*
    DDL : ������ ���� ���
    
    ����Ŭ���� �����ϴ� ��ü�� ���� ����� (CREATE)
                            ������ �����ϰ� (ALTER)
                            ���� ��ü�� ���� (DROP)�ϴ� ���
    => ���� �����Ͱ� �ƴ� ��Ģ�� �����ϴ� ���
    
    * ����Ŭ������ ��ü(����) : ���̺�, ��, ������,
                             �ε���, ��Ű��, Ʈ����,
                             ���ν���, �Լ�, ���Ǿ�, �����
*/
-- * CREATE : ��ü�� ���� �����ϴ� ����
/*
    ���̺� �����ϱ�
    => ���̺�: ��� ���� �����Ǵ� ���� �⺻���� �����ͺ��̽� ��ü
              ��� �����͵��� ���̺��� ���� �����
              
    CREATE TABLE ���̺�� (
        �÷��� �ڷ���(ũ��),
        �÷��� �ڷ���,
        �÷��� �ڷ���,
        ...
    )
    
    - �ڷ���
            * ���� => �ݵ�� ũ�� ������ ����� ��!
                + CHAR(����Ʈũ��)    : �������� (������ ������ �����͸� ���� ���)
                                       -> ������ ���̺��� ���� ���� ���� ��� �������� ä���� ����
                                       �ִ� 2000����Ʈ���� ���� ����
                                       
                + VARCHAR2(����Ʈũ��): �������� (�������� ���̰� ���������� �ʴ� ���)
                                      -> ����Ǵ� ������ ���̸�ŭ�� ���� ũ�Ⱑ ����
                                      �ִ� 4000����Ʈ���� ���� ����
            * ���� : NUMBER
            * ��¥ : DATE
*/
--ȸ�� ������ ������ ���̺� : MEMBER
/*  
    - ȸ����ȣ          : ���� - (NUMBER)
    - ȸ�����̵�        : ���� - (VARCHAR2(20))
    - ȸ����й�ȣ       :���� - (VARCHAR2(20))
    - ȸ���̸�          :���� - (VARCHAR2(20))
    - ����             : ���� - '��/'��' (CHAR(3))
    - ����ó           : ���� - (CHAR(13))
    - �̸���            : ���� - (VARCHAR2(50))
    - ������            : ��¥ - (DATE)
*/
CREATE TABLE MEMBER (
    MEM_NO NUMBER,
    MEM_ID VARCHAR2(20),
    MEM_PWD VARCHAR2(20),
    MEM_NAME VARCHAR2(20),
    GENDER CHAR(3),
    PHONE CHAR(13),
    EMAIL VARCHAR2(50),
    JOIN_DATE DATE
);

--MEMBER ���̺� ���� ��ȸ

SELECT * FROM MEMBER;

--------------------------------------------
/*
    �÷��� ���� �߰��ϱ�
    
    COMMENT ON COLUMN ���̺��. �÷��� ID '������';
     * �߸� �ۼ����� ��� �ٽ� �ۼ� �� ���� => �������!
     
*/
COMMENT ON COLUMN MEMBER.MEM_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEM_PWD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.MEM_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN MEMBER.GENDER IS '����';
COMMENT ON COLUMN MEMBER.PHONE IS '����ó';
COMMENT ON COLUMN MEMBER.EMAIL IS '�̸���';
COMMENT ON COLUMN MEMBER.JOIN_DATE IS '������';

--���̺� �����ϰ��� : DROP TABLE ���̺��;

DROP TABLE MEMBER;

-- ���̺� ������ �߰��ϱ� : INSERT INTO ���̺��
-- VALUES( ��, ��, ��, ...)
INSERT INTO MEMBER VALUES (1, 'jgw0928', '1234', '���ǿ�', '��', '010-3700-4468', 'jgw990928@gmail.com', SYSDATE);


SELECT * FROM MEMBER;

INSERT INTO MEMBER VALUES (2, 'DAWUN', '1234', '��ٿ�', '��', NULL, NULL, SYSDATE);

INSERT INTO MEMBER VALUES(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

COMMIT;

/*
    �������� : ���ϴ� ������ ���� �����ϱ� ���ؼ� Ư�� �÷��� �����ϴ� ����
                ������ ���Ἲ�� �����ϱ� ���� ����!
                
                * ���� ��� : �÷��������/���̺������
                
                * ���� : NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY
*/
/*
    NOT NULL ��������
        : �ش� �÷��� �ݵ�� ���� �����ؾ� �ϴ� ��� �����ϴ� ����
        => ����� NULL ���� ����Ǹ� �� �Ǵ� ���
        
        * ������ �߰�(����)/ ���� �� NULL ���� ������� ����!!
        => �÷� ���� ������θ� ���� ����
*/
-- NOT NULL ������ �߰��� ȸ�� ���̺� : MEMBER_NOTNULL
-- ȸ�� ��ȣ, ���̵�, ��й�ȣ, �̸��� ���� �����ʹ� NULL���� �������� �ʰڴ�!
CREATE TABLE MEMBER_NOTNULL(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20)NOT NULL,
    MEM_PWD VARCHAR2(20)NOT NULL,
    MEM_NAME VARCHAR2(20)NOT NULL,
    GENDER CHAR(3),
    PHONE CHAR(13),
    EMAIL VARCHAR2(50),
    JOIN_DATE DATE
);


SELECT * FROM MEMBER_NOTNULL;

INSERT INTO MEMBER NOTNULL
    VALUES (1, 'DAWUN', '1234', '��ٿ�', '��', '010-1234-1234', 'DAWUNI@GAMIL.COM',SYSDATE);

INSERT INTO MEMBER NOTNULL
    VALUES (2, 'QWER', '1234', 'QWER', '��', NULL, NULL, NULL);
    
INSERT INTO MEMBER NOTNULL
    VALUES (3, NULL, '1234', 'QQQ', '��', NULL, NULL, NULL);
    
INSERT INTO MEMBER_NOTNULL
    VALUES(1, 'DAWUN', '1234', '��ٿ�', '��', '010-1234-1234', 'DAWUNI@GAMIL.COM',SYSDATE);
    
    -->�ߺ��Ǵ� �����Ͱ� �������� �߰��� �� �Ǿ��� .... (����ϴ�)...
-------------------------------------------------------------

/*
    UNIQUE ��������
        : �ش� �÷��� �ߺ��� ���� ������� �����ϴ� ��������
        
        *������ �߰�(����)/���� �� ������ �ִ� ������ �� �߿� �ߺ��Ǵ�
         ���� ������� ���� �߻���Ŵ!
*/

CREATE TABLE MEMBER_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20)NOT NULL UNIQUE,         --�÷��������
    MEM_PWD VARCHAR2(20)NOT NULL,
    MEM_NAME VARCHAR2(20)NOT NULL,
    GENDER CHAR(3),
    PHONE CHAR(13),
    EMAIL VARCHAR2(50),
    JOIN_DATE DATE
    
   -- , UNIQUE(MEM_ID)                        --���̺������
);

SELECT * FROM MEMBER_UNIQUE;

INSERT INTO MEMBER_UNIQUE
    VALUES (1, 'KIDAWUN', '1234', '��ٿ�', '��', '010-1234-1234', 'DAWUNI@GMAIL.COM', SYSDATE);

INSERT INTO MEMBER_UNIQUE
    VALUES (2, 'KIDAWUN', '9999', '�ٿ��', '��', NULL, NULL, NULL);
    
    --UNIQUE ���� ���ǿ� ����Ǿ� ������ �߰� ����!
    --> ���� ���뿡 �������Ǹ����� �˷���(�˾ƺ��Ⱑ ��ƴ�.)
    -->�������� ������ �������Ǹ��� �������� ������ �ý��ۿ��� �˾Ƽ� �̸��� �ο���
-----------------------------------------------------------------
/*
    ���� ���Ǹ� �����ϱ�
    
    *�÷��������
    
    CREATE TABLES ���̺��(
        �÷��� �ڷ��� [CONSTRAINT �������Ǹ�] ��������
    );
    * ���̺������
    CREATE TABLES ���̺��(
    �÷��� �ڷ���,
    �÷��� �ڷ���,
    
    [CONSTRAINT  �������Ǹ�] �������� �÷���
    
*/
-- MEMBER_UNIQUE ���̺� ����
DROP TABLE MEMBER_UNIQUE;

CREATE TABLE MEMBER_UNIQUE(
    MEM_NO NUMBER CONSTRAINT MEMNO_NT NOT NULL,
    MEM_ID VARCHAR2(20) CONSTRAINT MEMID_NT NOT NULL,
    MEM_PWD VARCHAR2(20) CONSTRAINT MEMPWD_NT NOT NULL,
    MEM_NAME VARCHAR2(20)CONSTRAINT MEMNAME_NT NOT NULL,
    GENDER CHAR(3),
    PHONE CHAR(13),
    EMAIL VARCHAR2(50),
    JOIN_DATE DATE

    ,CONSTRAINT MEMID_UQ UNIQUE (MEM_ID)
);

INSERT INTO MEMBER
    VALUES(1, 'DAWUNI', '1234', '��ٿ�', '��', '010-1234-1234', 'KIDAWUN@GAMIL.COM',SYSDATE);
    
INSERT INTO MEMBER
    VALUES(2, 'QWER', '1234', 'QWER', '��',NULL,NULL,NULL);
    
SELECT *  FROM MEMBER_UNIQUE;

INSERT INTO MEMBER_UNIQUE
    VALUES(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    
INSERT INTO MEMBER_UNIQUE
    VALUES(4, 'DAWUNI', '1234', '�ٿ��', '��', NULL, NULL,NULL);
    
    
/*
    CHECK(���ǽ�) : �ش� �÷��� ������ �� �ִ� ���� ���� ������ ����
                    ���ǿ� �����ϴ� ������ ������ �� ����
                    => ������ ������ �����ϰ��� �Ҷ� ���
*/
-- ������ ���� �÷��� ������ ����� '��', '��' ������ ����
CREATE TABLE MEMBER_CHECK(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��', '��')),
    PHONE CHAR(13),
    EMAIL VARCHAR2(50),
    JOIN_DATE DATE,
    
    UNIQUE(MEM_ID)
   -- ,CHECK(GENDER IN('��', '��'))
);
SELECT * FROM MEMBER_CHECK;

INSERT INTO MEMBER_CHECK
    VALUES (1, 'HONG', '1234', 'ȫ�浿', '��', NULL, NULL, SYSDATE);
 
INSERT INTO MEMBER_CHECK
    VALUES (2, 'WAN00', '1234', '���', 'QQQ', NULL, NULL, NULL);
    -- ����(GENDER) �÷��� üũ �������ǿ� �����
    
INSERT INTO MEMBER_CHECK
    VALUES (2, 'WAN00', '1234', '���', 'QQQ', '��', NULL, NULL);
    -- üũ���ǿ� �´� ���� ���� ����!
    
INSERT INTO MEMBER_CHECK
    VALUES (3, 'SEOEUN02', '1234', '�ּ���', NULL, NULL, NULL, SYSDATE);
    --���� �÷��� NULL���� ��������
    --NULL���� ���� ���ٴ� ���̱� ������ ������ ����!
    -- => NULL���� ������� �ʰ��� �Ѵٸ� NOT NULL ���������� �߰��ؾ� ��!
    ------------------------------------------------------
    
/*
    PRIMARY KEY (�⺻Ű)
    : ���̺��� �� ���� �ĺ��ϱ� ���� ���Ǵ� �÷��� �ο��ϴ� ��������
    
    EX) ȸ����ȣ, �й�, ��ǰ�ڵ�, �ֹ���ȣ, �����ȣ, ����, ...
    
    PRIMARY KEY => NOT NULL + UNIQUE
    
    * ������ �� : ���̺� �� ���� �� ���� ���� ����!
    

*/

CREATE TABLE MEMBER_PRI(
    MEM_NO NUMBER CONSTRAINT MEMNO_PK PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��', '��')),
    PHONE CHAR(13),
    EMAIL VARCHAR2(50),
    JOIN_DATE DATE,
    
    UNIQUE(MEM_ID)
);


INSERT INTO MEMBER_PRI
    VALUES (1, 'JY999', '1234', '���翵', '��', NULL, NULL, SYSDATE);
    
INSERT INTO MEMBER_PRI
    VALUES (1, 'YS1234', '1234', '�̿��', '��', NULL, NULL, SYSDATE);    
-->�⺻Ű(MEM_NO)�� �ߺ��� ���� �����Ϸ��� �Ҷ� �������� �����! => UNIQUE �������� ����

INSERT INTO MEMBER_PRI
    VALUES (NULL, 'EY77', '1234', '������', '��', NULL, NULL, SYSDATE);
--> �⺻Ű (MEM_NO)�� NULL ���� �����Ϸ��� �� �� �������� �����! => NOT NULL �������� ����)

INSERT INTO MEMBER_PRI
    VALUES (2, 'YS333', '1234', '�̿��', '��', NULL, NULL, SYSDATE); 
    
INSERT INTO MEMBER_PRI
    VALUES (3, 'EY77', '1234', '������', '��', NULL, NULL, SYSDATE);
    
    
SELECT * FROM MEMBER_PRI;

-----------------------------------------------------------------------
-- ȸ����ȣ (MEM_NO), ȸ�� ���̵�(MEM_ID) �� �⺻Ű�� ������ ���̺� ����
CREATE TABLE MEMBER_PRI2(
    MEM_NO NUMBER,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��', '��')),
    PHONE CHAR(13),
    EMAIL VARCHAR2(50),
    JOIN_DATE DATE,
    
    UNIQUE(MEM_ID),
    CONSTRAINT MEMPRI2_PK PRIMARY KEY(MEM_NO, MEM_ID)
);
-- ����Ű : �ΰ��� �÷��� ���ÿ� �ϳ��� �⺻Ű�� �����ϴ� ��
INSERT INTO MEMBER_PRI2 VALUES (1, 'JG555', '1234', '������', '��', NULL, NULL, SYSDATE);

INSERT INTO MEMBER_PRI2 VALUES (1, 'HY666', '1234', '������', '��', NULL, NULL, SYSDATE);
--ȸ����ȣ(MEM_NO)�� �����ϳ� ȸ�����̵�(MEM_ID) ���� �ٸ��� ������ �߰��� ��!!

SELECT * FROM MEMBER_PRI2;

--� ȸ���� ��ǰ�� ��ٱ��Ͽ� ��� ������ �����ϴ� ���̺�
CREATE TABLE MEMBER_LIKE(
    MEM_NO NUMBER,
    PRODUCT_NAME VARCHAR2(50),
    LIKE_DATE DATE,
    
    PRIMARY KEY(MEM_NO, PRODUCT_NAME)
);

INSERT INTO MEMBER_LIKE
    VALUES(1, '����', '24/07/24');
    
INSERT INTO MEMBER_LIKE
    VALUES(1, '�Ƹ޸�ī��', '24/07/25');
    
INSERT INTO MEMBER_LIKE
    VALUES(2, '����� ���', '24/07/14');
    
INSERT INTO MEMBER_LIKE
    VALUES(2, '����� ��', '24/07/15');

INSERT INTO MEMBER_LIKE
    VALUES(2, '�Ƹ޸�ī��', '24/07/25');

INSERT INTO MEMBER_LIKE
    VALUES(3, '�����', '24/07/25');
    
/*
    FOREIGN KEY (�ܷ�Ű)
    : �ٸ� ���̺� �����ϴ� ���� �����ϰ��� �� �� ���Ǵ� ��������
        -> �ٸ� ���̺��� �����Ѵٰ� ǥ�� 
        -> �ַ� �ܷ�Ű�� ���� ���̺� ���� ���谡 ����
        
        -�÷��������
        �÷��� �ڷ��� REFERRENCES ���������̺��[(������ �÷���)]
        
        -���̺������
        FOREIGN KEY (�÷���) REFERENCES ���������̺��[(������ �÷���)]
        
        => ������ �÷����� ������ ��� �����ϴ� ���̺��� �⺻Ű �÷��� ��Ī��!
*/
--������̺� ����
DROP TABLE MEMBER;

--ȸ�� ��� ������ ������ ���̺�
CREATE TABLE MEMBER_GRADE (
    GRADE_NO NUMBER PRIMARY KEY,
    GRADE_NAME VARCHAR2(20) NOT NULL
);

INSERT INTO MEMBER_GRADE VALUES (100, '�Ϲ�ȸ��');
INSERT INTO MEMBER_GRADE VALUES (200, 'VIPȸ��');
INSERT INTO MEMBER_GRADE VALUES (300, 'VVIPȸ��');

CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN('��', '��')),
    JOIN_DATE DATE,
    MEM_GRADEID NUMBER REFERENCES MEMBER_GRADE(GRADE_NO) --�÷��������
    
   -- ,FOREIGN KEY(MEM_GRADEID) REFERENCES MEMBER_GRADE(GRADE_NO) --���̺������
);

INSERT INTO MEMBER
    VALUES (1, 'WHDRNS456', '0780', '������', '��', SYSDATE, 100);

INSERT INTO MEMBER
    VALUES (2, 'JGW0928', '1234', '���ǿ�', '��', SYSDATE, 200);

INSERT INTO MEMBER
    VALUES (3, 'HH00', 'QWER', '����ȣ', '��', SYSDATE, NULL);
    --�ܷ�Ű�� ������ �÷����� �⺻������ NULL���� ���尡��!

INSERT INTO MEMBER
    VALUES (4, 'JW33', '0987', '���ֿ�', '��', SYSDATE, 400);
    -- �����߻�! "�θ�Ű�� ã�� �� ����" --> ȸ����� ���̺� ������� ���� ���� ���!
    -- MEMBER_GRADE (�θ����̺�) -|--------<- ��MEMBER(�ڽ����̺�)
    --     1:N ����(�θ����̺� - MEMBER_GRADE), N(�ڽ����̺�: MEMBER)
INSERT INTO MEMBER
    VALUES (4, 'JW33', '0987', '���ֿ�', '��', SYSDATE, 100);
    
SELECT * FROM MEMBER;
SELECT * FROM MEMBER_GRADE;

--> �θ����̺�(MEMBER_GRADE) ���� �����͸� �ϳ� �����غ��ٸ� ..?
--������ ���� : DELETE FROM ���̺�� WHERE ����;

--MEMBER_GRADE ���̺��� 100���� �ش��ϴ� ��� ������ ����
DELETE FROM MEMBER_GRADE
WHERE GRADE_NO = 100;
--> �ڽ����̺�(MEMBER) ���� 100 �̶�� ���� ����ϰ� �ֱ� ������ ���� �Ұ�!

DELETE FROM MEMBER_GRADE
WHERE GRADE_NO = 300;
--�ڽ����̺� (MEMBER) ���� 300�̶�� ���� ������� �ʾұ� ������ ���� ����!

-- �ڽ����̺��� �̹� ����ϰ� �ִ� ���� ���� ���
--  �θ����̺�κ��� ������ ������ ���� �ʴ�"�����ɼ�"�� ����!

ROLLBACK;   -- ������ ��������� ������� �������°�
-------------------------------------------------------------------
/*
    �ܷ�Ű �������� ���� �ɼ�
    :�θ����̺��� ������ ������ �ش� ��Ƽ� ����ϰ� �ִ� �ڽ����̺��� ����
        ��� �� �������� ���� �ɼ�
        
        
    -(�⺻��) ON DELETE RESTRICTED : �ڽĵ����ͷκ��� ������� ���� ������
                                    �θ����̺��� ���� �Ұ�
    - ON DELETE SET NULL : �θ����̺� �ִ� ������ ���� �� �ش� �����͸� 
                            ������� �ڽ����̺��� ���� NULL�� ����
                            
    - ON DELETE CASCADE : �θ����̺� �ִ� ������ ���� �� �ش� �����͸� ��� ����
                            �ڽ����̺��� ���� ����
*/
--MEMBER ���̺� ����
DROP TABLE MEMBER;

CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN('��', '��')),
    JOIN_DATE DATE,
    MEM_GRADEID NUMBER REFERENCES MEMBER_GRADE(GRADE_NO) ON DELETE SET NULL
);
INSERT INTO MEMBER
    VALUES (1, 'WHDRNS456', '0780', '������', '��', SYSDATE, 100);

INSERT INTO MEMBER
    VALUES (2, 'JGW0928', '1234', '���ǿ�', '��', SYSDATE, 200);

INSERT INTO MEMBER
    VALUES (3, 'HH00', 'QWER', '����ȣ', '��', SYSDATE, NULL);
    
SELECT * FROM MEMBER;

--100�� ��޿� ���� ������ ���� (MEMBER_GRADE)
DELETE FROM MEMBER_GRADE
WHERE GRADE_NO = 100;
--�ڽ����̺� (MEMBER)���� 100�� ����� ���� �����Ͱ� NULL�� ����Ǹ�
-- �θ����̺�(MEMBER_GRADE)������ �����Ͱ� �� ������!

ROLLBACK;

DROP TABLE MEMBER;

CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN('��', '��')),
    JOIN_DATE DATE,
    MEM_GRADEID NUMBER REFERENCES MEMBER_GRADE(GRADE_NO)ON DELETE CASCADE
);
INSERT INTO MEMBER
    VALUES (1, 'WHDRNS456', '0780', '������', '��', SYSDATE, 100);

INSERT INTO MEMBER
    VALUES (2, 'JGW0928', '1234', '���ǿ�', '��', SYSDATE, 200);

INSERT INTO MEMBER
    VALUES (3, 'HH00', 'QWER', '����ȣ', '��', SYSDATE, NULL);
    
DELETE FROM MEMBER_GRADE
WHERE GRADE_NO = 100;   
    
    
SELECT * FROM MEMBER;
--> �ڽ����̺��� 100���� ���� �� (������) ��ü�� ���� �Ǿ���!

/*
    DEFAULT
    : ���������� �ƴ�..
     �÷��� �������� �ʰ� ������ �߰� �� NULL���� �ƴ� �⺻���� ���� �����ϰ��� �� ��
*/
DROP TABLE MEMBER;

CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,-- ȸ����ȣ
    MEM_NAME VARCHAR2(20) NOT NULL,-- ȸ���̸�
    AGE NUMBER,-- ����
    HOBBY VARCHAR2(20)DEFAULT '����',-- ���
    JOIN_DATE DATE DEFAULT SYSDATE-- ������  
);

INSERT INTO MEMBER VALUES (1, '¯��', 5, '��������', '24/07/01');
INSERT INTO MEMBER VALUES (2, '�ͱ�', 5, '���ϱ�..', NULL);
INSERT INTO MEMBER VALUES (3, '����', 5, NULL, NULL);

SELECT * FROM MEMBER;

INSERT INTO MEMBER(MEM_NO, MEM_NAME) VALUES (4, '����');
--�������� ���� �÷��� ���� ���� �⺻������ NULL���� �����.
--��, �ش� �÷��� �⺻���� �����Ǿ� ������ NULL�� �ƴ� �⺻������ �����.
---------------------------------------------
-- ���̺� �����ϱ�
CREATE TABLE MEMBER_COPY
AS (SELECT * FROM MEMBER);

-------------------------------------------------
/*
    * ALTER TABLE : ���̺� ��������� �����ϰ��� �� �� ���
    
    ALTER TABLE ���̺�� ������ ����
    
    -NOT NULL : ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL;
    
    - UNIQUE : ALTER TABLE ���̺�� ADD UNIQUE(�÷���);
    - CHECK : ALTER TABLE ���̺�� ADD CHECK(�÷��� ���� ���ǽ�);
    - PRIMARY KEY : ALTER TABLE ���̺�� ADD PRIMARY KEY(�÷���);
    - FOREIGN KEY : ALTER TABLE ���̺�� ADD FOREIGN KEY(�÷���) REFERENCES ������ ���̺��[(�������÷���)];
    
    
    -DEFAULT �ɼ� : ALTER TABLE ���̺�� MODIFY �÷��� DEFAULT �⺻��;
*/
--MEMBER_COPY ���̺��� ȸ����ȣ (MEM_NO) �÷��� �⺻Ű ����
ALTER TABLE MEMBER_COPY ADD PRIMARY KEY(MEM_NO);

--EMPLOYEE ���̺��� �μ��ڵ�(DEPT_CODE) �÷��� �ܷ�Ű ���� -> DEPARTMENT���̺��� DEPT_ID(�⺻Ű)
ALTER TABLE EMPLOYEE ADD FOREIGN KEY(DEPT_CODE)REFERENCES DEPARTMENT;
--EMPLOYEE ���̺��� �����ڵ�(JOB_CODE) �÷��� �ܷ�Ű ���� -> JOB���̺��� JOB_CODE(�⺻Ű)
ALTER TABLE EMPLOYEE ADD FOREIGN KEY (JOB_CODE)REFERENCES JOB;








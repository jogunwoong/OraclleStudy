/*
    * �Լ� (FUNCTION)
      : ���޵� �÷����� �о �Լ��� ������ ����� ��ȯ
      
      - ������ �Լ� : N���� ���� �о N���� ������� ���� (�ึ�� �Լ��� ������ ����� ��ȯ)
      - �׷� �Լ�   : N���� ���� �о 1���� ������� ���� (�׷��� ���� �׷캰�� �Լ��� ������ ����� ��ȯ)
      
      + SELECT���� ������ �Լ��� �׷��Լ��� �Բ� ����� �� ����!
        => ��� ���� ������ �ٸ��� ������
    
      + �Լ����� ����� �� �ִ� ��ġ : SELECT��, WHERE��, ORDER BY��, GROUP BY��, HAVING��
*/
--====================== ������ �Լ� ============================================
/*
    * ����Ÿ���� ������ ó�� �Լ�
      => VARCHAR2(n), CHAR(n)
      
    * LENGTH(�÷��� | '���ڿ�') : �ش� ���ڿ��� ���ڼ��� ��ȯ
      LENGTHB(�÷��� | '���ڿ�') : �ش� ���ڿ��� ����Ʈ���� ��ȯ
      
      => ������, ����, Ư������ ���ڴ� 1byte
         �ѱ��� ���ڴ� 3byte '��', '��', '��', '��'
*/
-- '����Ŭ' �ܾ��� ���ڼ��� ����Ʈ���� Ȯ���غ���. -> |   3    |   9   |
SELECT LENGTH('����Ŭ') ���ڼ�, LENGTHB('����Ŭ') ����Ʈ��
FROM DUAL;

-- 'ORACLE' �ܾ��� ���ڼ��� ����Ʈ��             -> |    6    |    6     |
SELECT LENGTH('ORACLE') ���ڼ�, LENGTHB('ORACLE') ����Ʈ��
FROM DUAL;

-- EMPLOYEE ���̺��� �����, �����(���ڼ�), �����(����Ʈ��)
--                      �̸���, �̸���(���ڼ�), �̸���(����Ʈ��)
SELECT EMP_NAME �����, LENGTH(EMP_NAME) ���ڼ�, LENGTHB(EMP_NAME) ����Ʈ��
        , EMAIL �̸���, LENGTH(EMAIL) ���ڼ�, LENGTHB(EMAIL) ����Ʈ��
FROM EMPLOYEE;
---------------------------------------------------------------------------
/*
    * INSTR : ���ڿ��κ��� Ư�� ������ ������ġ�� ��ȯ
    
    [ǥ����]
            INSTR(�÷� | '���ڿ�', 'ã�����ϴ� ����'[, ã�� ��ġ�� ���۰�, ����])
            => �Լ� ���� ����� ����Ÿ��(NUMBER)
*/
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;    -- ���ʿ� �ִ� ù��° B�� ��ġ : 3
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL; -- ã�� ��ġ�� ���۰� : 1(�⺻��)
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- �������� ���۰����� �����ϸ� �ڿ������� ã�´�. 
                                                 -- �ٸ�, ��ġ�� ���� ���� �տ������� �о ����� ��ȯ
                                                 -- ���ʿ� �ִ� ù��° B�� ��ġ : 10
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; -- ������ ������ ���� ���۰��� �����ؾ� ��!
                                                   -- ���ʿ� �ִ� �ι�° B�� ��ġ : 9
                                                   
-- ��� ���� �� �̸��Ͽ� _�� ù��° ��ġ, @�� ��ġ�� ��ȸ (�̸���, _ ��ġ, @ ��ġ)
SELECT EMAIL, INSTR(EMAIL, '_', 1, 1) "_ ��ġ", INSTR(EMAIL, '@') "@ ��ġ"
FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    * SUBSTR : ���ڿ����� Ư�� ���ڿ��� �����ؼ� ��ȯ
    
    [ǥ����]
            SUBSTR(���ڿ�|�÷�, ������ġ[, ����(����]))
            => 3��° ���� �κ��� �����ϸ� ���ڿ� ������ ����!
*/
SELECT SUBSTR('ORACLE SQL DEVELOPER', 10) FROM DUAL;    -- 10��° ��ġ���� ������ ����
SELECT SUBSTR('ORACLE SQL DEVELOPER', 8, 3) FROM DUAL;  -- 8��° ��ġ���� 3���ڸ� ���� => SQL
SELECT SUBSTR('ORACLE SQL DEVELOPER', -3) FROM DUAL;    -- �ڿ������� 3��° ��ġ���� ������ ���� => PER
SELECT SUBSTR('ORACLE SQL DEVELOPER', -9, 3) FROM DUAL; -- �ڿ������� 9��° ��ġ���� 3���ڸ� ���� => DEV

SELECT EMP_NAME, EMP_NO FROM EMPLOYEE;

-- ����� �� ������鸸 ��ȸ (�̸�, �ֹι�ȣ)
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4';
WHERE SUBSTR(EMP_NO, 8, 1) IN ('2', '4');

-- ����� �� ������鸸 ��ȸ (�̸�, �ֹι�ȣ)
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8, 1) = '1' OR SUBSTR(EMP_NO, 8, 1) = '3';
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1', '3')
ORDER BY EMP_NAME;  -- ����̸� ���� ������ ������ ���� (��������)

-- * �Լ� ��ø�ؼ� ��� ����
-- ��� ���� �� �����, �̸���, ���̵�(�̸��Ͽ��� @ �ձ����� ��) ��ȸ
-- [1] �̸��Ͽ��� '@'�� ��ġ�� ã�� => INSTR �Լ� ���
-- [2] �̸��� �÷��� ������ 1��° ��ġ���� '@'��ġ(1���� Ȯ��) ������ ����
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) "���̵�" 
FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    * LPAD / RPAD : ���ڿ��� ��ȸ�� �� ���ϰ��ְ� ��ȸ�ϰ��� �� �� ���
                    ���ڿ��� �����̰����ϴ� ���ڸ� ���� �Ǵ� �����ʿ� �ٿ��� ���� ���̸�ŭ ���ڿ� ��ȯ
                    
    [ǥ����]
            LPAD(���ڿ�|�÷�, ��������[, �����Ϲ���])
            RPAD(���ڿ�|�÷�, ��������[, �����Ϲ���])
            * �����Ϲ��� ���� �� �⺻������ �������� ä����
*/
-- ��� ���� �� ������� ������ �������� ä���� �� 20���̷� ��ȸ
SELECT EMP_NAME, LPAD(EMP_NAME, 20) "�̸�2"
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMP_NAME, 20) "�̸�2"
FROM EMPLOYEE;

-- ��� ���� �̸�, �̸��� ����������(�� ����:20)�Ͽ� ��ȸ
SELECT EMP_NAME, LPAD(EMAIL, 20) �̸���
FROM EMPLOYEE;

-- ��� ���� �̸�, �̸��� ��������(�� ����:20)�Ͽ� ��ȸ
SELECT EMP_NAME, RPAD(EMAIL, 20) �̸���
FROM EMPLOYEE;

SELECT EMP_NAME, LPAD(EMAIL, 20, '#') �̸���
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMAIL, 20, '#') �̸���
FROM EMPLOYEE;

SELECT RPAD('000202-1', 14, '*') FROM DUAL;

-- ������� �����, �ֹι�ȣ ��ȸ ('xxxxxx-x******' �������� ��ȸ)
--  * �ֹι�ȣ => 'xxxxxx-x' �������� ���� ��ȸ �� .. �������� *�� ä���..
-- SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 1, 8) || '******' "�ֹι�ȣ"
SELECT EMP_NAME, EMP_NO, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') "�ֹι�ȣ"
FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    * LTRIM / RTRIM : ���ڿ����� Ư�� ���ڸ� ������ �� �������� ��ȯ
    
    [ǥ����]
            LTRIM(���ڿ�|�÷�[, �����ϰ����ϴ¹��ڵ�])
            RTRIM(���ڿ�|�÷�[, �����ϰ����ϴ¹��ڵ�])
            * ������ ���ڸ� ������ �� ������ ���ŵ�!
*/
SELECT LTRIM('     H I') FROM DUAL; -- ���ʺ���(�տ�������) �ٸ����ڰ� ���� ������ ���� ����
SELECT RTRIM('H I     ') FROM DUAL; -- �����ʿ� �ִ� ������� ���� (I�� ������)

SELECT LTRIM('123123HI123', '123') FROM DUAL;
SELECT LTRIM('321321HI123', '123') FROM DUAL;

SELECT LTRIM('KKHHII', '123') FROM DUAL;

/*
    * TRIM : ���ڿ� ��/��/���ʿ� �ִ� ������ ���ڵ��� ������ �� ������ ���� ��ȯ
    
    [ǥ����]
            TRIM([LEADING | TRAILING | BOTH] [������ ���� FROM] ���ڿ�|�÷�)
            * ������ ���� ���� �� ���� ����
            * �⺻ �ɼ��� BOTH (����)
*/
SELECT TRIM('   H I   ') "��" FROM DUAL;
SELECT TRIM('L' FROM 'LLLLLHLILLLLL') "��" FROM DUAL;

SELECT TRIM(LEADING 'L' FROM 'LLLLLHLILLLLL') "��" FROM DUAL;    -- LTRIM�� ������! (���ʿ��� ����)
SELECT TRIM(TRAILING 'L' FROM 'LLLLLHLILLLLL') "��" FROM DUAL;   -- RTRIM�� ������! (�����ʿ��� ����)
SELECT TRIM(BOTH 'L' FROM 'LLLLLHLILLLLL') "��" FROM DUAL;       -- ���ʿ��� ������ ���ڸ� ����
--------------------------------------------------------------------------------
/*
    * LOWER / UPPER / INITCAP
    
        - LOWER : ���ڿ��� ��� �ҹ��ڷ� �����Ͽ� ���ڿ��� ��ȯ
        - UPPER : ���ڿ��� ��� �빮�ڷ� �����Ͽ� ���ڿ��� ��ȯ
        - INITCAP : ���� �������� ù ���ڸ��� �빮�ڷ� �����Ͽ� ���ڿ��� ��ȯ
*/
-- 'I think so i am'
SELECT LOWER('I think so i am') FROM DUAL;

SELECT UPPER('I think so i am') FROM DUAL;

SELECT INITCAP('I think so i am') FROM DUAL;
--------------------------------------------------------------------------------
/*
    * CONCAT : ���ڿ� �� ���� ���޹޾� �ϳ��� ��ģ �� ���ڿ� ��ȯ
    
    [ǥ����]
            CONCAT(���ڿ�1, ���ڿ�2)
*/
-- 'KH' ' L������' ���� �ΰ��� �ϳ��� ���ļ� ��ȸ
SELECT CONCAT('KH', ' L������') FROM DUAL;
SELECT 'KH' || ' L������' FROM DUAL;

SELECT '�ٿ��' || 30 FROM DUAL;

SELECT EMP_NAME || '��' FROM EMPLOYEE;
SELECT CONCAT(EMP_NAME, '��') FROM EMPLOYEE;
-- ��� ��ȣ�� {�����}�� �� �ϳ��� ���ڿ��� ��ȸ => "200�����ϴ�"
SELECT CONCAT(EMP_ID, CONCAT(EMP_NAME, '��')) ������� FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    * REPLACE : Ư�� ���ڿ����� Ư�� �κ��� �ٸ� �κ����� ��ü�Ͽ� ���ڿ� ��ȯ
    
    [ǥ����]
            REPLACE(���ڿ�|�÷�, ã�����ڿ�, �����ҹ��ڿ�)
*/
SELECT REPLACE('����� ������ ���ﵿ', '���ﵿ', '�Ｚ��') FROM DUAL;

SELECT * FROM EMPLOYEE;

-- ��� ���̺��� �̸��� ���� �� 'or.kr' �κ��� 'kh.or.kr' ������ �����Ͽ� ��ȸ
SELECT EMAIL, REPLACE(EMAIL, '@or.kr', '@kh.or.kr') �̸���
FROM EMPLOYEE;

SELECT EMAIL, REPLACE(EMAIL, '@or.kr', '@gmail.com') �̸���
FROM EMPLOYEE;
--==============================================================================
/*
    [ ���� Ÿ���� ������ ó�� �Լ� ]
*/
/*
    * ABS : ������ ���밪�� �����ִ� �Լ�
*/
SELECT ABS(-10) "-10�� ���밪" FROM DUAL;

SELECT ABS(-7.7) "-7.7�� ���밪" FROM DUAL;
--------------------------------------------------------------------------------
/*
    * MOD : �� ���� ���� ������ ���� �����ִ� �Լ�
    
    MOD(����1, ����2) --> ����1 % ����2
*/
-- 10�� 3���� ���� �������� ���غ��ٸ�..?
SELECT MOD(10, 3) FROM DUAL;

SELECT MOD(10.9, 3) FROM DUAL;
--------------------------------------------------------------------------------
/*
    * ROUND : �ݿø��� ���� �����ִ� �Լ�
    
    ROUND(����[, ��ġ]) : ��ġ=> �Ҽ��� N��° �ڸ�
*/
SELECT ROUND(123.456) FROM DUAL;    -- ��� : 123
SELECT ROUND(123.456, 1) FROM DUAL; -- ��� : 123.5
SELECT ROUND(123.456, 2) FROM DUAL; -- ��� : 123.46

SELECT ROUND(123.456, -1) FROM DUAL; -- ��� : 120
SELECT ROUND(123.456, -2) FROM DUAL; -- ��� : 100
-- => ��ġ���� ����� ������ ���� �Ҽ��� �ڷ� ��ĭ�� �̵�, ������ ������ ���� �Ҽ��� ���ڸ��� �̵�
--------------------------------------------------------------------------------
/*
    * CEIL : �ø�ó���� ���� �����ִ� �Լ�
    
    CEIL(����)
*/
SELECT CEIL(123.456) FROM DUAL; -- ��� : 124

/*
    * FLOOR : ����ó���� ���� �����ִ� �Լ�
    
    FLOOR(����)
*/
SELECT FLOOR(123.456) FROM DUAL; -- ��� : 123

/*
    * TRUNC : ����ó���� ���� �����ִ� �Լ�(��ġ ���� ����)
    
    TRUNC(����[, ��ġ])
*/
SELECT TRUNC(123.456) FROM DUAL;     -- ��� : 123
SELECT TRUNC(123.456, 1) FROM DUAL;  -- ��� : 123.4
SELECT TRUNC(123.456, -1) FROM DUAL; -- ��� : 120
--==============================================================================








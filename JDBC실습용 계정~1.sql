INSERT INTO MEMBER
VALUES (SEQ_USERNO.NEXTVAL, 'jgw0928', '1234', '���ǿ�', 0,'null', 'null', 'null', 'null', SYSDATE);
INSERT INTO MEMBER
VALUES (SEQ_USERNO.NEXTVAL, 'asd', '1234', '�ٺ�', 'M', 0,'null', 'null', 'null', 'null', SYSDATE);
SELECT * FROM MEMBER;

ROLLBACK;
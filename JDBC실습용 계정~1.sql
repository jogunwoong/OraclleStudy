INSERT INTO MEMBER
VALUES (SEQ_USERNO.NEXTVAL, 'jgw0928', '1234', 'Á¶°Ç¿õ', 0,'null', 'null', 'null', 'null', SYSDATE);
INSERT INTO MEMBER
VALUES (SEQ_USERNO.NEXTVAL, 'asd', '1234', '¹Ùº¸', 'M', 0,'null', 'null', 'null', 'null', SYSDATE);
SELECT * FROM MEMBER;

ROLLBACK;
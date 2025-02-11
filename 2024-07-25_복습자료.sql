CREATE TABLE STUDENT(
STUDENT_NO NUMBER,
STUDENT_NAME VARCHAR2(100)NOT NULL,
EMAIL VARCHAR2(100)UNIQUE,  --컬럼레벨방식
BIRTHDATE DATE NOT NULL
--, UNIQUE(EMAIL)           --테이블 레벨방식
);
COMMENT ON COLUMN STUDENT.STUDENT_NO IS '학생번호';
COMMENT ON COLUMN STUDENT.STUDENT_NAME IS '학생이름';
COMMENT ON COLUMN STUDENT.EMAIL IS '이메일';
COMMENT ON COLUMN STUDENT.BIRTHDATE IS '생년월일';

INSERT INTO STUDENT
    VALUES (1, '기다운', 'KIDAWUN@KH.OR.KR', '95/04/01');
INSERT INTO STUDENT
    VALUES (2, NULL, 'INCHANG@KH.OR.KR', NULL);
INSERT INTO STUDENT
    VALUES (3, '조건웅', 'KIDAWUN@KH.OR.KR', '99/09/28');

SELECT * FROM STUDENT;

DROP TABLE STUDENT;

CREATE TABLE BOOK(
BOOK_NO NUMBER,
BOOK_NAME VARCHAR2(100)NOT NULL,
WRITER VARCHAR2(100),
PUBLICATION_DATE DATE,
ISBN NUMBER UNIQUE
);

COMMENT ON COLUMN BOOK.BOOK_NO IS '도서번호';
COMMENT ON COLUMN BOOK.BOOK_NAME IS '제목';
COMMENT ON COLUMN BOOK.WRITER IS '저자';
COMMENT ON COLUMN BOOK.PUBLICATION_DATE IS '출판일';
COMMENT ON COLUMN BOOK.ISBN IS 'ISBN';

INSERT INTO BOOK
    VALUES (1, '어린왕자', '생텍쥐페리', '24/07/25', '9780394502946');
INSERT INTO BOOK
    VALUES (2, '어린왕자2', '생텍쥐페리', '34/07/25', '9780394502946');



DROP TABLE BOOK;

--저장 COMMIT;
--안 저장 ROLLBACK;
-- 1번문제
SELECT DEPARTMENT_NAME "학과명", CATEGORY "계열"
FROM TB_DEPARTMENT;

--2번문제
SELECT DEPARTMENT_NAME || '의 정원은' || CAPACITY || '명 입니다.' "학과별 정원"
FROM TB_DEPARTMENT;

--3번문제
SELECT STUDENT_NAME
FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE SUBSTR(STUDENT_SSN,8,1) = '2' AND ABSENCE_YN = 'Y' AND DEPARTMENT_NAME = '국어국문학과';
--4번문제
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NO DESC;

--5번문제
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY >=20 AND CAPACITY <=30;

--6번문제
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

--7번문제
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

--8번문제
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

--9번문제
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY CATEGORY;

--10번문제
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'N'
        AND ENTRANCE_DATE BETWEEN '02/01/01' AND '02/12/31'
        AND SUBSTR(STUDENT_ADDRESS, 1, 2) = '전주'
ORDER BY STUDENT_NAME;

--함수1번문제
SELECT STUDENT_NO"학번", STUDENT_NAME"이름", ENTRANCE_DATE"입학년도"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE;

--함수2번문제
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME) <> 3
ORDER BY PROFESSOR_NAME;

--함수3번문제
SELECT PROFESSOR_NAME "교수이름", 2008-(SUBSTR(PROFESSOR_SSN, 1, 2)+1900)"나이"
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN,8,1)=1
ORDER BY PROFESSOR_SSN DESC;

--함수4번문제
SELECT SUBSTR(PROFESSOR_NAME,2,2) "이름"
FROM TB_PROFESSOR;

--함수5번문제
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE (EXTRACT(YEAR FROM ENTRANCE_DATE))
    - (SUBSTR(STUDENT_SSN,1,2)+1900) = 20
ORDER BY STUDENT_NO DESC;

--함수6번문제
SELECT TO_CHAR(TO_DATE('2020/12/25'), 'DAY')
FROM DUAL;

--함수7번문제
SELECT TO_CHAR(TO_DATE('99/10/11'), 'YY/MM/DD')
FROM DUAL;
SELECT TO_CHAR(TO_DATE('49/10/11'), 'YY/MM/DD')
FROM DUAL;
SELECT TO_CHAR(TO_DATE('99/10/11'), 'RR/MM/DD')
FROM DUAL;
SELECT TO_CHAR(TO_DATE('49/10/11'), 'RR/MM/DD')
FROM DUAL;

--함수8번문제
SELECT STUDENT_NO,STUDENT_NAME
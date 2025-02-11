SELECT TO_CHAR(TO_DATE('99/10/11'), 'YYYY"년" FMMM"월" DD"일"')
FROM DUAL;

SELECT CEIL(SYSDATE - TO_DATE(990928))
FROM DUAL;

SELECT CONCAT(UPPER(SUBSTR('bElIVe iN YoURseLF.', 1, 1)), LOWER(SUBSTR('bElIVe iN YoURseLF.', 2)))
FROM DUAL;

SELECT LPAD(SUBSTR(EMP_NO, 3, 2) || '월', 8) "생월",
        LPAD(EXTRACT(MONTH FROM HIRE_DATE) || '월', 8) AS "입사월",
         COUNT(*) || '명' "입사 사원수"
FROM EMPLOYEE
WHERE TO_NUMBER(SUBSTR(EMP_NO, 3, 2)) >= 7 --생일이 7월 이후인 사원들 조건
GROUP BY SUBSTR(EMP_NO, 3, 2), EXTRACT(MONTH FROM HIRE_DATE)
ORDER BY 생월, 2;

SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_CODE
FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
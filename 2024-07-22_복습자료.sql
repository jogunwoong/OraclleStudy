SELECT *
FROM EMPLOYEE;

SELECT EMP_NAME "사원명", SALARY "급여", BONUS "보너스", JOB_CODE "직급코드"
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '__m%';

SELECT COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN (2, 4);

SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE ENT_YN = 'N';

SELECT COUNT(*)
FROM EMPLOYEE
WHERE EXTRACT(MONTH FROM HIRE_DATE) = 9;

SELECT EMP_NAME "사원명", EMP_NO "주민등록번호", JOB_CODE "직급코드", DEPT_CODE"부서코드", SALARY "급여", BONUS "보너스",EMAIL
FROM EMPLOYEE
WHERE (JOB_CODE = 'J6' OR JOB_CODE = 'J7') AND SALARY >= 2000000 AND BONUS IS NOT NULL
        AND SUBSTR(EMP_NO, 8, 1) IN (2, 4) AND EMAIL LIKE '___#_%' ESCAPE '#';
        
        /*
        1) 직급코드에 대한 조건이 우선순위로 인해 제대로 실행되지 않음
            => 괄호로 묶어주거나 IN 연산자로 대체해야 함
        2)  작성된 조건은 SALARY 값이 200만원 초과 (>) 로 작성되어 있음
            => 200만원 이상인 조건은 등호를 추가해줘야함(>=)
        3) 이메일의 4번째자리에 언더바를 값으로서 조건을 주고자 한다면 ESCAPE를 사용하여 나만의 
            와일드카드로 구분해줘야 함
        4) 보너스가 있는 사원을 조회해야 하는데 없는 사원을 조회하고 있음
            => BONUS IS NULL --> BONUS IS NOT NULL로 변경해줘야 함
        5) 여자사원 조건이 누락됨
            =>여자사원 조건을 추가해줘야 함 SUBSTR(EMP_NO, 8, 1) IN ( 2, 4)
        
        */


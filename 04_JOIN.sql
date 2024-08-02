/*
    JOIN
    : 두개 이상의 테이블에서 데이터를 조회하고자 할 때 사용되는 구문
      조회 결과는 하나의 결과물(RESULT SET) 로 나옴
      
      * 관계형 데이터베이스(RDB) 에서는 최소한의 데이터를 각각의 테이블에 저장
        중복저장을 최소화하기 위해 최대한 쪼개서 관리함
        
        => 관계형 데이터베이스에서 쿼리문을 이용한 테이블간의 "관계"를 맺는 방법
        (각 테이블간의 연결고리(외래키)를 통해서 데이터를 매칭시켜 조회!)
        
        JOIN은 크게 "오라클 전용 구문" 과 "ANSI 구문" (미국국립표준협회)
        
                오라클 전용구문              |             ANSI구문
                ------------------------------------------------
                등가 조인                   |             내부조인
              (EQUAL JOIN)                 |  (INNER JOIN --> JOIN USING/ON)
              ---------------------------------------------------
               포괄 조인                                
               (LEFT JOIN)                 |     왼쪽 외부 조인(LEFT OUTER JOIN)
              (RIGHT JOIN)                 |     오른쪽 외부 조인(RIGHT OUTER JOIN)
                                                 전체 외부 조인(FULL OUTER JOIN)
                -------------------------------------------------------    
                자체조인(SELF JOIN)         |       JOIN ON
                비등가 조인(NON EQUAL JOIN) |    
                ----------------------------------------------------
*/          
-- 전체 사원들의 사번, 사원명, 부서코드 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;

-- 부서코드, 부서명 조회 (부서 정보가 저장된 테이블 : DEPARTMENT)
SELECT DEPT_ID, DEPT_TITLE FROM DEPARTMENT;

--전체 사원들의 사번 사원명 직급코드
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE;

--직급코드, 직급명 조회 (직급정보 : JOB)
SELECT JOB_CODE, JOB_NAME
FROM JOB;

/*
    * 등가 조인(EQUAL JOIN) / 내부조인(INNER JOIN)
    => 연결시키는 컬럼의 값이 일치하는 행들만 조회 => 일지하지 않는 값은 조회시 제외
    
    --------------오라클 전용 구문
    
        *FROM절에 조회하고자 하는 테이블을 나열 (,로 구분)
        * WHERE 절에 매칠시킬 컬럼에 대한 조건을 작성
        
*/
--사원의 사번, 이름, 부서명을 조회( 부서코드 컬럼=> EMPLOYEE: DEPT_CODE, DEPARTMENT: DEPT_ID)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;

--=> NULL(EMPLOYEE, DEPT_CODE), 마케팅부(D3), 해외 영업3부(D7), 국내 영업부(D4) -> DEPARTMENT는 제외됨

--> 사원의 사번, 이름, 직급명을 조회(직급코드 컬럼=> EMPLOYEE, JOB_CODE, JOB JOB_CODE)
--> 두 테이블의 컬럼명이 동일할 경우 별칭을 지어줌으로써 구분할 수 있음!
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

-- ANSI 구문 --
/*
    FROM절에 기준이 되는 테이블을 하나 작성
    JOIN절에 조인하고자 하는 테이블을 기술 + 매칭시키고자 하는 조건을 작성
    - JOIN USING    : 컬럼명이 같은 경우
    - JOIN ON       : 컬럼명이 같거나 다른경우
*/
-- 사원, 사번, 부서명 조회 (EMPLOYEE: DEPT_CODE, DEPARTMENT: DEPT_ID)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
    JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID);

-- 사번, 사원명, 직급멸 조회(EMPLOYEE: JOB_CODE, JOB: JOB_CODE)
-- JOIN USING 구문사용
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE
    JOIN JOB USING (JOB_CODE);

--JOIN ON 구문 사용
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE E
    JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

-- 대리 직급인 사원의 사번, 사원명, 직급명, 급여 조회

--**오라클 구문 사용
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE AND JOB_NAME = '대리';

--**ANSI구문 사용
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
    JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리';

---------------------QUIZ--------------
-- [1] 부서가 인사관리부인 사원들의 사번, 사원명, 보너스 조회
--**오라클 구문**
SELECT EMP_ID, EMP_NAME, BONUS
FROM DEPARTMENT D,EMPLOYEE E
WHERE DEPT_CODE = DEPT_ID AND DEPT_TITLE = '인사관리부';

--**ANSI 구문**
SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE = '인사관리부';

--[2] 부서(DEPARTMENT)와 지역(LOCATION) 정보를 참고하여
                        --전체부서의 부서코드, 부서명, 지역코드, 지역명 조회

--** 오라클 구문**--
SELECT DEPT_ID, DEPT_TITLE, LOCAL_CODE, LOCATION_ID
FROM DEPARTMENT D, LOCATION L
WHERE LOCAL_CODE = LOCATION_ID;


--** ANSI 구문**--
SELECT DEPT_ID, DEPT_TITLE, LOCAL_CODE, LOCATION_ID
FROM DEPARTMENT
        JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

 --[3] 보너스를 받는 사원들의 사번, 사원명, 보너스, 부서명 조회
 
--** 오라클 구문**--
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND BONUS IS NOT NULL;


--** ANSI 구문**--    
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE
        JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE BONUS IS NOT NULL;
    
--[4] 부서가 총무부가 아닌 사원들의 사원명, 급여 조회

--** 오라클 구문**--
SELECT EMP_NAME, SALARY
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID = DEPT_CODE AND DEPT_TITLE != '총무부';


--** ANSI 구문**--
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
        JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE != '총무부';

-----------------------------------------------------
/*
    포괄조인 / 외부조인 (OUTER JOIN)
    : 두 테이블 간의 JOIN시 일치하지 않는 행도 포함하여 조회하는 구문
     단, 반드시 LEFT/RIGHT 를 지정해야 함 (기준이 되는 테이블)
*/
-- 모든사원명, 부서명, 급여, 연봉 정보를 조회
-- LEFT JOIN : 두 테이블 중 왼쪽에 작성된 테이블을 기준으로 조언

--**오라클 구문**

SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 연봉
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);

--**ANSI구문**
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 연봉
FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;
    
-- *RIGHT구문 : 두 테이블 중 오른쪽에 작성된 테이블 기준으로 조인
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 연봉
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID
ORDER BY EMP_NAME;

-- ** ANSI구문 **
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 연봉
FROM EMPLOYEE
    RIGHT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;
    
-- * FULL JOIN : 두 테이블이 가진 모든 행을 조회하는 조인구문 (오라클 전용구문X)
--** ANSI구문 **
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY*12 연봉
FROM EMPLOYEE
    FULL JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;




    
    
    
    
    
    
    
    
    
    



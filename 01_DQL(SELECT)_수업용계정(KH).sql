/*
    데이터 조회(추출) : SELECT
    
        SELECT 조회하고자 하는 정보 FROM 테이블명;
        SELECT * 또는 컬럼명1, 컬럼명2, .... FROM 테이블명;
        
*/
--모든 사원의 정보를 조회
SELECT * FROM EMPLOYEE;

--모든 사원의 이름, 주민번호, 핸드폰번호를 조회
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE;

-- JOB 테이블에서 직급이름만 조회
SELECT * FROM JOB;

SELECT JOB_NAME
FROM JOB;

-- DEPARTMENT 테이블의 모든 정보를 조회
SELECT * FROM DEPARTMENT;

-- 직원 테이블의 사원명, 이메일, 연락처, 입사일, 급여 조회
SELECT * FROM EMPLOYEE;

SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY 
FROM EMPLOYEE;

/*
    컬럼값에 산술 연산하기
    => SELECT열에 컬럼명 작성부분에 산술연산을 할 수 있음
*/
-- 사원이름, 연봉정보 조회

SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- 사원이름 급여, 보너스, 연봉, 보너스 포함 연봉(급여 + (급여 * 보너스)) * 12 정보를 조회

SELECT EMP_NAME, BONUS, SALARY * 12, (SALARY + (SALARY * BONUS)) *12 
FROM EMPLOYEE;

/*
    현재날짜 시간 정보 : SYSDATEE
    가상 테이블 (임시 테이블) : DUAL
*/
-- 현재 시간 정보 조회
SELECT SYSDATE FROM DUAL; --YY/DD/MM 형식으로 조회됨!

-- 사원이름, 입사일, 근무일수 조회
-- DATE타입 - DATE타입 - 일로표시됨!
SELECT EMP_NAME, HIRE_DATE, SYSDATE-HIRE_DATE
FROM EMPLOYEE;

/*
    * 컬럼명 별칭지정 : 연산식을 사용한 경우 의미파악이 어렵기 때문에, 별칭을 부여하여 명확하고 깔끔하게 조회가능!
    
    [표현법] 1) 컬럼명 별칭
            2) 컬럼명 AS 별칭
            3) 컬럼명 "별칭"
            4) 컬럼명 AS "별칭"
*/

-- 사원이름 급여, 보너스, 연봉, 보너스 포함 연봉(급여 + (급여 * 보너스)) * 12 정보를 조회

SELECT EMP_NAME 사원이름, SALARY 급여, BONUS 보너스, SALARY * 12 연봉, (SALARY + (SALARY * BONUS)) *12 "보너스 포함 연봉" 
FROM EMPLOYEE;

/*
    * 리터럴 : 임의로 지정한 문자열 ('')
    -> SELECT 절에 사용하는 경우 조회된결과(RESULT SET)에 반복적으로 표시됨
*/
--이름,급여,원 출력

SELECT EMP_NAME 이름, SALARY 급여, '원' 단위
FROM EMPLOYEE;

/*
    연결 연산자 : || 
*/
SELECT SALARY || '원' AS 급여
FROM EMPLOYEE;

--사번, 이름, 급여일을 한번에 조회
SELECT EMP_ID || EMP_NAME || SALARY 
FROM EMPLOYEE;

--XXX 의 급여는 XXXX원 입니다
SELECT EMP_NAME || '의 급여는' || SALARY || '입니다.' 급여정보
FROM EMPLOYEE;

-- 사원테이블에서 직급코드 조회
SELECT JOB_CODE
FROM EMPLOYEE;

/*
    + 중복제거 : DISTINCT 
*/
-- 사원테이블에서 직급코드 조회
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;


-- DISTINCT
-- DISTINCT하나 쓰면 한쌍으로 묶어서 중복제거
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMPLOYEE;

--=============================================

/*
    WHERE절 : 조회하고자 하는 데이터를 특정 조건에 따라 데이터를 추출하고자 할 떄 사용
            
            (표현법)
                    SELECT 컬럼명, 컬럼|데이터기준 연산식
                    FROM 테이블명;
                    WHERE 조건;
                    
    - 비교연산자
        * 대소비교 : >, <, >=, <=
        * 동등비교 : 
                - 같은지 : =
                - 다른지 : !=, <>, ^=     
*/
-- 사원테이블에서 부서코드가 'D9'인 사원들만 조회
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- 사원테이블에서 부서코드가 'D1'인 사원들의 사원명, 급여, 부서코드를 조회
SELECT DISTINCT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

--부서코드가 D1이 아닌 사원들의 정보 조회
SELECT DISTINCT EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE <> 'D1';

SELECT DISTINCT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY >= 4000000;

--========================================
-- 1. 급여가 300만원 이상인 사원들의 사원명, 급여, 입사일, 연봉조회 (별칭적용)

-- 2. 연봉이 5천만윈 이상인 사원들의 사원명, 급여, 연봉, 부서코드 조회(별칭적용)

-- 3. 직급코드 'J3' 가 아닌 사원들의 사번, 사원명, 직급코드, 퇴사여부 조회 (별칭적용)

-- 4. 급여가 350만원 이상 600만원 이하인 모든 사원의 사원명, 사번, 급여 조회
SELECT DISTINCT EMP_NAME 이름, SALARY 급여, HIRE_DATE 입사일, SALARY * 12 연봉
FROM EMPLOYEE
WHERE SALARY >= 3000000 ;

SELECT DISTINCT EMP_NAME 이름, SALARY 급여, SALARY * 12 연봉, DEPT_CODE 부서코드
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000 ;

SELECT DISTINCT EMP_ID 사번, EMP_NAME 사원명, JOB_CODE 직급코드, ENT_YN 퇴사여부
FROM EMPLOYEE
WHERE JOB_CODE <> 'J3' ;

SELECT DISTINCT EMP_NAME 사원명, SALARY 급여, EMP_ID 사번
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000 ;

-- 1. JOB 테이블의 모든 정보 조회
SELECT *FROM JOB;

-- 2. JOB 테이블의 직급 이름 조회
SELECT JOB_NAME
FROM job;

-- 3. DEPARTMENT 테이블의 모든 정보 조회
SELECT * FROM DEPARTMENT;

-- 4. EMPLOYEE테이블의 직원명, 이메일, 전화번호, 고용일 조회
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE
FROM EMPLOYEE;

-- 5. EMPLOYEE테이블의 고용일, 사원 이름, 월급 조회
SELECT HIRE_DATE, EMP_NAME, SALARY
FROM EMPLOYEE;

-- 6. EMPLOYEE테이블에서 이름, 연봉, 총수령액(보너스포함), 실수령액(총수령액 - (연봉*세금 3%)) 조회
SELECT EMP_NAME, SALARY * 12, (SALARY + (SALARY * BONUS)) *12,((SALARY + (SALARY * BONUS)) *12 - (SALARY * 12 * 0.03))
FROM employee;

-- 7. EMPLOYEE테이블에서 실수령액(6번 참고)이 5천만원 이상인 사원의 이름, 월급, 실수령액, 고용일 조회
SELECT HIRE_DATE, EMP_NAME, SALARY,((SALARY + (SALARY * BONUS)) *12 - (SALARY * 12 * 0.03)),HIRE_DATE
FROM EMPLOYEE
WHERE ((SALARY + (SALARY * BONUS)) *12 - (SALARY * 12 * 0.03)) >= 50000000;

-- 8. EMPLOYEE테이블에 월급이 4000000이상이고 JOB_CODE가 J2인 사원의 전체 내용 조회
SELECT * 
FROM EMPLOYEE
WHERE SALARY >= 4000000 AND JOB_CODE = 'J2';



-- 9. EMPLOYEE테이블에 DEPT_CODE가 D9이거나 D5인 사원 중 
--     고용일이 02년 1월 1일보다 빠른 사원의 이름, 부서코드, 고용일 조회
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE = 'D9' OR DEPT_CODE = 'D5') AND HIRE_DATE < '02/01/01';
--===============================================
/*
    *BETWEEN AND : 조건식에서 사용되는 구문
        => ~이상 ~~이하인 범위에 대한 조건을 제시하는 구문
        
        [표현법]
            비교대상 컬럼명 BETWEEN 최솟값 AND 최댓값
            =>해당 컬럼의 값이 최솟값 이상이고 최댓값 이하인 경우 조회
*/
--급여가 350만원 이상이고 600만윈 이하인 사원의 사원명,사번,급여 조회
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;

/*
    * NOT : 오라클 논리부정연산자 
*/
-- 급여가 350만원 미만 또는 600만원 초과인 사원의 사원명, 사번, 급여 조회
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY < 3500000 OR SALARY >6000000;

SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
-- NOT은 BETWEEN 앞에 붙이거나 컬럼명 앞에 붙여서 사용 가능!

/*
    * IN : 비교대상컬럼값이 제시한 값들 중에 일치하는 값이 있는 경우 조회하는 연산자
    
    [표현법]
        비교대상컬럼명 IN ('값','값','값', ...)
*/
-- 부서코드가 D6이거나 D8이거나 D5인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5';

SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D6','D8','D5');

SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D9') AND HIRE_DATE < '02/01/01';

--=================================================================
/*
    *LIKE : 비교하고자하는 컬러의 값이 제시한 특정 패텅에 만족할 경우 조회
    
        => 특정 패텅 : '%','_' 를 와일드카드로 사용
            '%' : 0글자 이상
            EX) 비교대상컬럼명 LIKE '문자%' => 비교대상  컬럼의 값에 문자로 "시작"되는 것을 조회
                비교대상 컬럼명 LIKE '%문자' => 비교대상 컬럼의 값이 문자로 "끝"나는 것을 조회
                => 비교대상 컬럼명 LIKE'%문자%' =>비교대상 컬럼의 값에 문자가 "포함"되는 것을 조회
            '_' : 1글자
            EX) 비교대상컬럼명 LIKE '_문자" => 비교대상컬럼의 값에서 문자 앞에 무조건 한글자가 올 경우 조회
                비교대상컬럼명 LIKE '__문자" => 비교대상컬럼의 값에서 문자 앞에 무조건 두글자가 올 경우 조회
                비교대상컬럼명 LIKE'_문자_' => 비교대상컬럼의 값에서 문자 앞,뒤에 무조건 한글자씩 올 경우 조회
*/
-- 사원들 중에 전씨인 사원의 사원명, 급여, 입사일 조회
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%';

-- 사원 이름에 하가 포함된 사원의 사원명, 주민번호, 연락처 조회
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';

-- 사원 이름의 가운데 글자가 하인 사원의 사원명, 연락처 조회
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_하_';

-- 사원들중 연락처의 3번째 자리가 1인 사원의 사번, 사원명, 연락처, 이메일 조회
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- 사원들 중 이메일에 4번째 자리가 _인 사원의 사번, 이름, 이메일 조회
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '%%%_%';
-- 와일드카드로 사용되는 문자와 컬럼에 담긴 문자가 동일하기 때문에 모두 와일드카드로 인사됨!
-- 따라서, 구분을 해줘야 함! => 나만의 와일드카드 사용하기! ESCAPE 를 사용하여 등록 후 적용

SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$' ;
--============================================
/*
    * IS NULL / IS NOT NULL : 컬럼값에 NULL이 있을경우 NULL값을 비교할 때 사용하는 연산자
*/
-- 보너스를 받지않는 사원들의 사번, 이름, 급여, 보너스조회
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- 사수가 없는사원(MANAGER_ID의 값이 NULL) 사원명, 사수사번, 부서코드 조회
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL;

-- 부서배치를 받지 않았고, 보너스를 받고있는 사원의 사원명, 보너스, 부서코드
SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
--====================================================
/*
    * 연산자 우선순위
        (0) ()
        (1) 산술연산자 : * / + -
        (2) 연결연산자 : ||
        (3) 비교연산자 : > < >= <= = !=
        (4) IS NULL/ LIKE '패턴' / IN
        (5) BETWEEN AND
        (6) NOT
        (7) AND
        (8) OR
*/
-- 직급코드가 J7 이거나 J2 인 사원들 중 급여가 200만원 이상인 사원의 모든 정보 조회
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE IN ('J2', 'J7') AND SALARY >= 2000000;
--================================================
/*
    * ORDER BY : SELECT 문 가장 마지막 줄에 작성, 실행 순서또한 마지막에 실행
    
    [표현법]
        SELECT 조회할 컬럼
        FROM 테이블 명
        WHERE 조건식
        ORDER BY 정렬 기준이 되는 컬럼|별칭|컬럼순번 
         오름차순:ASC
         내림차순:DESC
         NULLS FIRST : 널이 맨앞에(DESC 인 경우 기본값)
         NULLS LAST : 널이 맨뒤에(ASC 인 경우 기본값)                                        
*/
-- 모든 사원의 사원명, 연봉 조회 (연봉별 내림차순 정렬)
SELECT EMP_NAME, SALARY * 12 연봉
FROM EMPLOYEE
-- ORDER BY SALARY * 12 DESC;
-- ORDER BY 연봉 DESC;
ORDER BY 2 DESC; --컬럼 순번 사용( 오라클에서는 1부터 시작)

-- 보너스 기준으로 정렬
SELECT *
FROM EMPLOYEE
-- ORDER BY BONUS; -- 기본값 (ASC, NULLS LAST)
-- ORDER BY BONUS ASC; -- 기본값 (ULLS LAST)
-- ORDER BY BONUS ASC NULLS LAST;
-- ORDER BY BONUS DESC;  -- NULLS FIRST (DESC 정렬인 경우 기본값)
-- 보너스는 내림차순, 급여는 오름차순
-- =>보너스 값을 내림차순 정렬하는데, 같은 값인 경우 급여의 값을 오름차순으로 정렬 
ORDER BY BONUS DESC, SALARY ASC;

-- 1. EMPLOYEE 테이블에 고용일이 90/01/01 ~ 01/01/01인 사원의 전체 내용을 조회
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
-- 2. EMPLOYEE 테이블에서 이름 끝이 '연'으로 끝나는 사원의 이름 조회
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%연';

-- 3. EMPLOYEE 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호를 조회
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE NOT PHONE LIKE '010%';
-- 4. EMPLOYEE 테이블에서 메일주소 '_'의 앞이 4자이면서 DEPT_CODE가 D9 또는 D6이고 
--     고용일이 90/01/01 ~ 00/12/01이고, 급여가 270만 이상인 사원의 전체를 조회
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '____$_%' ESCAPE '$'AND DEPT_CODE IN ('D9','D6') AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01' AND SALARY >= 2700000;



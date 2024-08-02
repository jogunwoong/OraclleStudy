/*
    * 함수 (FUNCTION)
      : 전달된 컬럼값을 읽어서 함수를 실행한 결과를 반환
      
      - 단일행 함수 : N개의 값을 읽어서 N개의 결과값을 리턴 (행마다 함수를 실행한 결과를 반환)
      - 그룹 함수   : N개의 값을 읽어서 1개의 결과값을 리턴 (그룹을 지어 그룹별로 함수를 실행한 결과를 반환)
      
      + SELECT절에 단일행 함수랑 그룹함수를 함께 사용할 수 없음!
        => 결과 행의 개수가 다르기 때문에
    
      + 함수식을 사용할 수 있는 위치 : SELECT절, WHERE절, ORDER BY절, GROUP BY절, HAVING절
*/
--====================== 단일행 함수 ============================================
/*
    * 문자타입의 데이터 처리 함수
      => VARCHAR2(n), CHAR(n)
      
    * LENGTH(컬럼명 | '문자열') : 해당 문자열의 글자수를 반환
      LENGTHB(컬럼명 | '문자열') : 해당 문자열의 바이트수를 반환
      
      => 영문자, 숫자, 특수문자 글자당 1byte
         한글은 글자당 3byte '김', 'ㄱ', '나', '꽥'
*/
-- '오라클' 단어의 글자수와 바이트수를 확인해보자. -> |   3    |   9   |
SELECT LENGTH('오라클') 글자수, LENGTHB('오라클') 바이트수
FROM DUAL;

-- 'ORACLE' 단어의 글자수와 바이트수             -> |    6    |    6     |
SELECT LENGTH('ORACLE') 글자수, LENGTHB('ORACLE') 바이트수
FROM DUAL;

-- EMPLOYEE 테이블에서 사원명, 사원명(글자수), 사원명(바이트수)
--                      이메일, 이메일(글자수), 이메일(바이트수)
SELECT EMP_NAME 사원명, LENGTH(EMP_NAME) 글자수, LENGTHB(EMP_NAME) 바이트수
        , EMAIL 이메일, LENGTH(EMAIL) 글자수, LENGTHB(EMAIL) 바이트수
FROM EMPLOYEE;
---------------------------------------------------------------------------
/*
    * INSTR : 문자열로부터 특정 문자의 시작위치를 반환
    
    [표현법]
            INSTR(컬럼 | '문자열', '찾고자하는 문자'[, 찾을 위치의 시작값, 순번])
            => 함수 실행 결과는 숫자타입(NUMBER)
*/
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;    -- 앞쪽에 있는 첫번째 B의 위치 : 3
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL; -- 찾을 위치의 시작값 : 1(기본값)
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- 음수값을 시작값으로 제시하면 뒤에서부터 찾는다. 
                                                 -- 다만, 위치에 대한 값은 앞에서부터 읽어서 결과를 반환
                                                 -- 뒤쪽에 있는 첫번째 B의 위치 : 10
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; -- 순번을 제시할 때는 시작값을 제시해야 함!
                                                   -- 앞쪽에 있는 두번째 B의 위치 : 9
                                                   
-- 사원 정보 중 이메일에 _의 첫번째 위치, @의 위치를 조회 (이메일, _ 위치, @ 위치)
SELECT EMAIL, INSTR(EMAIL, '_', 1, 1) "_ 위치", INSTR(EMAIL, '@') "@ 위치"
FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    * SUBSTR : 문자열에서 특정 문자열을 추출해서 반환
    
    [표현법]
            SUBSTR(문자열|컬럼, 시작위치[, 길이(갯수]))
            => 3번째 길이 부분을 생략하면 문자열 끝까지 추출!
*/
SELECT SUBSTR('ORACLE SQL DEVELOPER', 10) FROM DUAL;    -- 10번째 위치부터 끝까지 추출
SELECT SUBSTR('ORACLE SQL DEVELOPER', 8, 3) FROM DUAL;  -- 8번째 위치부터 3글자만 추출 => SQL
SELECT SUBSTR('ORACLE SQL DEVELOPER', -3) FROM DUAL;    -- 뒤에서부터 3번째 위치부터 끝까지 추출 => PER
SELECT SUBSTR('ORACLE SQL DEVELOPER', -9, 3) FROM DUAL; -- 뒤에서부터 9번째 위치부터 3글자만 추출 => DEV

SELECT EMP_NAME, EMP_NO FROM EMPLOYEE;

-- 사원들 중 여사원들만 조회 (이름, 주민번호)
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4';
WHERE SUBSTR(EMP_NO, 8, 1) IN ('2', '4');

-- 사원들 중 남사원들만 조회 (이름, 주민번호)
SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8, 1) = '1' OR SUBSTR(EMP_NO, 8, 1) = '3';
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1', '3')
ORDER BY EMP_NAME;  -- 사원이름 기준 가나다 순으로 정렬 (오름차순)

-- * 함수 중첩해서 사용 가능
-- 사원 정보 중 사원명, 이메일, 아이디(이메일에서 @ 앞까지의 값) 조회
-- [1] 이메일에서 '@'의 위치를 찾고 => INSTR 함수 사용
-- [2] 이메일 컬럼의 값에서 1번째 위치부터 '@'위치(1에서 확인) 전까지 추출
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) "아이디" 
FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    * LPAD / RPAD : 문자열을 조회할 때 통일감있게 조회하고자 할 때 사용
                    문자열에 덧붙이고자하는 문자를 왼쪽 또는 오른쪽에 붙여서 최종 길이만큼 문자열 반환
                    
    [표현법]
            LPAD(문자열|컬럼, 최종길이[, 덧붙일문자])
            RPAD(문자열|컬럼, 최종길이[, 덧붙일문자])
            * 덧붙일문자 생략 시 기본값으로 공백으로 채워짐
*/
-- 사원 정보 중 사원명을 왼쪽을 공백으로 채워서 총 20길이로 조회
SELECT EMP_NAME, LPAD(EMP_NAME, 20) "이름2"
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMP_NAME, 20) "이름2"
FROM EMPLOYEE;

-- 사원 정보 이름, 이메일 오른쪽정렬(총 길이:20)하여 조회
SELECT EMP_NAME, LPAD(EMAIL, 20) 이메일
FROM EMPLOYEE;

-- 사원 정보 이름, 이메일 왼쪽정렬(총 길이:20)하여 조회
SELECT EMP_NAME, RPAD(EMAIL, 20) 이메일
FROM EMPLOYEE;

SELECT EMP_NAME, LPAD(EMAIL, 20, '#') 이메일
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMAIL, 20, '#') 이메일
FROM EMPLOYEE;

SELECT RPAD('000202-1', 14, '*') FROM DUAL;

-- 사원들의 사원명, 주민번호 조회 ('xxxxxx-x******' 형식으로 조회)
--  * 주민번호 => 'xxxxxx-x' 형식으로 먼저 조회 후 .. 나머지를 *로 채우기..
-- SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 1, 8) || '******' "주민번호"
SELECT EMP_NAME, EMP_NO, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*') "주민번호"
FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    * LTRIM / RTRIM : 문자열에서 특정 문자를 제거한 후 나머지를 반환
    
    [표현법]
            LTRIM(문자열|컬럼[, 제거하고자하는문자들])
            RTRIM(문자열|컬럼[, 제거하고자하는문자들])
            * 제거할 문자를 생략할 시 공백이 제거됨!
*/
SELECT LTRIM('     H I') FROM DUAL; -- 왼쪽부터(앞에서부터) 다른문자가 나올 때까지 공백 제거
SELECT RTRIM('H I     ') FROM DUAL; -- 오른쪽에 있는 공백들이 제거 (I값 전까지)

SELECT LTRIM('123123HI123', '123') FROM DUAL;
SELECT LTRIM('321321HI123', '123') FROM DUAL;

SELECT LTRIM('KKHHII', '123') FROM DUAL;

/*
    * TRIM : 문자열 앞/뒤/양쪽에 있는 지정한 문자들을 제거한 후 나머지 값을 반환
    
    [표현법]
            TRIM([LEADING | TRAILING | BOTH] [제거할 문자 FROM] 문자열|컬럼)
            * 제거할 문자 생략 시 공백 제거
            * 기본 옵션은 BOTH (양쪽)
*/
SELECT TRIM('   H I   ') "값" FROM DUAL;
SELECT TRIM('L' FROM 'LLLLLHLILLLLL') "값" FROM DUAL;

SELECT TRIM(LEADING 'L' FROM 'LLLLLHLILLLLL') "값" FROM DUAL;    -- LTRIM과 유사함! (왼쪽에서 제거)
SELECT TRIM(TRAILING 'L' FROM 'LLLLLHLILLLLL') "값" FROM DUAL;   -- RTRIM과 유사함! (오른쪽에서 제거)
SELECT TRIM(BOTH 'L' FROM 'LLLLLHLILLLLL') "값" FROM DUAL;       -- 양쪽에서 제시한 문자를 제거
--------------------------------------------------------------------------------
/*
    * LOWER / UPPER / INITCAP
    
        - LOWER : 문자열을 모두 소문자로 변경하여 문자열을 반환
        - UPPER : 문자열을 모두 대문자로 변경하여 문자열을 반환
        - INITCAP : 띄어쓰기 기준으로 첫 글자마다 대문자로 변경하여 문자열을 반환
*/
-- 'I think so i am'
SELECT LOWER('I think so i am') FROM DUAL;

SELECT UPPER('I think so i am') FROM DUAL;

SELECT INITCAP('I think so i am') FROM DUAL;
--------------------------------------------------------------------------------
/*
    * CONCAT : 문자열 두 개를 전달받아 하나로 합친 후 문자열 반환
    
    [표현법]
            CONCAT(문자열1, 문자열2)
*/
-- 'KH' ' L강의장' 문자 두개를 하나로 합쳐서 조회
SELECT CONCAT('KH', ' L강의장') FROM DUAL;
SELECT 'KH' || ' L강의장' FROM DUAL;

SELECT '다운님' || 30 FROM DUAL;

SELECT EMP_NAME || '님' FROM EMPLOYEE;
SELECT CONCAT(EMP_NAME, '님') FROM EMPLOYEE;
-- 사원 번호와 {사원명}님 을 하나의 문자열로 조회 => "200선동일님"
SELECT CONCAT(EMP_ID, CONCAT(EMP_NAME, '님')) 사원정보 FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    * REPLACE : 특정 문자열에서 특정 부분을 다른 부분으로 교체하여 문자열 반환
    
    [표현법]
            REPLACE(문자열|컬럼, 찾을문자열, 변경할문자열)
*/
SELECT REPLACE('서울시 강남구 역삼동', '역삼동', '삼성동') FROM DUAL;

SELECT * FROM EMPLOYEE;

-- 사원 테이블에서 이메일 정보 중 'or.kr' 부분을 'kh.or.kr' 값으로 변경하여 조회
SELECT EMAIL, REPLACE(EMAIL, '@or.kr', '@kh.or.kr') 이메일
FROM EMPLOYEE;

SELECT EMAIL, REPLACE(EMAIL, '@or.kr', '@gmail.com') 이메일
FROM EMPLOYEE;
--==============================================================================
/*
    [ 숫자 타입의 데이터 처리 함수 ]
*/
/*
    * ABS : 숫자의 절대값을 구해주는 함수
*/
SELECT ABS(-10) "-10의 절대값" FROM DUAL;

SELECT ABS(-7.7) "-7.7의 절대값" FROM DUAL;
--------------------------------------------------------------------------------
/*
    * MOD : 두 수를 나눈 나머지 값을 구해주는 함수
    
    MOD(숫자1, 숫자2) --> 숫자1 % 숫자2
*/
-- 10을 3으로 나눈 나머지를 구해본다면..?
SELECT MOD(10, 3) FROM DUAL;

SELECT MOD(10.9, 3) FROM DUAL;
--------------------------------------------------------------------------------
/*
    * ROUND : 반올림한 값을 구해주는 함수
    
    ROUND(숫자[, 위치]) : 위치=> 소숫점 N번째 자리
*/
SELECT ROUND(123.456) FROM DUAL;    -- 결과 : 123
SELECT ROUND(123.456, 1) FROM DUAL; -- 결과 : 123.5
SELECT ROUND(123.456, 2) FROM DUAL; -- 결과 : 123.46

SELECT ROUND(123.456, -1) FROM DUAL; -- 결과 : 120
SELECT ROUND(123.456, -2) FROM DUAL; -- 결과 : 100
-- => 위치값은 양수로 증가할 수록 소숫점 뒤로 한칸씩 이동, 음수로 감소할 수록 소숫점 앞자리로 이동
--------------------------------------------------------------------------------
/*
    * CEIL : 올림처리한 값을 구해주는 함수
    
    CEIL(숫자)
*/
SELECT CEIL(123.456) FROM DUAL; -- 결과 : 124

/*
    * FLOOR : 버림처리한 값을 구해주는 함수
    
    FLOOR(숫자)
*/
SELECT FLOOR(123.456) FROM DUAL; -- 결과 : 123

/*
    * TRUNC : 버림처리한 값을 구해주는 함수(위치 지정 가능)
    
    TRUNC(숫자[, 위치])
*/
SELECT TRUNC(123.456) FROM DUAL;     -- 결과 : 123
SELECT TRUNC(123.456, 1) FROM DUAL;  -- 결과 : 123.4
SELECT TRUNC(123.456, -1) FROM DUAL; -- 결과 : 120
--==============================================================================








/*
    * DCL (DATA CONTROL LANGUAGE) : 데이터 제어 언어
    
    => 계정에 시스템 권한/객체 접근 원한을 부여하거나 회수하는 구문
    
    - 시스템 권한 : DB에 접근하는 권한, 객체를 생성할 수 있는 권한
    - 객체접근 권한 : 특정 객체들을 조작할 수 있는 권한
    
*/
/*
    * 계정 생성 *
    CREATE USER 계정명 IDENTIFIED BY 비밀번호;
    
    * 권한 부여 *
    GRANT 권한(CONNECT, RESOURCE) TO 계정명;
    
    * 시스템 권한 종류 *
    CREATE SESSION : 접속 권한
    CREATE TABLE : 테이블 생성 권한
    CREATE VIEW : 뷰 생성 권한
    CREATE SEQUENCE : 시퀀스 생성 권한
    ...
    
    * 객체 접근 권한 종류 *
    
    종류      |       접근객체
    SELECT     TABLE, VIEW, SEQUENCE    조회(R)
    INSERT     TABLE, VIEW              추가(C)
    UPDATE     TABLE, VIEW              수정(U)
    DELETE     TABLE, VIEW              삭제(D)
    
    GRANT 권한종류 ON 특정객체 TO 계정명;
    EX) GRANT SELECT ON KH.EMPLOYEE TO TEST;
    ---> 테스트 계정에 KH계정의 EMPLOYEE 테이블을 조회할 수 있는 권한을 부여
    
    * 권한 회수 *
    REVOKE 회수할 권한 FROM 계정명;
    EX) REVOKE SELECT ON KH.EMPLOYEE FROM TEST;
    --> TEST 계정에 부여했던 KH계정의 EMPLOYEE 테이블을 조회할 수 있는 권한을 회수
*/
/*
    ROLE (롤, 규칙) : 특정 권한들을 하나의 집합으로 모아놓은 것
    
    - CONNECT : 접속권한 (CREATE SESSION)
    - RESOURCE : 자원관리 (특정 객체 생성 권한) (CREATE TABLE, CREATE SEQUENCE, ...
*/
-- 롤 정보 조회
SELECT * FROM ROLE_SYS_PRIVS;
-------------------------------------
/*
    TCL (TRANSACTION CONTROL LANGUAGE)
    
    * 트랜잭션 : 데이터베이스의 논리적 연산단위
                데이터의 변경사항(DML사용시)들을 하나의 묶음처럼 트랜잭션에 모아두기
    * 트랜잭션 종류
        -COMMIT : 트랜잭션에 담겨져있는 변경사항들을 실제 DB에 적용하겠다를 의미!
        -ROLLBACK : 트랜잭션에 담겨있는 변경사항들을 삭제(취소)하고.
                    마지막COMIT 위치(시점)로 돌아가는것을 의미!
        -SAVEPOINT : 현재 시점에 변경사항들을 임시로 저장해두는 것을 의미!
                    ROLLBACK시 전체 변경 사항들을 모두 삭제하지 않고 해당 위치까지만 취소가능
*/
-- EMP-1테이블 삭제
DROP TABLE EMP01; -->DDL. 트랜잭션 처리 X.

-- EMP01 테이블 복제(EMPLOYEE 테이블에서 사번, 사원명, 부서명을 조회)
CREATE TABLE EMP01
AS (SELECT EMP_ID, EMP_NAME, DEPT_TITLE
    FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
);
SELECT * FROM EMP01;

-- 사번이 217, 214인 사원을 삭제 -> DML 트랜잭션 처리 O.
DELETE FROM EMP01
WHERE EMP_ID IN (217,214);

ROLLBACK;
-----------
DELETE FROM EMP01 WHERE EMP_ID = 217;
DELETE FROM EMP01 WHERE EMP_ID = 214;

COMMIT; --DB에 변경사항을 적용하기
ROLLBACK;--마지막 커밋시점으로 돌아가기
----------------------
--208, 209, 210번 사원을 삭제
DELETE FROM EMP01
WHERE EMP_ID IN (208, 209, 210);

SELECT * FROM EMP01;

SAVEPOINT SP;
-- 500번 사원 추가
INSERT INTO EMP01 VALUES (500, '카리나', '해외영업2부');
-- 215 사원 삭제
DELETE FROM EMP01 WHERE EMP_ID = 215;

--SP시점을 롤백
ROLLBACK TO SP;
COMMIT;
-------------------------------------
SELECT * FROM EMP01;

--221번 사원 삭제
DELETE FROM EMP01 WHERE EMP_ID = 221;

--DDL문 사용
CREATE TABLE TEST (
    TID NUMBER
    );
    
ROLLBACK;

--> DDL문(CREATE, ALTER, DROP)을 사용하게 되면 기존 트랜잭션에 저장된 변경사항들이 무조건 반영됨(COMMIT)
-- DDL문 사용전 DML로 사용된 쿼리들이 있다면 확실하게 처리(COMMIT/ROLLBACK)한 후에 DDL을 사용해야 함!


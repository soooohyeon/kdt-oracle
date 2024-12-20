-- VIEW
-- AS 뒤 작성한 쿼리문으로 VIEW에 담음
CREATE VIEW MEMRENTAL AS
SELECT M.MEM_ID, M.MEM_NAME, R.REN_ID, R.BOOK_ID, R.REN_RENTALDATE, R.REN_RETURNDATE
FROM TBL_MEMBER M
JOIN TBL_RENTAL R	-- 내부조인
ON M.MEM_ID = R.MEM_ID; -- 일치하는 컬럼으로 ON절 작성

SELECT * FROM MEMRENTAL;

SELECT * FROM TBL_RENTAL tR;

-- PLAYER 테이블에서 나이 컬럼을 추가한 뷰 생성
SELECT * FROM PLAYER;


-- (SYSDATE - BIRTH_DATE)/365 : 나이
SELECT PLAYER_NAME 이름, TRUNC(BIRTH_DATE, 'YYYY') 생일, ROUND((SYSDATE - BIRTH_DATE)/365, 0) 나이
FROM PLAYER p;
-- TRUNC 함수 : 시간 정보를 제외한 날짜값만 유지 (형식은 YYYY-MM-DD HH:mm:SS 그대로 유지됨)
-- TRUNC(data [, format]) : 날짜 값에서 시간정보(HH:MI:SS)를 제거하고 날짜만 반환

--SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;	-- 문자열 타입 날짜
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

CREATE VIEW VIEW_PLAYER AS
SELECT PLAYER_NAME 이름, TRUNC(BIRTH_DATE, 'YYYY') 생일, ROUND((SYSDATE - BIRTH_DATE)/365, 0) 나이
FROM PLAYER p;

SELECT * FROM VIEW_PLAYER;	-- 만들어둔 VIEW 확인

SELECT 이름, 나이 FROM VIEW_PLAYER;	-- 만들어둔 VIEW에 컬럼 명칭으로 확인

DROP VIEW VIEW_PLAYER;

CREATE VIEW VIEW_PLAYER AS		-- 원본 테이블은 그대로 두고 복제해서 필요한 값만 확인 가능
SELECT P.*, ROUND((SYSDATE-BIRTH_DATE)/365, 0) AGE	-- 기본 PLAYER 테이블에 나이 컬럼 추가해서 VIEW 생성
FROM PLAYER P;

SELECT * FROM VIEW_PLAYER;

-- VIEW의 데이터를 삭제해도 원본 테이블의 데이터는 그대로 남아있음

---------------------------------------------------------------------

-- EMPLOYEES 테이블에서 사원이름과 그 매니저 이름이 있는 VIEW 만들기
SELECT * FROM EMPLOYEES;

-- SELF JOIN : EMPLOYEES 테이블내에서 직원과 해당 직원의 매니저를 같은 테이블에 매칭
SELECT e1.EMPLOYEE_ID, e1.FIRST_NAME || ' ' || e1.LAST_NAME "사원 이름",
		e2.MANAGER_ID, e2.FIRST_NAME || ' ' || e2.LAST_NAME "매니저 이름"
FROM EMPLOYEES e1 JOIN EMPLOYEES e2 -- 내부조인 AND 셀프조인
ON E1.MANAGER_ID = E2.EMPLOYEE_ID;	-- 등가조인
-- E1 : 사원, E2 : 매니저
-- ON E1.MANAGER_ID = E2.EMPLOYEE_ID
-- E1 사원의 매니저ID와 E2 매니저의 사원ID가 일치해야함

-- VIEW 생성
CREATE VIEW view_employees AS
SELECT e1.employee_id, e1.FIRST_NAME || ' ' || e1.LAST_NAME 사원이름, 
   e2.MANAGER_ID, e2.FIRST_NAME || ' ' || e2.LAST_NAME 매니저이름,
   e1.job_id, e1.department_id
FROM EMPLOYEES e1 JOIN EMPLOYEES e2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID;
-- MANAGERID는 자기 자신의 EMPLOYEES 테이블을 참조하고 있음

SELECT * FROM VIEW_EMPLOYEES ve;

-- view_employees의 department_id를 이용해서 department_name이 나오는지 확인하기
--SELECT VE.* , D.DEPARTMENT_NAME
SELECT VE.EMPLOYEE_ID, VE.사원이름, VE.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM VIEW_EMPLOYEES VE JOIN DEPARTMENTS D
ON VE.DEPARTMENT_ID = D.DEPARTMENT_ID;
-- VIEW의 컬럼 조회할 때 VIEW 생성시 작성한 컬럼명으로 조회해줘야함

-- PK 설정된 것 확인 쿼리 ?
SELECT cols.table_name, cols.column_name, cons.constraint_name
FROM all_constraints cons
JOIN all_cons_columns cols
ON cons.constraint_name = cols.constraint_name
WHERE cons.constraint_type = 'R'
AND cols.table_name = 'EMPLOYEES';

-- FK 설정된 것 확인 쿼리


-- 해당 계정에 부여된 권한 확인
select * from user_tab_privs_recd;



SELECT FIRST_NAME, SALARY,
	CASE
			WHEN salary >= 5000 THEN '높음'
			WHEN salary >= 3000 THEN '낮음'
			ELSE '낮음'
	END
FROM EMPLOYEES e;
	
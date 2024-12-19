-- 2. 집계 함수, GROUP BY

-- 집계 함수 -> 결과는 1개(단일행)으로 나옴
-- 주의 사항 -> NULL 포함시키지 않음
SELECT * FROM employees;

-- count()
-- 1) 전체 직원 수 확인
SELECT COUNT(*)
FROM employees;

-- 2) 특정 부서 101번의 직원 수 확인
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT COUNT(*) AS "110번의 직원 수"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 110;

-- SUM()
-- 1) 모든 직원의 급여 총합 계산
--SELECT FIRST_NAME, SUM(SALARY)	-- 각 컬럼의 행 개수가 달라 오류 발생
SELECT SUM(SALARY)
FROM EMPLOYEES;

-- 2) 부서별 급여 총합 계산
SELECT DEPARTMENT_ID
FROM EMPLOYEES;

SELECT DEPARTMENT_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- AVG()
-- 1) 전체 직원의 평균 급여
SELECT AVG(SALARY)
FROM EMPLOYEES;

-- 2) 부서별 평균 급여
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- MAX(), MIN()
SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEES;

-- 종합
-- 부서별 최고급여, 최저급여, 평균급여, 총합 조회
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY), AVG(SALARY), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT * FROM employees;

SELECT COUNT(COMMISSION_PCT)	-- NULL값을 제외한 개수
FROM EMPLOYEES;

SELECT COUNT(NVL(COMMISSION_PCT, 0))	-- NULL값을 NULL함수로 변환해서 COUNT 해줌
FROM EMPLOYEES;

-- GROUP BY, HAVING
-- 평균 급여가 5000이상인 부서 조회
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE SALARY >= 5000
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >= 5000;

-- 부서별 급여 총합이 50000보다 작은 부서들만 내림차순으로 정렬
SELECT DEPARTMENT_ID, SUM(SALARY) 급여총합
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) < 50000
--ORDER BY SALARY DESC;	-- 오류 발생 : EMPLOYEES의 모든 SALARY의 행을 정렬하기 때문
ORDER BY 급여총합 DESC;

-- GROUP BY : ~ 별
-- GROUP BY 컬럼명 HAVING 조건식
-- WHERE절은 집계함수 불가, HAVING절은 집계함수 가능

CREATE TABLE tbl_stu( 
   stu_id NUMBER PRIMARY KEY,
   stu_name varchar2(100) NOT NULL,
   stu_phone varchar2(100),
   stu_age NUMBER,
   stu_dept varchar2(100) 
);

SELECT * FROM tbl_stu;

INSERT INTO tbl_stu
--VALUES (1, '조승우', '010-8901-8888', 30, '교육학과');
VALUES (2, '이동욱', '010-9012-9999', 30, '컴퓨터 공학과');
--VALUES (3, '김소현', '010-9876-1234', 20, '방송연예과');
--VALUES (4, '김남길', '010-5050-1222', 26, '컴퓨터 공학과');
--VALUES (5, '강하늘', '010-5111-5151', 22, '방송연예과');
--VALUES (6, '공유', '010-5050-5151', 30, '컴퓨터 공학과');
--VALUES (7, '이종혁', '010-1213-2222', 34, '방송연예과');
VALUES (8, '박은빈', '010-1213-2222', 20, '방송연예과');

SELECT * FROM tbl_stu;

--1) 학과 종류 검색
SELECT DISTINCT stu_dept 학과
FROM tbl_stu;

--2) 각 학과별 학생수 조회
SELECT stu_dept 학과, COUNT(stu_age) "학과별 학생 수"
FROM tbl_stu
GROUP BY stu_dept

--3) 각 학과별 평균나이 조회
-- ROUND() : 실수 자리수 제어
SELECT stu_dept 학과, ROUND(AVG(stu_age), 2) || '살' "학과별 평균나이"
FROM tbl_stu
GROUP BY stu_dept;

--4) 학과별로 30세 이상인 학생(전체) 조회
SELECT * 
FROM tbl_stu
WHERE stu_age >= 30
ORDER BY stu_dept;

-- 윈도우 함수 OVER()
-- COUNT(*) OVER (PARTITION BY STU_DEPT) : 학과별 학생 수 출력
SELECT STU_DEPT 학과, STU_NAME 이름, STU_AGE 나이, STU_PHONE 연락처, COUNT(*) OVER (PARTITION BY STU_DEPT) 
FROM TBL_STU
WHERE STU_AGE >= 30;

-- 서브 쿼리 : 학과별 학생 정보를 출력하면서 그룹화된 정보 유지
-- 메인 쿼리 : 서브 쿼리 외부에 작성한 쿼리
SELECT ts.STU_DEPT 학과, ts.STU_NAME 이름, ts.STU_AGE 나이, ts.STU_PHONE 연락처
FROM TBL_STU ts
JOIN (	-- 서브쿼리 : 쿼리 안에 또 다른 쿼리가 있음
	SELECT STU_DEPT, COUNT(*) 학생수
	FROM TBL_STU
	WHERE STU_AGE >= 30
	GROUP BY STU_DEPT
) S ON ts.STU_DEPT = S.STU_DEPT		-- S : JOIN 안에 작성한 서브 쿼리를 지칭
WHERE ts.STU_AGE >= 30
ORDER BY ts.STU_DEPT;


--5) 학생 이름이 김으로 시작하거나 이로 시작하는 학생들의 학과별 수 조회
SELECT stu_dept 학과, COUNT(stu_dept) "학생 수"
FROM tbl_stu
WHERE stu_name LIKE '김%' OR stu_name LIKE '이%'
GROUP BY stu_dept;

--6) 컴퓨터 공학과의 학생 중 25살 이상인 학생 수 조회
SELECT COUNT(stu_id)
FROM tbl_stu
WHERE stu_dept = '컴퓨터 공학과' AND stu_age >= 25;
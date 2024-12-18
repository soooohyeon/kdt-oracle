--1번 : SELECT(조회)

--SELECT (조회) : 테이블에서 데이터를 조회할 때 사용하는 명령어
-- hr 계정 내에 존재하는 EMPLOYEES 테이블
-- 107행, 11개의 컬럼으로 이루어져 있음
-- 107명의 직원 데이터를 저장해 놓은 연습용 테이블

-- SELECT 컬럼명 FROM 테이블명;
-- 해당 테이블에서 특정 컬럼을 선택해서 조회하겠다는 의미

SELECT first_name FROM hr.EMPLOYEES;
SELECT first_name FROM EMPLOYEES;
-- HR 계정을 작성하는 이유는 여러 계정에 같은 이름의 테이블이름이 존재할 수 있기 때문
-- But, 지금 로그인한 계정의 테이블의 우선순위가 높기 때문에 일반적으로 계정명 생략 가능

-- * : 모든 컬럼 조회를 의미
SELECT * FROM EMPLOYEES;

-- 2개 이상의 컬럼 조회시
SELECT first_name, last_name
FROM EMPLOYEES;
-- 위의 작성한것과 의미는 같지만 먼저 작성된 컬러명 먼저 Result 테이블에 표시됨
SELECT last_name, first_name
FROM EMPLOYEES;

-- 사원의 이름(first_name), 성(last_name), 급여 조회
-- 컬럼명을 모른다면 해당 테이블 전체 조회해서 컬러명 확인해줄 것!
SELECT first_name, last_name, salary
FROM EMPLOYEES;	-- 어떤 테이블에서 조회를 진행할 것인지 작성해줘야함

-- 정렬해서 조회
-- ORDER BY 절
-- (1) 사원의 이름, 성, 급여를 급여 높은 순으로 조회 (오름차순)
SELECT first_name, last_name, salary	-- 2) first_name, last_name, salary컬럼 조회
FROM EMPLOYEES		-- 1) EMPLOYEES 테이블에서
ORDER BY salary;	-- 3) salary 오름차순으로 정렬해서
-- (2) ASC : 오름차순(ascending) 앞글자 3글자만 따서 ASC로 사용 (생략 가능)
SELECT first_name, last_name, salary
FROM EMPLOYEES
ORDER BY salary ASC;

-- 사원의 이름, 성, 급여를 급여 낮은 순으로 조회 (내림차순)
-- DESC 키워드 사용
SELECT first_name, last_name, salary
FROM EMPLOYEES
ORDER BY salary DESC;

-- 문자 정렬 (first_name)
-- ASC(기본) : A → Z 순으로 정렬, 1번째 자리 비교 후 2번째 자리 비교하고 순서대로 정렬됨
-- DESC : Z → A 순으로 정렬, 1번째 자리 비교 후 2번째 자리 비교하고 순서대로 정렬됨
SELECT first_name
FROM EMPLOYEES
--ORDER BY first_name ASC;
ORDER BY first_name DESC;

-- 날자 정렬 (hire_date)
-- ASC(기본) : 예전 날짜부터 최신 날짜 순으로 정렬
-- DESC : 최신 날짜부터 예전 날짜 순으로 정렬
SELECT hire_date
FROM employees
ORDER BY hire_date;
-- ORDER BY hire_date DESC;
-- ORDER BY 절에서 오름차순 ASC나 내림차순 DESC를 생략하면 기본은 오름차순 정렬

SELECT salary			-- 2) salary 컬럼을
FROM employees			-- 1) EMPLOYEES 테이블에서
ORDER BY first_name;	-- 3) 정렬은 first_name을 오름차순으로 정렬해서 조회
-- 즉, 조회하는 컬럼이 아니더라도 타 컬럼으로 정렬도 가능 (해당 테이블에 있는 컬럼일 경우)
-- 중복 정렬도 가능
SELECT first_name, salary		-- 2) salary 컬럼을
FROM employees					-- 1) EMPLOYEES 테이블에서
ORDER BY first_name, salary;	-- 3) first_name을 오름차순으로 정렬하고 salary로 오름차순 정렬해서 조회
-- first_name 기준으로 정렬 먼저 하고 만약 first_name 컬럼의 같은 데이터 값이 있다면 salary로 정렬
-- 마찬가지로 오름차순이라면 생략 가능

-- 사원 테이블에서 직급(JOB_ID) 조회
SELECT job_id
FROM employees;

-- SELECT 다음 중복을 제거하는 DISTINCT 키워드 사용가능 (중복 제거)
-- 행 제거
SELECT DISTINCT job_id
FROM employees;

-- 컬럼을 여러개 넣으면 DISTINCT 어떻게 작동될지 확인
-- 107행 → 105행으로 줄음 : 조회할 2가지 컬럼이 모두 중복되는 데이터만 제거 (중복 제거)
SELECT DISTINCT job_id, hire_date
FROM employees;

-- 별칭 붙여 조회
-- AS "변경할 이름" : 결과에 컬럼명이 작성한 이름으로 변경됨
SELECT first_name AS "이름", last_name AS "성", salary AS "봉급", employee_id AS "사원 번호"
FROM employees;

-- AS 키워드 생략 가능
-- "" 생략 가능 (띄어쓰기 할 것, 오류는 발생하지 않지만 추후 코드가 복잡해지면 가독성이 안좋아짐)
-- 별칭에 띄어쓰기가 있다면 "" 생략 불가
SELECT first_name "이름", last_name "성", salary "봉급", employee_id "사원 번호"
FROM employees;

-- 실습01. 사원의 이름(first_name), 성(last_name), 봉급을 조회하는데 봉급 내림차순으로 별칭 사용하여 조회
--** 쿼리 작성 순서
--1. first_name, last_name, salary AS "봉급"을 SELECT
--2. employees 테이블에서
--3. salary 내림차순 정렬
--** 해석 순서 (= 쿼리문 실행 순서)
--1. employees 테이블에서
--2. first_name, last_name, salary AS "봉급"을 SELECT
--3. salary 내림차순 정렬
SELECT first_name 이름, last_name "성", salary AS "봉급"
FROM employees
ORDER BY 봉급 DESC;
-- 실행 순서도 해석 순과 동일해서 ORDER BY문에서 SELECT에서 사용한 별칭 사용 가능


SELECT * FROM EMPLOYEES;
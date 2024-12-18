-- Q1. 학생의 수학, 영어, 국어 점수 중 한 과목이라도 50점 미만이 아니고
-- 학점이 B이상인 학생만 학생번호, 이름, 학점으로 별칭 붙여서 출력하기
SELECT STUDENT_NUMBER 학생번호, STUDENT_NAME 이름, STUDENT_GRADE 학점
FROM TBL_STUDENT
--WHERE (STUDENT_MATH >= 50 OR STUDENT_ENG >= 50 OR STUDENT_KOR >= 50)
--	AND (STUDENT_GRADE = 'B' OR STUDENT_GRADE = 'A');
WHERE (STUDENT_MATH >= 50 OR STUDENT_ENG >= 50 OR STUDENT_KOR >= 50)
	AND STUDENT_GRADE IN ('A', 'B');

-- Q2. 학생의 수학, 영어, 국어 점수 중 한 과목이라도 30점 미만이면 테이블에서 삭제하기
DELETE FROM TBL_STUDENT
WHERE STUDENT_MATH < 30 OR STUDENT_ENG < 30 OR STUDENT_KOR < 30;

SELECT * FROM TBL_STUDENT;

-- 추가 실습 과제

--1. 모든 직원의 정보를 조회(단, 이름은 FIRST_NAME과 LAST_NAME을 띄어쓰기로 연결한 값을 이름이라는 별칭으로 표시)
SELECT employee_id, first_name || ' ' || last_name 이름, email, phone_number,
	hire_date, job_id, salary, commission_pct, manager_id, department_id
FROM employees;

--2. 모든 직원의 이름(FIRST_NAME)과 급여(SALARY)를 조회
SELECT first_name AS "이름", salary "급여"
FROM employees;

--3. 급여가 5000 이상인 직원들의 EMPLOYEE_ID, FIRST_NAME, SALARY를 조회
SELECT employee_id, first_name, salary
FROM employees
WHERE salary >= 5000;

--4. 현재 날짜와 10일 후의 날짜를 조회(오라클 제공하는 기본 테이블 사용)
SELECT sysdate "현재 날짜", sysdate + 10 "10일 후"
FROM DUAL;

--5. DEPARTMENT_ID가 50인 직원들의 이름과 부서번호를 조회
SELECT first_name 이름, department_id 부서번호
FROM employees
WHERE department_id = 50;

--6. LAST_NAME이 'King'인 직원의 정보를 조회
SELECT *
FROM employees
WHERE last_name = 'King';

--7. SALARY가 NULL이 아닌 직원들의 정보를 조회
SELECT *
FROM employees
WHERE salary IS NOT NULL;

--8. 직원 테이블의 모든 직책(JOB_ID)을 중복 없이 조회
SELECT DISTINCT job_id
FROM employees;

--9. 급여가 3000에서 7000 사이인 직원의 FIRST_NAME, SALARY를 조회
SELECT first_name, salary
FROM employees
--WHERE salary >= 3000 AND salary <= 7000;	-- (1)
WHERE salary BETWEEN 3000 AND 7000;			-- (2)

--10. 이름의 네 번째 문자가 'e'인 직원의 이름을 조회
SELECT first_name 이름
FROM employees
WHERE first_name LIKE '___e';

--11. JOB_ID가 'IT_PROG' 또는 'SA_REP'인 직원들의 이름과 직책을 조회
SELECT first_name 이름, job_id 직책
FROM employees
WHERE job_id = 'IT_PROG' OR job_id = 'SA_REP';

--12. 이름(FIRST_NAME)이 'A'로 시작하는 직원들의 정보를 조회
SELECT *
FROM employees
WHERE first_name LIKE 'A%';

--13. SALARY가 10000 이상이고 DEPARTMENT_ID가 90인 직원의 이름과 급여를 조회
SELECT first_name || ' ' || last_name 이름, salary "급여"
FROM employees
WHERE salary >= 10000 AND department_id = 90;

--14. SALARY가 5000 이하이거나 DEPARTMENT_ID가 30인 직원의 정보를 조회
SELECT *
FROM employees
WHERE salary <= 5000 OR department_id = 30;

--15. LAST_NAME의 두 번째 문자가 'a'인 직원의 정보를 조회
SELECT *
FROM employees
WHERE last_name LIKE '_a%';

--16. SALARY를 기준으로 내림차순 정렬한 후 직원의 이름과 급여를 조회
SELECT first_name 이름, salary 급여
FROM employees
ORDER BY 급여 DESC;

--17. 직원의 급여에 10%를 더한 값을 BONUS라는 별칭으로 조회
SELECT salary * 1.1 BONUS
FROM employees;

--18. SALARY가 6000 이상인 직원의 급여와 COMMISSION_PCT를 기준으로 정렬(급여는 내림차순, 커미션은 오름차순)
SELECT *
FROM employees
WHERE salary >= 6000
ORDER BY salary DESC, commission_pct;

--19. 이름이 'A'로 시작하고 급여가 10000 이상인 직원들의 이름과 급여를 조회
SELECT first_name 이름, salary 급여
FROM employees
WHERE first_name LIKE 'A%' AND salary >= 10000;

--20. 급여가 10000 이상 15000 이하이고, 부서 ID가 80 또는 90인 직원들의 이름, 급여, 부서 ID를 조회
SELECT first_name 이름, salary AS "급여", department_id "부서 ID"
FROM employees
--WHERE (salary >= 10000 AND salary <= 15000) AND (department_id = 80 OR department_id = 90);	-- (1)
WHERE salary BETWEEN 10000 AND 15000 AND department_id IN(80, 90);								-- (2)

--21. 입사일(HIRE_DATE)로부터 정확히 1년 후의 날짜를 계산하여 입사 1년 후라는 별칭으로 출력
SELECT hire_date, hire_date + 365 "입사 1년 후"
FROM employees;
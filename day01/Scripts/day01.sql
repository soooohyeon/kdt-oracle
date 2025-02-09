-- sql 주석 (ctrl + /)
-- 주석 처리된 sql문은 실행되지 않음
-- 한줄 주석 -- : 해당 라인 줄 주석 처리
/* 범위 주석 (ctrl + shift + /)
 * 범위 안에 있는 여러줄 주석 처리
 */
-- select 뒤 * 은 전체를 의미함
-- 실행 단축키 : ctrl + enter
-- HR로 로그인시에만 아래 테이블 확인 가능
-- select를 사용하여 employees 테이블의 모든 컬럼만 선택하여 조회
SELECT * FROM employees;

-- hr 계정의 employees 테이블의 모든 컬럼만 조회
-- hr로 로그인했기 때문에 생략도 가능
SELECT * FROM hr.employees;

-- select를 사용하여 employees 테이블의 first_name 컬럼만 선택하여 조회
SELECT first_name FROM employees;

-- ; 세미콜론 : 하나의 명령이 끝나면 작성 (마침표로 생각하면 됨)
-- 세미콜론을 적어야 한 줄의 끝이라고 생각하기 떄문에 세미콜론 이전에 줄바꿈하더라도 상관 x
-- SQL문은 대소문자 구분 x
-- ctrl + shift + f : 자동 정렬
SELECT FIRST_NAME
FROM HR.EMPLOYEES;
-- 테이블 생성(DDL)
CREATE TABLE TBL_MEMBER (
	MEMBER_ID NUMBER,
	MEMBER_NAME VARCHAR2(100),
	MEMBER_AGE NUMBER(3)
);

SELECT * FROM TBL_MEMBER;

-- 데이터 추가 : INSERT
INSERT INTO TBL_MEMBER
VALUES (1, '신짱구', 25);

INSERT INTO TBL_MEMBER
VALUES (2, '김철수', 5);

 INSERT INTO TBL_MEMBER
 VALUES (3, '신짱아', 1);

 INSERT INTO TBL_MEMBER (MEMBER_ID, MEMBER_NAME)
 VALUES (4, '유리');

 INSERT INTO TBL_MEMBER (MEMBER_ID)
 VALUES (5);
 
-- 데이터 수정 : UPDATE
UPDATE TBL_MEMBER
SET MEMBER_AGE  = 5

UPDATE TBL_MEMBER 
SET MEMBER_AGE = 20
WHERE MEMBER_NAME = '유리';	-- =는 같다는관계연산자

-- 삭제 :  Delete
DELETE FROM TBL_MEMBER
WHERE MEMBER_AGE = 5;

DELETE FROM TBL_MEMBER tm;		-- 뒤  WHERE 절인 조건식이 없어서 전체 삭제됨 

SELECT * FROM TBL_MEMBER;

-- ------------------------------------------------------------

-- 학생 테이블 생성
CREATE TABLE TBL_STUDENT (
	STUDENT_NUMBER NUMBER,
	STUDENT_NAME VARCHAR2(100),
	STUDENT_MATH NUMBER,
	STUDENT_ENG NUMBER,
	STUDENT_KOR NUMBER,
	STUDENT_GRADE VARCHAR2(100)
);

DROP TABLE TBL_STUDENT;

/* 학생 테이블에 데이터 추가
 * 학생번호 이름 수학 영어 국어
 * 1   김철수   90   90   90   
 * 2   홍길동   70   25   55
 * 3   이유리   89   91   77
 * 4   김웅이   48   100   100
 * 5   신짱구   50   10   NULL
 * */

INSERT INTO TBL_STUDENT (STUDENT_NUMBER, STUDENT_NAME, STUDENT_MATH, STUDENT_ENG, STUDENT_KOR)
--VALUES (1, '김철수', 90, 90, 90);
--VALUES (2, '홍길동', 70, 25, 55);
--VALUES (3, '이유리', 89, 91, 77);
VALUES (4, '김웅이', 48, 100, 100);
INSERT INTO TBL_STUDENT (STUDENT_NUMBER, STUDENT_NAME, STUDENT_MATH, STUDENT_ENG)
VALUES (5, '신짱구', 50, 10);
 
SELECT STUDENT_NUMBER 학생번호, STUDENT_NAME 이름, STUDENT_MATH 수학, STUDENT_ENG 영어, STUDENT_KOR 국어
FROM TBL_STUDENT;

-- 전체 학생의 이름과 평균점수 조회하기(별칭도 추가)
SELECT STUDENT_NAME 이름, (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 "평균 점수"
FROM TBL_STUDENT;

-- NVL(컬럼명, 기본값) : NULL값을 특정 값으로 변경
-- NVL은 기존 타입의 값이 있기 때문에 타입을 변경하게 되면 하나의 컬럼에 타입이 2개가 되므로 오류 발생
SELECT STUDENT_NAME 이름, NVL(STUDENT_KOR, 0) 국어점수, NVL(STUDENT_GRADE, '미정') AS 학점
FROM TBL_STUDENT;

-- NVL2 (컬럼명, 값1, 값2) : NULL 여부에 따라 NULL이 아니면 값1, NULL이면 값2
-- 하나의 컬럼에는 하나의 타입의 값만 들어갈 수 있음, 따라서 NULL이 아닌 값이 모두 문자이므로 가능
--SELECT STUDENT_NAME 이름, NVL2(STUDENT_KOR, '점수 있음', '점수 없음') 국어점수
SELECT STUDENT_NAME 이름, NVL2(STUDENT_KOR, '점수 있음', 0) 국어점수	-- 기존에 있던 값들에 문자열로 넣어주면서 문자 타입으로 바뀜
FROM TBL_STUDENT ts 
-- '점수 있음', 0 : 오라클은 VARCHAR2와 NUMBER가 섞이게 되면 VARCHAR2를 우선으로 두게됨 → 여기서 0은 문자열이 됨→
-- 0, '점수 없음' : 안되는 이유 - 문자열을 정수에 담을 수 없기 때문

-- NULLIF(컬럼명, 값1) : 특정값과 같으면 NULL로 변경, 아니라면 원래 값 유지
SELECT STUDENT_NAME 이름, NULLIF(STUDENT_KOR, 100)
FROM TBL_STUDENT;

-- NULLIF(컬럼1, 컬럼2) : 두 컬럼의 값이 같으면 NULL로 변경, 값이 다르면 기존 값 출력
SELECT STUDENT_NAME 이름, NULLIF(STUDENT_MATH, STUDENT_ENG)
FROM TBL_STUDENT;

-- COALESCE(값1, 값2, 값3) : NULL이 아닌 첫 번째 값 반환
SELECT STUDENT_NAME 이름, COALESCE(STUDENT_KOR, STUDENT_ENG, STUDENT_MATH, 0) AS 첫번째점수
FROM TBL_STUDENT;

-- 수정 UPDATE
--UPDATE 테이블명
--SET 컬럼명 = 값
--WHERE 행을 찾을 조건;

-- STUDENT_KOR 컬럼에 NULL인 값 찾아서 0으로 수정해줌
UPDATE TBL_STUDENT
SET STUDENT_KOR = NVL(STUDENT_KOR, 0);

-- 전체 학생의 이름과 평균점수 조회하기(별칭도 추가)
SELECT STUDENT_NAME 이름, (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 "평균 점수"
FROM TBL_STUDENT;

-- 학생의 평균 점수를 구하고 학점 수정
-- A : 90점 이상
-- B : 80점 이상 90점 미만
-- C : 50점 이상 80점 미만
-- F : 50점 미만

-- ROUND(값, 자리수) : 소수점을 반올림하여 특정 소수점 까지만 표현 가능
-- ROUND(평균 점수 구하는 공식 >= 90)	-- 조건문이니 WHERE 절에 작성
-- BETWEEN a AND b는 a 이상 b 이하의 값만 가능하므로 여기서는 적합하지 않음
UPDATE TBL_STUDENT 
--SET STUDENT_GRADE = 'A'
--WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 >= 90;
--SET STUDENT_GRADE = 'B'
--WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 >= 80
--	AND (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 < 90;
--SET STUDENT_GRADE = 'C'
--WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 >= 50
--	AND (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 < 80;
SET STUDENT_GRADE = 'F'
WHERE (STUDENT_MATH + STUDENT_ENG + STUDENT_KOR) / 3 < 50;

SELECT * FROM TBL_STUDENT;

-- Q1. 학생의 수학, 영어, 국어 점수 중 한 과목이라도 50점 미만이 아니고
-- 학점이 B이상인 학생만 학생번호, 이름, 학점으로 별칭 붙여서 출력하기
SELECT STUDENT_NUMBER 학생번호, STUDENT_NAME 이름, STUDENT_GRADE 학점
FROM TBL_STUDENT
WHERE (STUDENT_MATH >= 50 OR STUDENT_ENG >= 50 OR STUDENT_KOR >= 50)
	AND (STUDENT_GRADE = 'B' OR STUDENT_GRADE = 'A');

-- Q2. 학생의 수학, 영어, 국어 점수 중 한 과목이라도 30점 미만이면 테이블에서 삭제하기


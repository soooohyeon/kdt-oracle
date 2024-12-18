-- 학생
CREATE TABLE TBL_STUDENT (
	STUDENT_ID NUMBER,
	STUDENT_NAME VARCHAR2(100) NOT NULL,
	STUDENT_AGE NUMBER NOT NULL,
	STUDENT_PHONE VARCHAR2(100) NOT NULL UNIQUE,
	STUDENT_ADDRESS VARCHAR2(100) NOT NULL,
	CONSTRAINT PK_STUDENT PRIMARY KEY(STUDENT_ID)
);

-- 과목
CREATE TABLE TBL_SUBJECT (
	SUBJECT_ID NUMBER,
	STUDENT_NAME VARCHAR2(100) NOT NULL UNIQUE,
	CONSTRAINT PK_SUBJECT PRIMARY KEY (SUBJECT_ID)
);

-- 교수님
CREATE TABLE TBL_TEACHER (
	TEACHER_ID NUMBER,
	TEACHER_NAME VARCHAR2(100),
	CONSTRAINT PK_TEACHER PRIMARY KEY (TEACHER_ID)
);

-- 수업
CREATE TABLE TBL_CLASS (
	CLASS_ID NUMBER,
	CLASS_STARTDAY DATE NOT NULL,
	CLASS_TIME NUMBER NOT NULL,
	SUBJECT_ID NUMBER,
	TEACHER_ID NUMBER,
	CONSTRAINT PK_CLASS PRIMARY KEY (CLASS_ID),
	CONSTRAINT FK_CLASS_SUBJECT FOREIGN KEY (SUBJECT_ID)
		REFERENCES TBL_SUBJECT(SUBJECT_ID),
	CONSTRAINT FK_CLASS_TEACHER FOREIGN KEY (TEACHER_ID)
		REFERENCES TBL_TEACHER(TEACHER_ID)
);

-- 수업
CREATE TABLE TBL_SCORELIST (
	CLASS_ID NUMBER,
	STUDENT_ID NUMBER,
	SCORE_NUMBER NUMBER NOT NULL,
	CONSTRAINT PK_SCORELIST PRIMARY KEY (CLASS_ID, STUDENT_ID),
	CONSTRAINT FK_SCORELIST_CLASS FOREIGN KEY (CLASS_ID)
		REFERENCES TBL_CLASS (CLASS_ID),
	CONSTRAINT FK_SCORELIST_STUDENT FOREIGN KEY (STUDENT_ID)
		REFERENCES TBL_STUDENT (STUDENT_ID)
);

-- 각 테이블의 시퀀스 생성 (성적 제외)
CREATE SEQUENCE SEQ_STUDENT;
CREATE SEQUENCE SEQ_SUBJECT;
CREATE SEQUENCE SEQ_TEACHER;
CREATE SEQUENCE SEQ_CLASS;

-- 학생 테이블 데이터 저장
INSERT INTO TBL_STUDENT
--VALUES (SEQ_STUDENT.NEXTVAL, '짱구', 20, '010-1234-5678', '서울시 송파구');
--VALUES (SEQ_STUDENT.NEXTVAL, '철수', 20, '010-8765-4321', '서울시 송파구');
--VALUES (SEQ_STUDENT.NEXTVAL, '유리', 20, '010-1234-1234', '서울시 강남구');
VALUES (SEQ_STUDENT.NEXTVAL, '맹구', 20, '010-1111-2222', '서울시 강동구');

-- 과목 테이블 데이터 저장
INSERT INTO TBL_SUBJECT
--VALUES (SEQ_SUBJECT.NEXTVAL, 'JAVA');
--VALUES (SEQ_SUBJECT.NEXTVAL, 'DBMS');
VALUES (SEQ_SUBJECT.NEXTVAL, 'PYTHON');

-- 강사 테이블 데이터 저장
INSERT INTO TBL_TEACHER
--VALUES (SEQ_TEACHER.NEXTVAL, '신형만');
VALUES (SEQ_TEACHER.NEXTVAL, '봉미선');

-- 수업 테이블 데이터 저장
INSERT INTO TBL_CLASS
--VALUES (SEQ_CLASS.NEXTVAL, '2024-11-21', 7, 1, 1);
--VALUES (SEQ_CLASS.NEXTVAL, '2024-12-16', 7, 2, 2);
VALUES (SEQ_CLASS.NEXTVAL, sysdate, 19, 3, 1);

INSERT INTO TBL_SCORELIST
VALUES (3, 1, 75);

SELECT * FROM TBL_STUDENT;
SELECT * FROM TBL_SUBJECT;
SELECT * FROM TBL_TEACHER;
SELECT * FROM TBL_CLASS;
SELECT * FROM TBL_SCORELIST;


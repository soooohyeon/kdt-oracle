CREATE SEQUENCE seq_user;

--사용자 정보 저장하는 유저 테이블 tbl_user
--사용자 번호
--아이디
--패스워드
--이름
--나이
--성별
--생일
CREATE TABLE tbl_user(
	user_number NUMBER,
	user_id	VARCHAR2(100),
	user_pw VARCHAR2(100),
	user_name VARCHAR2(100),
	user_age NUMBER,
	user_gender CHAR(1) DEFAULT 'M',
	USER_birth DATE,
	CONSTRAINT pk_user PRIMARY KEY(user_number)
);


INSERT INTO tbl_user
--values(seq_user.nextval, 'aaa', '1234', '신짱구', 25, 'M', '20000101');
VALUES(seq_user.nextval, 'bbb', '1234', '봉미선', 48, 'W', '19771010');



INSERT INTO tbl_user(user_number, user_id, user_pw, user_name, user_age, user_gender, user_birth)
VALUES (seq_user.nextval, 'ccc', '1234', '신짱구', 25, 'M', '20000101');

DELETE FROM tbl_user
WHERE user_number = 2;

-- 로그인
SELECT user_number
FROM tbl_user
WHERE user_id = 'aaa' AND user_pw = '1234';

-- 이름과 생년월일로 아이디 찾기
SELECT user_id
FROM tbl_user
WHERE user_name = '신짱구' AND user_birth = '20000101';

-- 회원 전체 정보 수정
--UPDATE tbl_user
--SET user_id = ?, user_pw = ?, user_name = ?, user_age = ?, user_gender = ?, user_birth = ?;

-- 회원 1명의 전체 정보 조회
SELECT user_id, user_pw, user_name, user_age, user_gender, user_birth
FROM tbl_user
WHERE user_number = 2;

SELECT * FROM tbl_user;

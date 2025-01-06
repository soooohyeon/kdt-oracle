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
values(seq_user.nextval, 'bbb', '1234', '봉미선', 48, 'W', '19771010');

SELECT * FROM tbl_user;
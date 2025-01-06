DROP TABLE tbl_user;

CREATE SEQUENCE seq_user;
CREATE SEQUENCE seq_book;

DROP SEQUENCE seq_user;
DROP SEQUENCE seq_book;

CREATE TABLE tbl_user (
   user_number NUMBER,
   user_id VARCHAR2(100) NOT NULL,
   user_pw VARCHAR2(100) NOT NULL,
   user_name VARCHAR2(100) NOT NULL,
   user_phone VARCHAR2(100) UNIQUE NOT NULL,
   CONSTRAINT pk_user PRIMARY KEY(user_number)
);

CREATE TABLE tbl_book (
   book_number NUMBER,
   book_title VARCHAR2(100) NOT NULL,
   book_author VARCHAR2(100) NOT NULL,
   book_rent  VARCHAR2(100) DEFAULT 'false' NOT NULL
   CONSTRAINT check_rent CHECK(book_rent = 'true' OR book_rent = 'false'),
   CONSTRAINT pk_book PRIMARY KEY(book_number)
);

SELECT * FROM tbl_user;
SELECT * FROM tbl_book;

INSERT INTO tbl_book
--VALUES (seq_book.NEXTVAL, '소년이 온다', '한강', 'false');
--VALUES (seq_book.NEXTVAL, '불편한 편의점', '김호연', 'false');
--VALUES (seq_book.NEXTVAL, '도둑맞은 집중력', '요한 하리', 'true');
--VALUES (seq_book.NEXTVAL, '구의 증명', '최진영', 'false');
--VALUES (seq_book.NEXTVAL, '스즈메의 문단속', '신카이 마코토', 'true');
--VALUES (seq_book.NEXTVAL, '메리골드 마음 세탁소', '윤정은', 'false');
VALUES (seq_book.NEXTVAL, '불편한 편의점2', '김호연', 'false');

INSERT INTO TBL_USER 
--VALUES(SEQ_USER.NEXTVAL, 'GOD', '1234', '놀부', '010-1234-5678');
VALUES(SEQ_USER.NEXTVAL, 'HOT', '9876', '흥부', '010-9876-5432');

SELECT book_number, book_title, book_author, book_rent
FROM tbl_book;

SELECT book_number, book_title, book_author, book_rent
FROM tbl_book
WHERE book_title LIKE('%편의점%') OR book_author LIKE('%짱구%');

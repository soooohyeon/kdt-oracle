-- sys as sysdba 계정의 스크립트

-- test 계정에 데이터 삽입, 수정, 삭제 권한 부여
GRANT UPDATE, INSERT, DELETE ON employees TO test;

-- 부여한 권한 회수
--REVOKE UPDATE, INSERT, DELETE, SELECT ON employees FROM test;
REVOKE SELECT ON hr.employees FROM test;
--users 테이블 삭제
DROP TABLE users;
--users 테이블 생성
CREATE table users(
    no NUMBER,
    id VARCHAR2(20) unique not null,
    password VARCHAR2(20) not null,
    name VARCHAR2(20),
    gender VARCHAR2(10),
    PRIMARY KEY(no)
);

--seq_user_no 시퀀스 삭제
DROP SEQUENCE seq_user_no;
--seq_user_no 시퀀스 생성
CREATE SEQUENCE seq_user_no INCREMENT BY 1
START WITH 1 NOCACHE;

--users 테이블 확인
SELECT
    no,
    id,
    password,
    name,
    gender
FROM
    users;

--INSERT 예문
INSERT INTO users VALUES(
    seq_user_no.NEXTVAL,
    'asc',
    '123',
    '최영교',
    'male'
);
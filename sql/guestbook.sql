--guestbook 테이블 삭제
DROP TABLE guestbook;
--guestbook 테이블 생성
CREATE TABLE guestbook(
    no NUMBER,
    name VARCHAR2(80),
    pw   varchar2(20),
    content varchar2(2000),
    reg_date date,
    PRIMARY KEY(no)
);

--seq_no 시퀀스 삭제
DROP SEQUENCE seq_no;
--seq_no 시퀀스 생성
CREATE SEQUENCE seq_no INCREMENT BY 1 START WITH 1; 

--guestbook 테이블 확인
SELECT
    no,
    name,
    pw,
    content,
    TO_CHAR(reg_date, 'yyyy-mm-dd hh24:mm:ss') reg_date
FROM
    guestbook
ORDER BY reg_date ASC;

--INSERT 예문
INSERT INTO guestbook VALUES(seq_no.NEXTVAL, '최영교', '123', '안녕하세요', SYSDATE);
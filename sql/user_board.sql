--TABLE 삭제
DROP TABLE board;   
-- TABLE 생성
CREATE TABLE board( 
    no NUMBER,
    title VARCHAR2(500) NOT NULL,
    content VARCHAR2(4000),
    hit NUMBER,
    reg_date DATE NOT NULL,
    user_no NUMBER NOT NULL,
    PRIMARY KEY(no),
    CONSTRAINT board_fk
    FOREIGN KEY(user_no)
    REFERENCES users(no)
);

--시퀀스 삭제
DROP SEQUENCE seq_board_no; 
--시퀀스 생성
CREATE SEQUENCE seq_board_no INCREMENT BY 1 START WITH 1;

--insert 예문
INSERT INTO board VALUES(
    seq_board_no.NEXTVAL,
    '안녕하세요',
    '반갑습니다',
    0,
    sysdate,
    1
);

--테이블 확인
SELECT * FROM board;
SELECT * FROM users;

--getList 확인
SELECT
    board.no no,
    title,
    hit,
    TO_CHAR(reg_date,'yy/mm/dd hh24:mi:ss')reg_date,
    user_no,
    users.name name
FROM
    users,
    board
WHERE board.user_no = users.no
ORDER BY reg_date DESC;
-- delete 확인
DELETE FROM board 
WHERE no = 6
  AND user_no = 6;
--getBoard 확인
 SELECT 
    users.name name,
    hit, 
    TO_CHAR(reg_date,'yy/mm/dd') reg_date, 
    title, 
    content, 
    user_no,
    board.no no
FROM 
    users, 
    board 
 WHERE board.user_no = users.no 
   AND board.no = 21; 
--modify 확인
UPDATE board SET title = '메롱', content = '' WHERE no = 25;
--insert 확인
INSERT INTO board VALUES(seq_board_no.NEXTVAL, '안녕하세요', '반갑습니다', 0, sysdate, 6);
--hit 확인
UPDATE board SET hit = 1
WHERE board.no = 47;
--search 확인
SELECT
    board.no no,
    title,
    hit,
    TO_CHAR(reg_date,'yy/mm/dd hh24:mi:ss')reg_date,
    user_no,
    users.name name
FROM
    users,
    board
WHERE board.user_no = users.no
  AND (title like '%영%' or users.name like '%영%')
ORDER BY reg_date DESC;
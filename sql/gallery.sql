--table create, drop
DROP TABLE gallery;
CREATE TABLE gallery(
     no NUMBER
    ,user_no NUMBER
    ,content VARCHAR2(1000)
    ,file_path VARCHAR2(500)
    ,org_name VARCHAR2(200)
    ,save_name VARCHAR2(500)
    ,file_size NUMBER
    ,PRIMARY KEY(no)
    ,CONSTRAINT gallery_fk FOREIGN KEY(user_no)
    REFERENCES users(no)
);

--sequence create, drop
DROP SEQUENCE seq_gallery_no;
CREATE SEQUENCE seq_gallery_no INCREMENT BY 1 START WITH 1 NOCACHE;

--insert
INSERT INTO gallery (
                 no
                ,user_no
                ,content
                ,file_path
                ,org_name
                ,save_name
                ,file_size
			)
			VALUES(
                seq_gallery_no.NEXTVAL
                ,1
                , null
                ,'C:\JavaStudy\upload\162814932409351a7845e-0a53-4d6a-ae8b-c8e144098759.jpg'
				,'Jeongjae-Lee.jpg'
				,'162814932409351a7845e-0a53-4d6a-ae8b-c8e144098759.jpg'
				,92457
			);
--확인
SELECT
    *
FROM
    gallery;

--delete  
DELETE FROM gallery
WHERE no = 3;

--selectList
SELECT
    save_name
    ,users.name
    ,gallery.no
FROM
    gallery
    ,users
WHERE gallery.user_no = users.no
ORDER BY gallery.no DESC;

--selectOne
SELECT
     save_name
    ,content
	,no
	,user_no
FROM
    gallery
WHERE no = 3;
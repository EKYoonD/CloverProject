SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Payment_Table;
DROP TABLE IF EXISTS Order_Table;
DROP TABLE IF EXISTS QR_Table;
DROP TABLE IF EXISTS Rep_Write_Table;
DROP TABLE IF EXISTS Write_Table;
DROP TABLE IF EXISTS User_Table;
DROP TABLE IF EXISTS User_Authority;

SHOW tables;

/* Create Tables */

CREATE TABLE Order_Table
(
	order_uid int NOT NULL AUTO_INCREMENT,
	order_total_price int NOT NULL,
	order_address varchar(30) NOT NULL,
	order_state varchar(15) NOT NULL,
	order_amount int NOT NULL,
	order_date datetime NOT NULL DEFAULT now(),
	qr_uid int NOT NULL,
	user_uid int NOT NULL,
	PRIMARY KEY (order_uid)
);


CREATE TABLE Payment_Table
(
	payment_uid int NOT NULL AUTO_INCREMENT,
	payment_category varchar(15) NOT NULL,
	order_total_price int NOT NULL,
	payment_date datetime NOT NULL DEFAULT now(),
	order_uid int NOT NULL,
	PRIMARY KEY (payment_uid)
);


CREATE TABLE QR_Table
(
	qr_uid int NOT NULL AUTO_INCREMENT,
	qr_category varchar(10) NOT NULL,
	qr_name varchar(10) NOT NULL,
	qr_age int NOT NULL,
	qr_address varchar(30) NOT NULL,
	qr_phone varchar(15) NOT NULL,
	qr_content text,
	qr_image_path varchar(500),
	qr_url varchar(100),
	user_uid int NOT NULL,
	PRIMARY KEY (qr_uid)
);

DROP TABLE rep_write_table;

CREATE TABLE Rep_Write_Table
(
	wr_rep_uid int NOT NULL AUTO_INCREMENT,
	wr_longitude float,
	wr_latitude float,
	wr_subject varchar(100) NOT NULL,
	wr_content text,
	wr_regdate datetime DEFAULT now(),
	wr_img_path varchar(100),
	wr_uid int NOT NULL,
	user_uid int NOT NULL,
	PRIMARY KEY (wr_rep_uid)
);


CREATE TABLE User_Table
(
	user_uid int NOT NULL AUTO_INCREMENT,
	user_id varchar(20) NOT NULL,
	user_pw varchar(256) NOT NULL,
	user_name varchar(10) NOT NULL,
	user_address varchar(320) NOT NULL,
	user_email varchar(80) NOT NULL,
	user_phone varchar(12) NOT NULL,
	PRIMARY KEY (user_uid),
	UNIQUE (user_id)
);

CREATE table User_Authority (
	user_id varchar(50) REFERENCES test_member(user_id),
	user_auth varchar(50) NOT NULL,        -- 시큐리티의 authority
	PRIMARY KEY (user_id, user_auth)
)


CREATE TABLE Write_Table
(
	wr_uid int NOT NULL AUTO_INCREMENT,
	wr_category varchar(15) NOT NULL,
	wr_content text,
	wr_viewcnt int DEFAULT 0,
	wr_subject varchar(20) NOT NULL,
	wr_regdate datetime DEFAULT now(),
	wr_longitude float,
	wr_latitude float,
	user_uid int NOT NULL,
	PRIMARY KEY (wr_uid)
);

SHOW tables;

/* Create Foreign Keys */

ALTER TABLE Payment_Table
	ADD FOREIGN KEY (order_uid)
	REFERENCES Order_Table (order_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Order_Table
	ADD FOREIGN KEY (qr_uid)
	REFERENCES QR_Table (qr_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Order_Table
	ADD FOREIGN KEY (user_uid)
	REFERENCES User_Table (user_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE QR_Table
	ADD FOREIGN KEY (user_uid)
	REFERENCES User_Table (user_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Write_Table
	ADD FOREIGN KEY (user_uid)
	REFERENCES User_Table (user_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Rep_Write_Table
	ADD FOREIGN KEY (wr_uid)
	REFERENCES Write_Table (wr_uid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

ALTER TABLE rep_write_table
	ADD FOREIGN KEY (user_uid)
	REFERENCES user_table(user_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;

DESC write_table;
SELECT * FROM user_table;
SELECT * FROM qr_table;
SHOW tables;
SELECT * FROM information_schema.table_constraints;
SELECT * FROM write_table ORDER BY wr_uid desc;
DELETE FROM write_table WHERE wr_uid = 10;
DELETE FROM rep_write_table;

DELETE FROM write_table WHERE wr_uid = 40 CASCADE ; 

INSERT INTO write_table(wr_category, wr_subject, wr_content, wr_longitude, wr_latitude, user_uid) 
values('부모님','찾아주세요', '내용없음', 127.123124, 37.123125, 1);

SELECT wt.wr_uid uid, ut.user_name name, wt.wr_category, wt.wr_subject, wt.wr_content, wt.wr_longitude, wt.wr_latitude 
FROM user_table ut, write_table wt WHERE ut.user_uid = wt.user_uid AND wt.wr_uid = 15;

SELECT wt.wr_uid, ut.user_name, wt.wr_category, wt.wr_subject, wt.wr_content, wt.wr_longitude, wt.wr_latitude 
FROM user_table ut, write_table wt WHERE wt.user_uid = ut.user_uid ORDER BY wr_uid desc;

INSERT INTO write_table(wr_category, wr_subject, wr_content, wr_latitude, wr_longitude, user_uid) 
		VALUES('부모님', '찾아주세요', '네',  37.123125, 127.123124, (SELECT user_uid FROM user_table WHERE user_id='katie'));
SELECT user_uid FROM user_table WHERE user_id='katie'

SELECT * FROM rep_write_table;
<<<<<<< HEAD
INSERT INTO rep_write_table (wr_longitude, wr_latitude, wr_content, wr_uid, user_uid) 
VALUES (127.123124, 37.123125, '여기서 찾았어요', 40, 1);

SELECT wr_rep_uid rep_uid, wr_latitude latitude, wr_longitude longitude, wr_subject subject, wr_content content, wr_regdate regdate, wr_uid uid
FROM rep_write_table WHERE wr_rep_uid = 5;

SELECT rwt.wr_rep_uid rep_uid, rwt.wr_content content, wt.wr_uid uid,  
			rwt.wr_regdate regDate , rwt.wr_longitude longitude, rwt.wr_latitude latitude, rwt.wr_img_path imgPath 
FROM write_table wt, rep_write_table rwt WHERE wt.wr_uid = rwt.wr_uid  AND rwt.wr_uid = 40 AND rwt.user_uid = 1;

INSERT INTO rep_write_table (wr_longitude, wr_latitude, wr_subject, wr_uid, user_uid) 
VALUES (127.123124, 37.123125, '여기서 찾았어요', 42, (SELECT user_uid FROM user_table WHERE user_id = 'katie'));


DELETE FROM
			rep_write_table
		WHERE
			wr_rep_uid = 5;
		
INSERT INTO rep_write_table (wr_longitude, wr_latitude, wr_content, wr_uid) 
VALUES (127.123124, 37.123125, '여기서 찾았어요', 40);

ALTER TABLE qr_table DROP COLUMN qr_subject;
ALTER TABLE qr_table DROP COLUMN qr_url;

SELECT * FROM qr_table;
INSERT INTO QR_Table
			(qr_name, qr_category, qr_age, qr_address, qr_phone, qr_content, user_uid)
		VALUES
			('신현담', '부모님', 30, '서울', '01062423233', '찾아주세요',  (SELECT user_uid FROM user_table WHERE user_id = 'shdking'));
SELECT user_uid FROM user_table WHERE user_id = 'shdking';
INSERT INTO QR_Table
			(qr_name, qr_category, qr_age, qr_address, qr_phone, qr_content, user_uid)
		VALUES
			('신현담', '부모님', 30, '서울', '01062423233', '찾아주세요',  (SELECT user_uid FROM user_table WHERE user_id = 'shdking'));
			
CREATE table 
(
	wr_uid int NOT NULL AUTO_INCREMENT,
	wr_category varchar(15) NOT NULL,
	wr_content text,
	wr_viewcnt int DEFAULT 0,
	wr_subject varchar(20) NOT NULL,
	wr_regdate datetime DEFAULT now(),
	wr_longitude float,
	wr_latitude float,
	user_uid int NOT NULL,
	PRIMARY KEY (wr_uid)
);
		
		
		
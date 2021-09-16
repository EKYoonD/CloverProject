SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Payment_Table;
DROP TABLE IF EXISTS Order_Table;
DROP TABLE IF EXISTS QR_Table;
DROP TABLE IF EXISTS Rep_Write_Table;
DROP TABLE IF EXISTS Write_Table;
DROP TABLE IF EXISTS User_Table;


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
	qr_subject varchar(20) NOT NULL,
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


CREATE TABLE Rep_Write_Table
(
	wr_rep_uid int NOT NULL AUTO_INCREMENT,
	wr_map decimal,
	wr_content text NOT NULL,
	wr_regdate datetime DEFAULT now(),
	wr_img_path varchar(100),
	wr_uid int NOT NULL,
	PRIMARY KEY (wr_rep_uid)
);


CREATE TABLE User_Table
(
	user_uid int NOT NULL AUTO_INCREMENT,
	user_id varchar(20) NOT NULL,
	user_name varchar(10) NOT NULL,
	user_address varchar(20) NOT NULL,
	user_email varchar(20) NOT NULL,
	user_phone varchar(20) NOT NULL,
	PRIMARY KEY (user_uid),
	UNIQUE (user_id)
);


CREATE TABLE Write_Table
(
	wr_uid int NOT NULL AUTO_INCREMENT,
	wr_category varchar(15) NOT NULL,
	wr_name varchar(20) NOT NULL,
	wr_content text,
	wr_viewcnt int,
	wr_subject varchar(20) NOT NULL,
	wr_regdate datetime DEFAULT now(),
	wr_map decimal,
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
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


SHOW tables;
SELECT * FROM information_schema.table_constraints;
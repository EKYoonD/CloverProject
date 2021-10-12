SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Payment_Table;
DROP TABLE IF EXISTS Order_Table;
DROP TABLE IF EXISTS addorder;
DROP TABLE IF EXISTS QR_Table;
DROP TABLE IF EXISTS Rep_Write_Table;
DROP TABLE IF EXISTS Write_Table;
DROP TABLE IF EXISTS userdto;
drop table if exists user_table;
DROP TABLE IF EXISTS user_authority;

SHOW tables;

/* Create Tables */
/*
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
*/

 create table addOrder(
      partner_order_id int not null auto_increment,
      order_Rec varchar(30) not null,
      order_Phone varchar(30) not null,
      quantity int not null,
      total_amount int not null,
      address varchar(30) not null,
      qr_option varchar(10),
      qr_uid int not null,
      user_id varchar(30) not null,
      primary key (partner_order_id)
      
);

select * from qr_table qt ;
select * from userdto u ;
desc addorder ;


select * from addorder;


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


CREATE TABLE userdto 
(
	user_uid int NOT NULL AUTO_INCREMENT,
	user_id varchar(80) not null,
	user_pw varchar(256) ,
	user_name varchar(10) NOT NULL,
	user_address varchar(320) ,
	user_email varchar(80) NOT NULL,
	user_phone varchar(12),
	user_picture varchar(100),
	user_role varchar(50),
	PRIMARY KEY (user_uid),
	UNIQUE (user_id)
);

SELECT
			user_uid uid, 
			user_id id,
			user_pw pw,
			user_name name,
			user_address address,
			user_email email,
			user_phone phone
		FROM 
			userdto
		ORDER BY 
			user_uid DESC
		LIMIT 1, 5;

select * from userdto;


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

ALTER TABLE write_table ADD wr_img_path varchar(200);
SELECT * FROM rep_write_table wt;

/* Create Foreign Keys */

ALTER TABLE addOrder
	ADD FOREIGN KEY (qr_uid)
	REFERENCES QR_Table (qr_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;

ALTER TABLE addOrder
	ADD FOREIGN KEY (user_id)
	REFERENCES userdto (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;
/*
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
*/

ALTER TABLE Order_Table
	ADD FOREIGN KEY (user_uid)
	REFERENCES userdto (user_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE QR_Table
	ADD FOREIGN KEY (user_uid)
	REFERENCES userdto (user_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Write_Table
	ADD FOREIGN KEY (user_uid)
	REFERENCES userdto (user_uid)
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
	REFERENCES userdto(user_uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;

SELECT * FROM userdto;
SELECT user_uid FROM userdto WHERE user_id='dbswlckd1';

SELECT * FROM qr_table;

SELECT 
			qr_uid "uid", 
			qr_name name, 
			qr_category category,
			qr_age age, 
			qr_address address,
			qr_phone phone,
			qr_content content 
		FROM 
			QR_Table
		WHERE user_uid = (SELECT user_uid FROM userdto WHERE user_id="1939890767");
SELECT * FROM userdto;
	SELECT
			user_uid uid,
			user_id id, 
			user_pw pw,  
			user_name name, 
			user_address address, 
			user_email email, 
			user_phone phone
		FROM userdto
		WHERE user_id = "katie0323";
	


insert into userdto values(100,'admin','$2a$12$ngzHgtGjfBxnAMbOdO8Mbukx.wicNK/17mVs8sZCreL9tStkWD8k.','관리자',null,'admin@adamin.com',null,null,'ROLE_ADMIN' )
package com.clover.spring.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonProperty;

public class WriteReDTO {
//	CREATE TABLE test_write_Rep
//	(
//		wr_rep_uid int NOT NULL AUTO_INCREMENT,
//		wr_content text NOT NULL,
//		wr_regdate datetime DEFAULT now(),
//		wr_longitude float,
//		wr_latitude float,
//		wr_img_path varchar(100),
//		wr_uid int NOT NULL,
//		PRIMARY KEY (wr_rep_uid)
//	)
	
	private int rep_uid;
	private String content;
	private String subject;
	private LocalDateTime regDate;  // wr_regdate
	private float longitude;
	private float latitude;
	private String imagePath;
	private int uid;
	private String userid;
	
	public WriteReDTO(int rep_uid, String content, String subject, LocalDateTime regDate, float longitude, float latitude,
			String imagePath, int uid, String userid) {
		super();
		this.rep_uid = rep_uid;
		this.content = content;
		this.regDate = regDate;
		this.longitude = longitude;
		this.latitude = latitude;
		this.imagePath = imagePath;
		this.uid = uid;
		this.userid = userid;
		this.subject = subject;
	}
	
	public WriteReDTO() {
		super();
	}
	
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getRep_uid() {
		return rep_uid;
	}
	public void setRep_uid(int rep_uid) {
		this.rep_uid = rep_uid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	@JsonProperty("regdate")
	public String getRegDateTime() {
		if(this.regDate == null) return "";
		return this.regDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss"));
	}
	
	
}

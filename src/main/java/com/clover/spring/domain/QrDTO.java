package com.clover.spring.domain;

public class QrDTO {
	private int uid;   
	private String name;  
	private String category;
	private int age;  
	private String address;
	private String phone;
	private String content;  
	private String userid;
	

	// 웹개발시...
	// 가능한, 다음 3가지는 이름을 일치시켜주는게 좋습니다.
	// 클래스 필드명 = DB 필드명 = form의 name명	
	
	public QrDTO() {
		super();

	}


	public QrDTO(int uid, String name, String category, int age, String address, String phone, String content, String userid) {
		super();
		this.uid = uid;
		this.name = name;
		this.category = category;
		this.age = age;
		this.address = address; 
		this.phone = phone;
		this.content = content;
		this.userid = userid;

	}
	
	


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public String getName() {
		return name;
	}
	

	public void setName(String name) {
		this.name = name;
	}
	
	public String getCategory() {
		return category;
	}
	

	public void setCategory(String category) {
		this.category = category;
	}


	public  int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}

	public  String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public  String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	
	
	
	@Override
	public String toString() {
		return String.format("QrDTO] %d : %s : %s : %d : %s : %s : %s : %s  ", 
				uid, name, category, age, address, phone, content, userid);
	}
	

	
}






















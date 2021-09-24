package com.clover.spring.domain;

public class UserDTO {
	private int uid; 
	private String id; 
	private String pw;
	private String name; 
	private String address; 
	private String email; 
	private String phone;
	
	public UserDTO() {
		super();
	}

	public UserDTO(int uid, String id, String pw, String name, String address, String email, String phone) {
		super();
		this.uid = uid;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.address = address;
		this.email = email;
		this.phone = phone;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "UserDTO [uid=" + uid + ", id=" + id + ", pw=" + pw + ", name=" + name + ", address=" + address
				+ ", email=" + email + ", phone=" + phone + "]";
	}
	

}

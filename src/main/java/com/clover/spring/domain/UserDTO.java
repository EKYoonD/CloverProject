package com.clover.spring.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class UserDTO {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_uid")
	private int uid;
	@Column(name="user_id")
	private String id; // user_id
	@Column(name="user_pw")
	private String pw; // user_pw
	@Column(name="user_name")
	private String name; // user_name
	@Column(name="user_phone")
	private String phone; // user_phone
	@Column(name="user_email")
	private String email; // user_email
	@Column(name="user_address")
	private String address; // user_addr
	@Column(name="user_picture")
	private String picture; // user_picture
	@Column(name="user_role")
	private String role = "ROLE_USER";
	
	public UserDTO(String name, String email, String picture, String phone) {
		this.name = name;
		this.email = email;
		this.picture = picture;		
		this.phone = phone;
	}

	public UserDTO update(String name, String picture, String phone) {
		this.name = name;
		this.picture = picture;
		this.phone = phone;
		return this;
	}
	
	@Override
	public String toString() {
		return String.format("%s %s", email, pw);
	}
}
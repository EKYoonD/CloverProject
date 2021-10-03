package com.clover.spring.kakao;

import java.io.Serializable;

import com.clover.spring.kakao.User;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SessionUser implements Serializable {

	private String name;
	private String email;
	private String picture;
	
	public SessionUser(User user) {
		this.name = user.getName();
		this.email = user.getEmail();
		this.picture = user.getPicture();
	}
	
	public SessionUser() {
		
	}

}

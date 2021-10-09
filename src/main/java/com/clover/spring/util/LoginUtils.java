package com.clover.spring.util;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;

public class LoginUtils {

	/**
	 * 사용자 아이디 추출
	 * 
	 * @param userObject 사용자 인증 객체
	 * @return 사용자 아이디
	 */
	public static String getUserId(Object userObject) {
		if (userObject instanceof DefaultOAuth2User) {
			DefaultOAuth2User user = (DefaultOAuth2User) userObject;
			return user.getName();
		} else {
			UserDetails user = (UserDetails) userObject;
			return user.getUsername();
		}
	}
	
}
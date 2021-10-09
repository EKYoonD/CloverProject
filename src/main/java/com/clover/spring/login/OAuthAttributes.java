package com.clover.spring.login;

import java.util.Map;

import com.clover.spring.domain.UserDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OAuthAttributes {
	private Map<String, Object> attributes;
	private String nameAttributeKey;
	private String id;
	private String name;
	private String email;
	private String phone;
	private String picture;

	public OAuthAttributes(Map<String, Object> attributes, String nameAttributeKey,
			String id,String name, String email, String picture, String phone) {
		this.attributes = attributes;
		this.nameAttributeKey = nameAttributeKey;
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.picture = picture;
	}
	
	public OAuthAttributes() {
	}

	
	// 로그인 서비스가 kakao인지 naver인지 google인지 구분하여 매핑
	// registrationId <- OAuth2 로그인을 처리한 서비스명("google","kakao","naver")
	// userNameAttributeName <- 해당 서비스의 map의 키 값. {google="sub", kakao="id", naver="response"}
	public static OAuthAttributes of(String registrationId, String userNameAttributeName, Map<String, Object> attributes) {
		if (registrationId.equals("kakao")) {
			return ofKakao(userNameAttributeName, attributes);
		} else if (registrationId.equals("naver")) {
			return ofNaver(userNameAttributeName, attributes);
		}
		return ofGoogle(userNameAttributeName, attributes);
	}
	
	// Kakao
	private static OAuthAttributes ofKakao(String userNameAttributeName, Map<String, Object> attributes) {
		Map<String, Object> kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
		Map<String, Object> profile = (Map<String, Object>) kakaoAccount.get("profile");
		
		return new OAuthAttributes(attributes, userNameAttributeName, String.valueOf(attributes.get(userNameAttributeName)), (String) profile.get("nickname"),
				(String) kakaoAccount.get("email"), (String) profile.get("profile_image_url"), null);
	}
	
	// Naver
	private static OAuthAttributes ofNaver(String userNameAttributeName, Map<String, Object> attributes) {
		Map<String, Object> response = (Map<String, Object>) attributes.get("response");
		
		return new OAuthAttributes(attributes, userNameAttributeName, (String) response.get("email"),(String) response.get("name"),
				(String) response.get("email"), (String) response.get("profile_image"), (String) response.get("mobile"));
	}
	
	// Google
	private static OAuthAttributes ofGoogle(String userNameAttributeName, Map<String, Object> attributes) {
		
		return new OAuthAttributes(attributes, userNameAttributeName, (String) attributes.get("email"),(String) attributes.get("name"),
				(String) attributes.get("email"), (String) attributes.get("picture"), null);
	}
	
	public UserDTO toEntity() {
		return new UserDTO(id, name, email, picture, phone);
	}

	
}

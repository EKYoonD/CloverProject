package com.clover.spring.login;

import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.clover.spring.config.PrincipalDetails;
import com.clover.spring.login.OAuthAttributes;
import com.clover.spring.domain.UserDTO;

@Service
public class CustomOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private HttpSession httpSession;

	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		OAuth2UserService oAuth2UserService = new DefaultOAuth2UserService();
		OAuth2User oAuth2User = oAuth2UserService.loadUser(userRequest);

		// 현재 진행 중인 서비스를 구분
		// oAuth2UserRequest.getClientRegistration().getRegistrationId() <-
		// {registrationId='naver'}
		String registrationId = userRequest.getClientRegistration().getRegistrationId();

		// OAuth2 로그인 시 키 값. 구글="sub", 네이버="response", 카카오="id"
		String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint()
				.getUserNameAttributeName();

		// OAuth2 로그인을 통해 가져온 OAuth2User의 attribute를 담아주는 of 메소드.
		OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributeName,
				oAuth2User.getAttributes());

		UserDTO user = saveOrUpdate(attributes);
		httpSession.setAttribute("user", new SessionUser(user));

		return new DefaultOAuth2User(Collections.singleton(new SimpleGrantedAuthority("ROLE_USER")),
				attributes.getAttributes(), attributes.getNameAttributeKey());
	}

	// 이미 저장된 정보라면, update 처리
	private UserDTO saveOrUpdate(OAuthAttributes attributes) {
		UserDTO user = userRepository.findById(attributes.getId()).map(entity -> entity.update(attributes.getId(),
				attributes.getName(), attributes.getPicture(), attributes.getPhone())).orElse(attributes.toEntity());

		return userRepository.save(user);
	}

}

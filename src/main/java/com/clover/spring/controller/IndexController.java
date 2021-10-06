package com.clover.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clover.spring.domain.UserDTO;
import com.clover.spring.service.UserService;

@Controller
public class IndexController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	@RequestMapping("/main")
	public String Main() {
		return "main";
	}
	
	@RequestMapping("/about")
	public String About() {
		return "about";
	}
	
	// Spring Security(이하 '시큐리티') 가 적용되면
	// /login 등의 url 로의 request 를  시큐리티가 모두 낚아 챕니다.
	// 나중에 SecurityConfig 가 설정되면 낚아 채지 않게 된다.
	@GetMapping("/login2")
	public String login() {
		return "user/loginForm";
	}
	
	@GetMapping("/join")
	public String join() {
		return "user/joinForm";
	}
	
	
	
	@PostMapping("/joinOk")
	public String joinOk(UserDTO user) {
		System.out.println(user);
		
		String rawPassword = user.getPw();
		String encPassword = passwordEncoder.encode(rawPassword);
		user.setPw(encPassword);
		
		int cnt = userService.addUser(user);
		
		
		return "redirect:login2";
	}
	

}

















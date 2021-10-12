package com.clover.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.clover.spring.domain.KakaoPayApprovalVO;
import com.clover.spring.domain.UserDTO;
import com.clover.spring.service.KakaoPayService;
import com.clover.spring.service.UserService;

import lombok.extern.java.Log;

@Log
@Controller
@SessionAttributes("partner_order_id")
public class IndexController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	KakaoPayService kakaoPaySerivce; 
	
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
	
	@GetMapping("/clover/admin/main")
	public String admintest() {
		return "admin/adminMain";
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
	
	 @GetMapping("/kakaoPaySuccess") // 결제 성공
	    public void kakaoPaySuccess(@RequestParam("pg_token" ) String pg_token, Model model, HttpSession session) {
		 	int partner_order_id = (int)session.getAttribute("partner_order_id");   
		 	log.info("kakaoPaySuccess get............................................");
	        log.info("kakaoPaySuccess pg_token : " + pg_token);
	        
//	        model.addAttribute("info", KakaoPayService.kakaoPayInfo(pg_token, partner_order_id));
//	        
//	        log.info(model);
//	        KakaoPayApprovalVO kakaoPayInfo = kakaoPaySerivce.kakaoPayInfo(pg_token, partner_order_id);
//			model.addAttribute("info", kakaoPayInfo);        
	
//	        model.addAttribute("info", KakaoPayService.selectUidByUid(partner_order_id));
//	        model.addAttribute("info", KakaoPayService.selectByUid(partner_order_id));
//	        model.addAttribute("info", KakaoPayService.kakaoPayInfo(pg_token, partner_order_id));
			
			
	    }
	 
	 
	 @GetMapping("/kakaoPaySuccessFail") //결제실패
	 public String KakaoPaySuccessFail() {
		 return "/kakaoPaySuccessFail";
	 }
	
	

}

package com.clover.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.clover.spring.service.UserService;
import com.clover.spring.util.LoginUtils;



@Controller
@RequestMapping("clover/member")
public class MemberController {
	
	@Autowired
	UserService userService;
	
	
	@GetMapping("/mypage")
	public String mypage(Model model, Authentication authentication, RedirectAttributes redirectAttributes) {
		
//		UserDTO dto = new UserDTO();
		String id = LoginUtils.getUserId(authentication.getPrincipal());
		System.out.println(id);
//		dto.setId(id);
		model.addAttribute("list", userService.findById(id));
		
		return "user/userPage";
	}
	

}

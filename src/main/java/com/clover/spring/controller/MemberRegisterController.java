package com.clover.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clover.spring.domain.UserDTO;
import com.clover.spring.service.UserService;

@Controller
public class MemberRegisterController {

	@Autowired
	private UserService userService;

	public MemberRegisterController() {
		System.out.println("MemberRegisterController() 생성");
	}

	// Join page
//	@RequestMapping(value = "/join", method = RequestMethod.GET)
//	public void registerGET() throws Exception {
//
//	}
	
	@GetMapping("/join")
	public String join() {
		return "user/joinForm";
	}

	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(String id) throws Exception {
		int result = userService.idCheck(id);
		return result;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String registerPOST(UserDTO user, String id) throws Exception {
		int idResult = userService.idCheck(id);

		try {
			if (idResult == 1) {
				return "/join";
			} else if (idResult == 0) {
				userService.addUser(user);
				return "redirect:/login2";
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/main";
	}

}

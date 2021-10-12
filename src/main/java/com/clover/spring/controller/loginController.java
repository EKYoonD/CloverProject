package com.clover.spring.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.clover.spring.domain.UserDTO;
import com.clover.spring.service.UserService;

@Controller
public class loginController {
	
	@PostMapping("/loginOk")
	public String loginOk() {
	
		return "redirect:main";
	}
}

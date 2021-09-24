package com.clover.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sample/**")
public class SampleController {

	@GetMapping("/all/**")
	@ResponseBody
	public String doAll() {
		return "<h1>/all/** : 누구나 접근 가능</h1>";
	}

	@GetMapping("/user/**")
	@ResponseBody
	public String doUser() {
		return "<h1>/user/** : 로그인 한 사람만 접근 가능</h1>";
	}

	@GetMapping("/member/**")
	@ResponseBody
	public String doMember() {
		return "<h1>/member/** : 로그인 한 사람중 'ROLE_MEMBER' 나 'ROLE_ADMIN' 권한가진 사람만 접근 가능</h1>";
	}

	@GetMapping("/admin/**")
	@ResponseBody
	public String doAdmin() {
		return "<h1>/admin/** : 로그인 한 사람중 'ROLE_ADMIN' 권한가진 사람만 접근 가능</h1>";
	}
	
	
}













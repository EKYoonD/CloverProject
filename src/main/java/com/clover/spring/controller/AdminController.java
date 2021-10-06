package com.clover.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clover.spring.service.AdminService;

@Controller
@RequestMapping("ad")
public class AdminController {
//	1. adminQR
//	2. adminUser
//	3. adminBoard
//	4. adminOrder
	
	@Autowired
	private AdminService adminService;

	public void setBoardService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	public AdminController() {	// 생성자
		System.out.println("AdminController() 생성");
	}
	
	@RequestMapping("/qrlist")
	public String qrlist() {
		return "admin/qrlist";
	}
	
	@RequestMapping("/userlist")
	public String userlist() {
		return "admin/qrlist";
	}
	
	@RequestMapping("/boardlist")
	public String boardlist() {
		return "admin/boardlist";
	}
	
	@RequestMapping("/orderlist")
	public String orderlist() {
		return "admin/orderlist";
	}

}

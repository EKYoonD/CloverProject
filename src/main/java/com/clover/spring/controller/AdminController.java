package com.clover.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clover.spring.service.AdminService;

@Controller
@RequestMapping("/clover/admin")
public class AdminController {
//	1. adminQR
//	2. adminUser
//	3. adminBoard
//	4. adminOrder
	
	private AdminService adminService;

	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	public AdminController() {	// 생성자
		System.out.println("AdminController() 생성");
	}
	
	@RequestMapping("/user/userlist")
	public String userlist() {
		return "admin/userlist";
	}
	
	@RequestMapping("/qr/qrlist")
	public String qrlist() {
		return "admin/qrlist";
	}
	
	@RequestMapping("/board/boardlist")
	public String boardlist() {
		return "admin/boardlist";
	}
	
	@RequestMapping("/order/orderlist")
	public String orderlist() {
		return "admin/orderlist";
	}
}

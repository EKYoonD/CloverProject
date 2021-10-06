package com.clover.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clover.spring.domain.QrDAO;
import com.clover.spring.domain.UserDAO;
import com.clover.spring.domain.UserDTO;
import com.clover.spring.domain.WriteDAO;
import com.clover.spring.domain.WriteReDAO;

@Service
public class AdminService {
	
	@Autowired
	UserDAO udao;
	@Autowired
	WriteDAO wrdao;
	@Autowired
	WriteReDAO wrredao;
	@Autowired
	QrDAO qrdao;
	

	public AdminService() {
		System.out.println("AdminService() 생성");
	}
	
	List<UserDTO> selectAll(){
		return udao.selectAll();
	}

}

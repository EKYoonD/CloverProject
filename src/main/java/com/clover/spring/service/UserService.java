package com.clover.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clover.spring.domain.UserDAO;
import com.clover.spring.domain.UserDTO;

@Service
public class UserService {
	
	@Autowired
	UserDAO dao;
	
	public UserService() {
		System.out.println("UserService() 생성");
	}
	
	// 회원가입
	// ROLE_MEMBER 권한 부여
	@Transactional
	public int addMember(UserDTO user) {
		int cnt = dao.addUser(user);
		dao.addAuth(user.getId(), "ROLE_MEMBER");
		return cnt;
	}
	
	// 회원삭제
	@Transactional
	public int deleteMember(UserDTO user) {
		dao.deleteAuths(user.getId());  // 권한(들) 먼저 삭제
		int cnt = dao.deleteUser(user);
		return cnt;
	}
	
	// 특정 id(username) 의 정보 가져오기
	public UserDTO findById(String id) {
		return dao.findById(id);
	}
	
	// 특정 id 의 권한(들) 정보 가져오기
	public List<String> selectAuthoritiesById(String id){
		return dao.selectAuthoritiesById(id);
	}
}





















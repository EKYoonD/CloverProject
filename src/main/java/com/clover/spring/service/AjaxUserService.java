package com.clover.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clover.spring.domain.AjaxDAO;
import com.clover.spring.domain.AjaxUserDAO;
import com.clover.spring.domain.UserDTO;
import com.clover.spring.domain.WriteDTO;

@Service
public class AjaxUserService {
	
	AjaxUserDAO dao;
	
	@Autowired
	public void setDao(AjaxUserDAO dao) {
		this.dao = dao;
	}

	public List<UserDTO> list(int from, int pageRows) {
		return dao.selectFromRow(from, pageRows);		
	}
	
	public int count() {
		return dao.countAll();
	}
	
	public List<UserDTO> viewByUid(int uid) {
		// ※ 트랜잭션 처리해야 한다.
		return dao.selectByUid(uid);
	}
	
	public int write(UserDTO dto) {
		return dao.insert(dto); 
	}
	
	public int update(UserDTO dto) {
		return dao.update(dto);
	}
	
	public int deleteByUid(int [] uids) {// 복수개의 uid (들)		
		return dao.deleteByUid(uids);
	}
	
	public List<UserDTO> selectByUid(int uid) {
		return dao.selectByUid(uid);  // 1개짜리 글도 List<> 로 리턴
	}
	
	
}

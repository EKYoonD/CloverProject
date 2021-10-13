package com.clover.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clover.spring.domain.AjaxBoardDAO;
import com.clover.spring.domain.AjaxBoardRepDAO;
import com.clover.spring.domain.AjaxDAO;
import com.clover.spring.domain.AjaxUserDAO;
import com.clover.spring.domain.UserDTO;
import com.clover.spring.domain.WriteDTO;
import com.clover.spring.domain.WriteReDTO;

@Service
public class AjaxBoardRepService {
	
	AjaxBoardRepDAO dao;
	
	@Autowired
	public void setDao(AjaxBoardRepDAO dao) {
		this.dao = dao;
	}

	public List<WriteReDTO> list(int from, int pageRows) {
		return dao.selectFromRow(from, pageRows);		
	}
		
	public int countByUid(int uid) {
		return dao.countByUid(uid);
	}
	
	public int count() {
		return dao.countAll();
	}
	
	public List<WriteReDTO> viewByUid(int uid) {
		// ※ 트랜잭션 처리해야 한다.
		return dao.selectByUid(uid);
	}
	
	public int write(WriteReDTO dto) {
		return dao.insert(dto); 
	}
	
	public int update(WriteReDTO dto) {
		return dao.update(dto);
	}
	
	public int deleteByUid(int [] uids) {// 복수개의 uid (들)		
		return dao.deleteByUid(uids);
	}
	
	public List<WriteReDTO> selectByUid(int uid) {
		return dao.selectByUid(uid);  // 1개짜리 글도 List<> 로 리턴
	}
	
	
}

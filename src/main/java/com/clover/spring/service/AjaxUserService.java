package com.clover.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clover.spring.domain.AjaxDAO;
import com.clover.spring.domain.WriteDTO;

@Service
public class AjaxUserService {
	
	AjaxDAO dao;
	
	@Autowired
	public void setDao(AjaxDAO dao) {
		this.dao = dao;
	}

	public List<WriteDTO> list(int from, int pageRows) {
		return dao.selectFromRow(from, pageRows);		
	}
	
	public int count() {
		return dao.countAll();
	}
	
	public List<WriteDTO> viewByUid(int uid) {
		// ※ 트랜잭션 처리해야 한다.
		dao.incViewCnt(uid);
		return dao.selectByUid(uid);
	}
	
	public int write(WriteDTO dto) {
		return dao.insert(dto); 
	}
	
	public int update(WriteDTO dto) {
		return dao.update(dto);
	}
	
	public int deleteByUid(int [] uids) {// 복수개의 uid (들)		
		return dao.deleteByUid(uids);
	}
	
	public List<WriteDTO> selectByUid(int uid) {
		return dao.selectByUid(uid);  // 1개짜리 글도 List<> 로 리턴
	}
	
	
}

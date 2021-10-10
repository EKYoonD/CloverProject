package com.clover.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clover.spring.domain.AjaxQrDAO;
import com.clover.spring.domain.QrDTO;

@Service
public class AjaxQrService {
	
	AjaxQrDAO dao;
	
	@Autowired
	public void setDao(AjaxQrDAO dao) {
		this.dao = dao;
	}

	public List<QrDTO> list(int from, int pageRows) {
		return dao.selectFromRow(from, pageRows);		
	}
	
	public int count() {
		return dao.countAll();
	}
	
	public List<QrDTO> viewByUid(int uid) {
		// ※ 트랜잭션 처리해야 한다.
		return dao.selectByUid(uid);
	}
	
	public int write(QrDTO dto) {
		return dao.insert(dto); 
	}
	
	public int update(QrDTO dto) {
		return dao.update(dto);
	}
	
	public int deleteByUid(int [] uids) {// 복수개의 uid (들)		
		return dao.deleteByUid(uids);
	}
	
	public List<QrDTO> selectByUid(int uid) {
		return dao.selectByUid(uid);  // 1개짜리 글도 List<> 로 리턴
	}
	
	
}

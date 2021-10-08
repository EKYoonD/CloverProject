package com.clover.spring.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clover.spring.domain.QrDAO;
import com.clover.spring.domain.QrDTO;

@Service
public class QrService {

	QrDAO dao;
	@Autowired
	public void setDao(QrDAO dao) {
		this.dao = dao;
	}
	
	public QrService() {
		System.out.println("QrService() 생성");
		
	}
	
	public List<QrDTO> list() {
		
		return dao.select();
	}
	public List<QrDTO> viewByUid(int uid) {
			
		return dao.readByUid(uid);
	}

	public int write(QrDTO dto) {
		return dao.insert(dto);
	}

	public List<QrDTO> selectByUid(int uid) {
		return dao.selectByUid(uid);
	}

	public int update(QrDTO dto) {
		return dao.update(dto);
	}



	
}
	


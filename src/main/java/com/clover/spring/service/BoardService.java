package com.clover.spring.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.clover.spring.domain.UserDAO;
import com.clover.spring.domain.WriteDAO;
import com.clover.spring.domain.WriteDTO;
import com.clover.spring.domain.WriteReDAO;
import com.clover.spring.domain.WriteReDTO;

//Service 단.
//JSP MVC model2 의 Command 역할 비슷
//    Controller -> Commmand -> DAO
//- Transaction 담당
//Spring
//@Controller -> @Service -> DAO -> JdbcTemplate

@Service
public class BoardService {


	// WriteDAO 가져와서 연결(AutoWired)
	WriteDAO dao;
	WriteReDAO redao;
	UserDAO userdao;
	
	@Autowired
	public void setDao(UserDAO userdao) {
		this.userdao = userdao;
	}

	@Autowired
	public void setDao(WriteDAO dao) {
		this.dao = dao;
	}
	
	@Autowired
	public void setDao(WriteReDAO redao) {
		this.redao = redao;
	}
	
	public BoardService() {	// 생성자
		System.out.println("BoardService() 생성");
	}
	
	public List<WriteDTO> list() {
		
		// WriteDAO Autowired 삭제하고, MyBatis sqlSession으로 받아와
		// dao = sqlSession.getMapper(WriteDAO.class);
		return dao.select();
	}

	@Transactional
	public List<WriteDTO> viewByUid(int uid) {
		// ※사실, 트랜잭션은 여기서 발생해야 한다.
		//  1. 조회수 증가
		//  2. 글 하나 읽어오기		
		dao.incViewCnt(uid);
		return dao.selectByUid(uid);
	}
	
	public List<WriteReDTO> viewReByUid(int uid) {
		return redao.selectRe(uid);
	}

	public int write(WriteDTO dto) {
		return dao.insert(dto);
	}
	
	
	public int writeRe(WriteReDTO redto) {
		return redao.insertRe(redto);
	}

	public List<WriteDTO> selectByUid(int uid) {
		return dao.selectByUid(uid);
	}

	public int update(WriteDTO dto) {
		return dao.update(dto);
	}

	public int deleteByUid(int uid) {
		return dao.deleteByUid(uid);
	}
	
	public String findNameByUserId(String userid) {
		return userdao.findNameByUserId(userid);
	}
	
	
}

package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QrDAOImpl implements QrDAO {


	private QrDAO mapper;
	
	
	@Autowired
	public QrDAOImpl(SqlSession sqlSession) {
		System.out.println("QrDAOImpl() 생성");
		mapper = sqlSession.getMapper(QrDAO.class);
	}
	
	@Override
	public List<QrDTO> select() {
		
		// TODO
		
		return mapper.select();
	}

	@Override
	public int insert(QrDTO dto) {
		int cnt = mapper.insert(dto);
		
		return cnt;
	}

	@Override
	public List<QrDTO> readByUid(int uid) {
		
		return mapper.selectByUid(uid);
	}

	@Override
	public List<QrDTO> selectByUid(int uid) {
		return mapper.selectByUid(uid);
	}

	@Override
	public int update(QrDTO dto) {
		return mapper.update(dto);
	}

//	@Override
//	public int deleteByUid(int uid) {
//		return mapper.deleteByUid(uid);
//	}

	

}



package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class WriteDAOImpl implements WriteDAO {
	
	private WriteDAO mapper;
	
	public WriteDAOImpl(SqlSession sqlSession) {
		System.out.println("WriteDAOImpl() 호출");
		mapper = sqlSession.getMapper(WriteDAO.class);
	}

	@Override
	public List<WriteDTO> select() {
		// XML -> WriteDAOImpl
		return mapper.select();
	}

	@Override
	public int insert(WriteDTO dto) {
		int cnt = mapper.insert(dto);
		return cnt;
	}

//	@Override
//	public List<WriteDTO> readByUid(int uid) {
//		mapper.incViewCnt(uid);
//		return mapper.selectByUid(uid);
//	}

	@Override
	public List<WriteDTO> selectByUid(int uid) {
		
		return mapper.selectByUid(uid);
	}

	@Override
	public int update(WriteDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public int deleteByUid(int uid) {
		return mapper.deleteByUid(uid);
	}

	@Override
	public int incViewCnt(int uid) {
		return mapper.incViewCnt(uid);
	}

}

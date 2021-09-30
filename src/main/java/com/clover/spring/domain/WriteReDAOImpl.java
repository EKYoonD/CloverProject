package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class WriteReDAOImpl implements WriteReDAO {
	
	private WriteReDAO mapper;
	
	public WriteReDAOImpl(SqlSession sqlSession) {
		System.out.println("WriteReDAOImpl() 호출");
		mapper = sqlSession.getMapper(WriteReDAO.class);
	}

	@Override
	public List<WriteReDTO> selectRe(int uid) {
		return mapper.selectRe(uid);
	}
	
	@Override
	public List<WriteReDTO> selectReByUid(int rep_uid) {
		return mapper.selectReByUid(rep_uid);
	}

	@Override
	public int insertRe(WriteReDTO dto) {
		int cnt = mapper.insertRe(dto);
		return cnt;
	}

	@Override
	public int updateRe(WriteReDTO dto) {
		return mapper.updateRe(dto);
	}

	@Override
	public int deleteByRepUid(int uid) {
		return mapper.deleteByRepUid(uid);
	}	

}

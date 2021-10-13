package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AjaxBoardRepDAOImpl implements AjaxBoardRepDAO {

	private AjaxBoardRepDAO mapper;
	
	@Autowired
	public AjaxBoardRepDAOImpl(SqlSession sqlSession) {
		System.out.println("AjaxDAOImpl() 생성");
		mapper = sqlSession.getMapper(AjaxBoardRepDAO.class);
	}

	@Override
	public List<WriteReDTO> selectFromRow(int from, int pageRows) {
		return mapper.selectFromRow(from, pageRows);
	}
	
	@Override
	public List<WriteReDTO> selectByUid(int uid) {
		return mapper.selectByUid(uid);
	}
	

	@Override
	public int countAll() {
		return mapper.countAll();
	}

	@Override
	public int insert(WriteReDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public int update(WriteReDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public int deleteByUid(int[] uids) {
		return mapper.deleteByUid(uids);
	}

	@Override
	public int countByUid(int uid) {
		return mapper.countByUid(uid);
	}

	
}









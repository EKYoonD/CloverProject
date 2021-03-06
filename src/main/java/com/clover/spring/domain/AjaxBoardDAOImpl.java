package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AjaxBoardDAOImpl implements AjaxBoardDAO {

	private AjaxBoardDAO mapper;
	
	@Autowired
	public AjaxBoardDAOImpl(SqlSession sqlSession) {
		System.out.println("AjaxDAOImpl() 생성");
		mapper = sqlSession.getMapper(AjaxBoardDAO.class);
	}

	@Override
	public List<WriteDTO> selectFromRow(int from, int pageRows) {
		return mapper.selectFromRow(from, pageRows);
	}

	@Override
	public int countAll() {
		return mapper.countAll();
	}

	@Override
	public List<WriteDTO> selectByUid(int uid) {
		return mapper.selectByUid(uid);
	}

	@Override
	public int insert(WriteDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public int update(WriteDTO dto) {
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









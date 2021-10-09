package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AjaxUserDAOImpl implements AjaxUserDAO {

	private AjaxUserDAO mapper;
	
	@Autowired
	public AjaxUserDAOImpl(SqlSession sqlSession) {
		System.out.println("AjaxDAOImpl() 생성");
		mapper = sqlSession.getMapper(AjaxUserDAO.class);
	}

	@Override
	public List<UserDTO> selectFromRow(int from, int pageRows) {
		return mapper.selectFromRow(from, pageRows);
	}

	@Override
	public int countAll() {
		return mapper.countAll();
	}

	@Override
	public List<UserDTO> selectByUid(int uid) {
		return mapper.selectByUid(uid);
	}

	@Override
	public int insert(UserDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public int update(UserDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public int deleteByUid(int[] uids) {
		return mapper.deleteByUid(uids);
	}
	
}









package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AjaxOrderDAOImpl implements AjaxOrderDAO {

	private AjaxOrderDAO mapper;
	
	@Autowired
	public AjaxOrderDAOImpl(SqlSession sqlSession) {
		System.out.println("AjaxDAOImpl() 생성");
		mapper = sqlSession.getMapper(AjaxOrderDAO.class);
	}

	@Override
	public List<KakaoPayDTO> selectFromRow(int from, int pageRows) {
		return mapper.selectFromRow(from, pageRows);
	}

	@Override
	public int countAll() {
		return mapper.countAll();
	}

	@Override
	public List<KakaoPayDTO> selectByUid(int uid) {
		return mapper.selectByUid(uid);
	}

	@Override
	public int insert(KakaoPayDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public int update(KakaoPayDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public int deleteByUid(int[] uids) {
		return mapper.deleteByUid(uids);
	}
	
}









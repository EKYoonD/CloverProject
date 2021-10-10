package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AjaxQrDAOImpl implements AjaxQrDAO {
	
	private AjaxQrDAO mapper;

	@Autowired
	public AjaxQrDAOImpl(SqlSession sqlSession) {
		System.out.println("QrDAOImpl() 생성");
		mapper = sqlSession.getMapper(AjaxQrDAO.class);
	}

	@Override
	public List<QrDTO> selectFromRow(int from, int pageRows) {
		return mapper.selectFromRow(from, pageRows);
	}

	@Override
	public int countAll() {
		return mapper.countAll();
	}

	@Override
	public List<QrDTO> selectByUid(int uid) {
		return mapper.selectByUid(uid);
	}

	@Override
	public int insert(QrDTO dto) {
		return mapper.insert(dto);
	}

	@Override
	public int update(QrDTO dto) {
		return mapper.update(dto);
	}

	@Override
	public int deleteByUid(int[] uids) {
		return mapper.deleteByUid(uids);
	}
	
}

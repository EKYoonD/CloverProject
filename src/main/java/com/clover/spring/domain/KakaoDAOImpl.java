package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KakaoDAOImpl implements KakaoDAO {

	private KakaoDAO mapper;
	
	@Autowired
	public KakaoDAOImpl(SqlSession sqlSession) {
		System.out.println("KakaoDAOImpl() 생성");
		mapper = sqlSession.getMapper(KakaoDAO.class);
	}
	
	@Override
	public List<KakaoPayDTO> select() {
		
		return mapper.select();
	}

	@Override
	public int insert(KakaoPayDTO dto) {
		int cnt = mapper.insert(dto);
		return cnt;
	}


	@Override
	public List<KakaoPayDTO> selectByUid(int partner_order_id) {
		return mapper.selectByUid(partner_order_id);
	}

	@Override
	public int deleteByPartner_order_id(int partner_order_id) {
		return mapper.deleteByPartner_order_id(partner_order_id);
	}

	@Override
	public int selectUidByUid(int partner_order_id) {
		return mapper.selectUidByUid(partner_order_id);
	}

}

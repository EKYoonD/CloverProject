package com.clover.spring.domain;

import java.util.List;

public interface KakaoDAO {

	// 전체 SELECT
	public abstract List<KakaoPayDTO> select();
	
	public abstract int insert(KakaoPayDTO dto);
		
	public abstract List<KakaoPayDTO> selectByUid(int partner_order_id);
	
	public abstract List<KakaoPayDTO> selectUidByUid(int partner_order_id);
	
	// 특정 uid 글 삭제하기
	public abstract int deleteByPartner_order_id(int partner_order_id);
	
}

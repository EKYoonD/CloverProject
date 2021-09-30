package com.clover.spring.domain;

import java.util.*;

public interface WriteDAO {
	// 전체 SELECT
	public abstract List<WriteDTO> select();
	
	// 새글작성 <-- DTO
	public abstract int insert(WriteDTO dto);
	
	// 특정 uid 글 내용 읽기, 조회수 증가
	// viewcnt 도 1 증가 해야 하고, 읽어와야 한다. --> 트랜잭션 처리
	//	public abstract List<WriteDTO> readByUid(int uid);
	
	// 특정 uid 글 내용 읽기,
	public abstract List<WriteDTO> selectByUid(int uid);
	
	// 특정 uid 글 수정 ( 제목, 내용 )
	public abstract int update(WriteDTO dto);
	
	// 특정 uid 글 삭제하기
	public abstract int deleteByUid(int uid);
	
	// 특정 uid 글 조회수 증가
	public abstract int incViewCnt(int uid);

	public abstract int selectUidByUid(int uid);

}

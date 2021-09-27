package com.clover.spring.domain;

import java.util.*;

public interface WriteReDAO {
	
	// reuid로 댓글 추가
	public abstract int insertRe(WriteReDTO dto);
	
	// 특정 uid 글 수정 ( 제목, 내용 )
	public abstract int updateRe(WriteReDTO dto);
	
	// 특정 uid 글 삭제하기
	public abstract int deleteReByUid(int uid);

	// uid로 댓글 
	public abstract List<WriteReDTO> selectRe(int uid);

}

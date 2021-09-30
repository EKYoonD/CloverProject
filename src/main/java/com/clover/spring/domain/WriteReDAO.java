package com.clover.spring.domain;

import java.util.*;

public interface WriteReDAO {
	
	// reuid로 댓글 추가
	public abstract int insertRe(WriteReDTO dto);
	
	// 특정 uid 글 수정 ( 제목, 내용 )
	public abstract int updateRe(WriteReDTO dto);

	// uid로 댓글 
	public abstract List<WriteReDTO> selectRe(int uid);

	public abstract List<WriteReDTO> selectReByUid(int rep_uid);

	public abstract int deleteByRepUid(int rep_uid);

}

package com.clover.spring.domain;

import java.util.List;

public interface QrDAO {
	
	// 전체 SELECT
		public abstract List<QrDTO> select();
		
		// 새글작성 <-- DTO
		public abstract int insert(QrDTO dto);
		
		// 특정 uid 글 내용 읽기, 
		public abstract List<QrDTO> readByUid(int uid);
		
		// 특정 uid 글 내용 읽기,
		public abstract List<QrDTO> selectByUid(int uid);
		
		// 특정 uid 글 수정 ( 제목, 내용 )
		public abstract int update(QrDTO dto);
		
//		// 특정 uid 글 삭제하기
//		public abstract int deleteByUid(int uid);
		
		
	}



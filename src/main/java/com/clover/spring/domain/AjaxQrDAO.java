package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface AjaxQrDAO {
	
	// 페이징용 SELECT
		// from : 몇번째 row 부터 
		// pageRows : 몇개의 데이터
		public List<QrDTO> selectFromRow(
			@Param("from") int from, 
			@Param("pageRows") int pageRows 
		);
		
		// 전체 글의 개수
		public int countAll();
		
		// 특정 uid 의 글 읽어오기
		public List<QrDTO> selectByUid(int uid);

		
		// 글작성
		public int insert(QrDTO dto);
		
		// 글수정
		public int update(QrDTO dto);
		
		// 특정 uid 글(들) 삭제하기
		public int deleteByUid(int [] uids);

}

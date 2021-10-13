package com.clover.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.clover.spring.domain.AjaxBoardList;
import com.clover.spring.domain.AjaxUserList;
import com.clover.spring.domain.AjaxWriteList;
import com.clover.spring.domain.AjaxWriteResult;
import com.clover.spring.domain.UserDTO;
import com.clover.spring.domain.WriteDTO;
import com.clover.spring.service.AjaxBoardService;
import com.clover.spring.service.AjaxService;
import com.clover.spring.service.AjaxUserService;

@RestController
@RequestMapping("/clover/admin/board")
public class AjaxBoardController {

	@Autowired
	AjaxBoardService ajaxBoardService;
	
	// 글목록 페이징
	@GetMapping("/{page}/{pageRows}")    // URI : /board/{page}/{pageRows}
	public AjaxBoardList list(
			@PathVariable int page, 
			@PathVariable int pageRows) {
		
		List<WriteDTO> list = null;
		
		// message 
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		// 페이징 관련 세팅 값들
		//page : 현재 페이지
		//pageRows : 한 '페이지'에 몇개의 글을 리스트 할것인가?
		int writePages = 10;    // 한 [페이징] 에 몇개의 '페이지'를 표현할 것인가?
		int totalPage = 0; // 총 몇 '페이지' 분량인가? 
		int totalCnt = 0;  // 글은 총 몇개인가?
		
		
		try {			
			// 글 전체 개수 구하기
			totalCnt = ajaxBoardService.count();
			
			// 총 몇페이지 분량?
			totalPage = (int)Math.ceil(totalCnt / (double)pageRows);
			
			// from: 몇번째 row 부터?
			int from = (page - 1) * pageRows;  // MySQL 의 Limit 는 0-base 
			
			list = ajaxBoardService.list(from, pageRows);
			
			if(list == null) {
				message.append("[리스트할 데이터가 없습니다]");
			} else {
				status = "OK";
			}
		} catch(Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
		}
		
		AjaxBoardList result = new AjaxBoardList();
		
		result.setStatus(status);
		result.setMessage(message.toString());
		
		if(list != null) {
			result.setCount(list.size());
			result.setList(list);
		}
		
		result.setPage(page);
		result.setTotalPage(totalPage);
		result.setWritePages(writePages);
		result.setPageRows(pageRows);
		result.setTotalCnt(totalCnt);
		
		return result;
	}
	
	// 특정 uid 글 읽기
	@GetMapping("/{uid}")   // URI:  /board/{uid}
	public AjaxBoardList view(@PathVariable int uid) {
		List<WriteDTO> list = null;
		
		// message 
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {			
			list = ajaxBoardService.viewByUid(uid);  // 조회수 증가 + 읽기
			
			if(list == null || list.size() == 0) {
				message.append("[해당 데이터가 없습니다]");
			} else {
				status = "OK";
			}
		} catch(Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
		}
		
		AjaxBoardList result = new AjaxBoardList();
		
		result.setStatus(status);
		result.setMessage(message.toString());
		
		if(list != null) {
			result.setCount(list.size());
			result.setList(list);
		}
		
		return result;		
	}
	
	// 글 삭제
	@PostMapping("")  // URI: /board
	public AjaxBoardList deleteOk(int [] uid) {
		int count = 0;
		
		// message 
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			
			if(uid != null) {
				count = ajaxBoardService.deleteByUid(uid);
				status = "OK";
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
		}
		
		AjaxBoardList result = new AjaxBoardList();
		result.setStatus(status);
		result.setMessage(message.toString());
		result.setCount(count);
		return result;
	}
		
	
}



















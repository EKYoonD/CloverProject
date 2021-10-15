package com.clover.spring.controller;

import java.util.Map;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.clover.spring.WriteNoticeValidator;
import com.clover.spring.WriteValidator;
import com.clover.spring.domain.WriteDTO;
import com.clover.spring.service.BoardService;
import com.clover.spring.util.LoginUtils;

@Controller
@RequestMapping("clover/member/board")
public class BoardNoticeController {
	
	private BoardService boardService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	public BoardNoticeController() {	// 생성자
		System.out.println("BoardController() 생성");
	}
	
	
	@GetMapping("/writeNotice")
	public String writeNotice(Model model, Authentication authentication, RedirectAttributes redirectAttributes) {
		
		WriteDTO dto = new WriteDTO();
		
		String userid = LoginUtils.getUserId(authentication.getPrincipal());
		
		redirectAttributes.addAttribute("userid", userid);
		
		
		dto.setUserid(userid);
		//		dto.setName(name);
		model.addAttribute("w", dto);   // auto-generated key 받아와
		
		return "board/writeNotice";
	}
	
	
	public String findNameByUserId(String userid) {
		String name = boardService.findNameByUserId(userid);
		return name;
		
	}
	
	@PostMapping("/writeNoticeOk")
	public String writeNoticeOk(@ModelAttribute("w") @Valid WriteDTO dto,
			BindingResult result, 
			Model model) {		// 핸들러 매개변수 작성시 Model은 BindingResult 뒤에 두어야 함
		// write 거치고 나면 담겨있게 됨
		// auto-generated key값도 받아와야 해 (auto-increment) -> dto로 담겨 있음

		if(result.hasErrors()) {
			// 에러가능 추가적인 model attribute 지정 가능
			
			if(result.getFieldError("subject") != null)
				model.addAttribute("ERROR", result.getFieldError("subject").getCode());
			
			return "/board/writeNotice";
		}
		
		model.addAttribute("result", boardService.write(dto));
		model.addAttribute("dto", dto);
		return "/board/WriteNoticeOk";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new WriteNoticeValidator());
	}

}

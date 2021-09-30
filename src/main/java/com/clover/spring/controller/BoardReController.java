package com.clover.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
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

import com.clover.spring.WriteReValidator;
import com.clover.spring.WriteValidator;
import com.clover.spring.domain.WriteDTO;
import com.clover.spring.domain.WriteReDTO;
import com.clover.spring.service.BoardService;

@Controller
@RequestMapping("clover/member/board")
public class BoardReController {
	
	private BoardService boardService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	public BoardReController() {	// 생성자
		System.out.println("BoardController() 생성");
	}
	
	
	@GetMapping("/writeRe")
	public String writeRe(int uid, Model model, Authentication authentication, RedirectAttributes redirectAttributes) {
		
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		
		WriteReDTO redto = new WriteReDTO();
		
//		String name = this.findNameByUserId(userDetails.getUsername());
		String userid = userDetails.getUsername();
		redirectAttributes.addAttribute("userid", userid);
		
		redto.setUid(uid);
		redto.setUserid(userid);
//		dto.setName(name);
		model.addAttribute("w", redto);   // auto-generated key 받아와
		return "board/writeRe";
	}
	
	
	@PostMapping("/writeReOk") // 대소문자 신경써..ㅠㅠ
	public String writeReOk(@ModelAttribute("w") @Valid WriteReDTO redto,
			BindingResult result, 
			Model model) {		// 핸들러 매개변수 작성시 Model은 BindingResult 뒤에 두어야 함
		// write 거치고 나면 담겨있게 됨
		// auto-generated key값도 받아와야 해 (auto-increment) -> dto로 담겨 있음
		
		System.out.println("1 + " + redto.getSubject());
		System.out.println("2 + " + redto.getContent());
		System.out.println("3 + " + redto.getLatitude());
		System.out.println("4 + " + redto.getRegDate());
		System.out.println("6 + " + redto.getUid());
		System.out.println("7 + " + redto.getUserid());
		
		if(result.hasErrors()) {
			// 에러 기능 관련해 추가적인 model attribute 지정 가능
			// WriteValidator에서 validation에 rejetValue에 값을 담았었음 -> 그걸 가지고
			
			if(result.getFieldError("subject") != null)
				model.addAttribute("ERROR", result.getFieldError("subject").getCode());
			else if(result.getFieldError("latitude") != null)
				model.addAttribute("ERROR", result.getFieldError("latitude").getCode());
			
			
			return "board/writeRe";
		}
		
		// 앞에게 안되면 뒤에서 addAttribute가 추가되면 안됨
		// 그래서 page = 넣는거 하지 말고 그냥 바로 return "board/write"
		
		model.addAttribute("result", boardService.writeRe(redto));
		model.addAttribute("dto", redto);   // auto-generated key 받아와
		
		return "board/writeReOk";
	}
	
	

	@InitBinder
	public void initBinderRe(WebDataBinder binder) {
		binder.setValidator(new WriteReValidator());
	}
	
}

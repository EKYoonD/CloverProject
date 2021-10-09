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
import com.clover.spring.util.LoginUtils;

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
		WriteReDTO redto = new WriteReDTO();
		
		String userid = LoginUtils.getUserId(authentication.getPrincipal());
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
			RedirectAttributes redirectAttributes,
			Model model) {		// 핸들러 매개변수 작성시 Model은 BindingResult 뒤에 두어야 함
		// write 거치고 나면 담겨있게 됨
		// auto-generated key값도 받아와야 해 (auto-increment) -> dto로 담겨 있음
		
		if(result.hasErrors()) {
			// 에러 기능 관련해 추가적인 model attribute 지정 가능
			// WriteValidator에서 validation에 rejetValue에 값을 담았었음 -> 그걸 가지고			
			if(result.getFieldError("subject") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("SUBJECT", "제목입력은 필수입니다");
				redirectAttributes.addFlashAttribute("ERROR", map);
				
				// uid 같이 넘겨줘야 하는 경우에는 redirect 사용
				return "redirect:/clover/member/board/writeRe?uid=" + redto.getUid();
			}
			
			if(result.getFieldError("latitude") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("POINT", "좌표를 다시 찍어주세요");
				redirectAttributes.addFlashAttribute("ERROR", map);
				
				// uid 같이 넘겨줘야 하는 경우에는 redirect 사용
				return "redirect:/clover/member/board/writeRe?uid=" + redto.getUid();
			}
			
		}
		
		// 앞에게 안되면 뒤에서 addAttribute가 추가되면 안됨
		// 그래서 page = 넣는거 하지 말고 그냥 바로 return "board/write"
		
		model.addAttribute("result", boardService.writeRe(redto));
		model.addAttribute("dto", redto);   // auto-generated key 받아와
		
		return "board/writeReOk";
	}
	
	@GetMapping("/updateRe")
	public String update(int rep_uid, Model model) {
		model.addAttribute("list", boardService.viewReByRepUid(rep_uid));
		return "board/updateRe";
	}
	
	
	@PostMapping("/updateReOk")
	public String updateOk(@ModelAttribute("w") @Valid WriteReDTO redto,
			BindingResult result, 
			RedirectAttributes redirectAttributes,
			Model model) {
		
		if(result.hasErrors()) {
			// 에러 기능 관련해 추가적인 model attribute 지정 가능
			// WriteValidator에서 validation에 rejetValue에 값을 담았었음 -> 그걸 가지고			
			if(result.getFieldError("subject") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("SUBJECT", "제목입력은 필수입니다");
				redirectAttributes.addFlashAttribute("ERROR", map);
				
				// uid 같이 넘겨줘야 하는 경우에는 redirect 사용
				return "redirect:/clover/member/board/updateRe?rep_uid=" + redto.getRep_uid();
			}
			
			if(result.getFieldError("latitude") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("POINT", "좌표를 다시 찍어주세요");
				redirectAttributes.addFlashAttribute("ERROR", map);
				
				// uid 같이 넘겨줘야 하는 경우에는 redirect 사용
				return "redirect:/clover/member/board/updateRe?rep_uid=" + redto.getRep_uid();
			}
			
		}
		
		model.addAttribute("result", boardService.updateRe(redto));
		return "board/updateReOk";
	}
	

	@InitBinder
	public void initBinderRe(WebDataBinder binder) {
		binder.setValidator(new WriteReValidator());
	}
	
}

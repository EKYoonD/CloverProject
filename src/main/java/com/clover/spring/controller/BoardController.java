package com.clover.spring.controller;

import java.util.HashMap;
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

import com.clover.spring.WriteValidator;
import com.clover.spring.domain.WriteDTO;
import com.clover.spring.service.BoardService;

@Controller
@RequestMapping("clover/member/board")
public class BoardController {
	
	private BoardService boardService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	public BoardController() {	// 생성자
		System.out.println("BoardController() 생성");
	}
	
	// REST 게시판 (list)
		@RequestMapping("/list")
		public String rest() {
			return "board/list";
		}
	
	@GetMapping("/write")
	public String write(Model model, Authentication authentication, RedirectAttributes redirectAttributes) {
		
		DefaultOAuth2User userDetails = (DefaultOAuth2User) authentication.getPrincipal(); 	//카카오로그인
		
//		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 				//일반로그인
		
		WriteDTO dto = new WriteDTO();
		
		String userid = userDetails.getName();			//카카오로그인
		
//		String userid = userDetails.getUsername();		//일반로그인

		
		redirectAttributes.addAttribute("userid", userid);
		
		
		dto.setUserid(userid);
//		dto.setName(name);
		model.addAttribute("w", dto);   // auto-generated key 받아와
		
		return "board/write";
	}
	
	
	public String findNameByUserId(String userid) {
		String name = boardService.findNameByUserId(userid);
		return name;
		
	}
	
	@PostMapping("/writeOk")
	public String writeOk(@ModelAttribute("w") @Valid WriteDTO dto,
			BindingResult result, 
			Model model) {		// 핸들러 매개변수 작성시 Model은 BindingResult 뒤에 두어야 함
		// write 거치고 나면 담겨있게 됨
		// auto-generated key값도 받아와야 해 (auto-increment) -> dto로 담겨 있음

		if(result.hasErrors()) {
			// 에러가능 추가적인 model attribute 지정 가능
			
			if(result.getFieldError("subject") != null)
				model.addAttribute("ERROR", result.getFieldError("subject").getCode());
			else if(result.getFieldError("latitude") != null)
				model.addAttribute("ERROR", result.getFieldError("latitude").getCode());
			
			return "/board/write";
		}
		
		model.addAttribute("result", boardService.write(dto));
		model.addAttribute("dto", dto);
		return "board/writeOk";
	}

	@GetMapping("/view")
	public String view(int uid, Model model) {
		model.addAttribute("list", boardService.viewByUid(uid));
		return "board/view";
	}
	
	@GetMapping("/viewRe")
	public String viewRe(int uid, Model model) {
		model.addAttribute("list", boardService.viewReByUid(uid));
		return "board/viewRe";
	}
	
	@GetMapping("/viewOneRe")
	public String viewOneRe(int rep_uid, Model model) {
		model.addAttribute("list", boardService.viewReByRepUid(rep_uid));
		return "board/viewOneRe";
	}
	
	@GetMapping("/update")
	public String update(int uid, Model model) {
		model.addAttribute("list", boardService.selectByUid(uid));
		return "board/update";
	}
	
	
	@PostMapping("/updateOk")
	public String updateOk(@ModelAttribute("w") @Valid WriteDTO dto,
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
				return "redirect:/clover/member/board/update?uid=" + dto.getUid();
			}
			
			if(result.getFieldError("latitude") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("POINT", "좌표를 다시 찍어주세요");
				redirectAttributes.addFlashAttribute("ERROR", map);
				
				// uid 같이 넘겨줘야 하는 경우에는 redirect 사용
				return "redirect:/clover/member/board/update?uid=" + dto.getUid();
			}
			
		}
		
		model.addAttribute("result", boardService.update(dto));
		return "board/updateOk";
	}
	
	@GetMapping("/deleteOk")
	public String deleteOk(int uid, Model model) {
		model.addAttribute("result", boardService.deleteByUid(uid));
		return "board/deleteOk";
	}
	
	@GetMapping("/deleteReOk")
	public String deleteReOk(int rep_uid, Model model) {
		model.addAttribute("result", boardService.deleteByRepUid(rep_uid));
		return "board/deleteReOk";
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new WriteValidator());
	}

}

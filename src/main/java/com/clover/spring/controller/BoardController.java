package com.clover.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.clover.spring.WriteValidator;
import com.clover.spring.domain.WriteDTO;
import com.clover.spring.domain.WriteReDTO;
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
	
	@RequestMapping("/list")
	public String list(Model model) {
		
		model.addAttribute("list", boardService.list());
		return "board/list";
	}
	
	@GetMapping("/write")
	public String write(Model model, Authentication authentication) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 

		WriteDTO dto = new WriteDTO();
		
//		String name = this.findNameByUserId(userDetails.getUsername());
		String userid = userDetails.getUsername();
		
		dto.setUserid(userid);
//		dto.setName(name);
		model.addAttribute("w", dto);   // auto-generated key 받아와
		return "board/write";
	}
	
	
	public String findNameByUserId(String userid) {
		String name = boardService.findNameByUserId(userid);
		return name;
	}
	
	@GetMapping("/writeOk") // 대소문자 신경써..ㅠㅠ
	public String writeOk(@ModelAttribute("w") @Valid WriteDTO dto, RedirectAttributes redirectAttributes,
			BindingResult result, 
			Model model) {		// 핸들러 매개변수 작성시 Model은 BindingResult 뒤에 두어야 함
		// write 거치고 나면 담겨있게 됨
		// auto-generated key값도 받아와야 해 (auto-increment) -> dto로 담겨 있음
		
		System.out.println("카테고리: " + dto.getCategory());
		System.out.println("제목: " + dto.getSubject());
		System.out.println("내용: " + dto.getContent());
		System.out.println("사용자 아이디: " +dto.getUserid());
		System.out.println(dto.getLatitude());
		System.out.println(dto.getLongitude());
		
		if(result.hasErrors()) {
			// 에러 기능 관련해 추가적인 model attribute 지정 가능
			// WriteValidator에서 validation에 rejetValue에 값을 담았었음 -> 그걸 가지고			
			if(result.getFieldError("subject") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("SUBJECT", "제목입력은 필수입니다");
				redirectAttributes.addFlashAttribute("ERROR", map);
				
				// uid 같이 넘겨줘야 하는 경우에는 redirect 사용
				return "redirect:/clover/member/board/write";
			}
			
			if(result.getFieldError("latitude") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("POINT", "좌표를 다시 찍어주세요");
				redirectAttributes.addFlashAttribute("ERROR", map);
				
				// uid 같이 넘겨줘야 하는 경우에는 redirect 사용
				return "redirect:/clover/member/board/write";
			}
			
		}
		
//		if(result.hasErrors()) {
//			if(result.getFieldError("subject") != null)
//				model.addAttribute("ERR", result.getFieldError("subject").getCode());
//			else if(result.getFieldError("latitude") != null)
//				model.addAttribute("ERR", result.getFieldError("latitude").getCode());
//			return "redirect:/clover/member/board/write";
//		}
		
		model.addAttribute("result", boardService.write(dto));
		model.addAttribute("dto", dto);
		return "board/writeOk";
	}
	

	@GetMapping("/writeRe")
	public String writeRe(Model model) {
		return "board/writeRe";
	}
	
//	@PostMapping("/writReOk") // 대소문자 신경써..ㅠㅠ
//	public String writeReOk(@ModelAttribute("w") @Valid WriteReDTO dto,
//			BindingResult result, 
//			Model model) {		// 핸들러 매개변수 작성시 Model은 BindingResult 뒤에 두어야 함
//		// write 거치고 나면 담겨있게 됨
//		// auto-generated key값도 받아와야 해 (auto-increment) -> dto로 담겨 있음
//		
//		if(result.hasErrors()) {
//			// 에러 기능 관련해 추가적인 model attribute 지정 가능
//			// WriteValidator에서 validation에 rejetValue에 값을 담았었음 -> 그걸 가지고
//			if(result.getFieldError("name") != null)
//				model.addAttribute("ERR", result.getFieldError("name").getCode());
//			else if(result.getFieldError("subject") != null)
//				model.addAttribute("ERR", result.getFieldError("subject").getCode());
//			
//			return "board/write";
//		}
//		
//		// 앞에게 안되면 뒤에서 addAttribute가 추가되면 안됨
//		// 그래서 page = 넣는거 하지 말고 그냥 바로 return "board/write"
//		
//		model.addAttribute("result", boardService.writeRe(dto));
//		model.addAttribute("dto", dto);   // auto-generated key 받아와
//		
//		return "board/writeReOk";
//	}
	
	
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
				return "redirect:/board/update?uid=" + dto.getUid();
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
	
	
	
	
	
	// handler 등록 (controller에서)
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new WriteValidator());
	}
	
}

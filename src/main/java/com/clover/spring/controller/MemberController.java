package com.clover.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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

import com.clover.spring.MemberValidator;
import com.clover.spring.domain.UserDTO;

import com.clover.spring.service.UserService;
import com.clover.spring.util.LoginUtils;

@Controller
@RequestMapping("clover/member")
public class MemberController {

	@Autowired
	UserService userService;

	@GetMapping("/mypage")
	public String mypage(Model model, Authentication authentication, RedirectAttributes redirectAttributes) {

//		UserDTO dto = new UserDTO();
		String id = LoginUtils.getUserId(authentication.getPrincipal());
		System.out.println(id);
//		dto.setId(id);
		model.addAttribute("list", userService.findById(id));

		return "user/userPage";
	}

	@GetMapping("/userupdate")
	public String update(Model model, Authentication authentication) {
		String id = LoginUtils.getUserId(authentication.getPrincipal());
		System.out.println(id);
		model.addAttribute("list", userService.findById(id));

		return "user/userUpdate";
	}

	@PostMapping("/userupdateok")
	public String updateOk(@ModelAttribute("list") @Valid UserDTO dto,
	BindingResult result, RedirectAttributes redirectAttributes, Model model) {

		System.out.println(dto.getId());
		if (result.hasErrors()) {
			// 에러 기능 관련해 추가적인 model attribute 지정 가능
			// WriteValidator에서 validation에 rejetValue에 값을 담았었음 -> 그걸 가지고
//			if (result.getFieldError("id") != null) {
//				Map<String, Object> map = new HashMap<>();
//				map.put("ID", "ID입력은 필수입니다");
//				redirectAttributes.addFlashAttribute("ERROR", map);
//
//				// uid 같이 넘겨줘야 하는 경우에는 redirect 사용
//				return "redirect:/clover/member/board/userupdate?id=" + dto.getId();
//			}

			if (result.getFieldError("name") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("NAME", "이름입력은 필수입니다");
				redirectAttributes.addFlashAttribute("ERROR", map);

				// uid 같이 넘겨줘야 하는 경우에는 redirect 사용
				return "redirect:/clover/member/board/userupdate?id=" + dto.getId();
			}
			
			

		}
	model.addAttribute("result", userService.update(dto));
		return "user/userUpdateOk";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new MemberValidator());
	}
}

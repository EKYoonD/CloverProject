package com.clover.spring.controller;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.clover.spring.QrGenerator.QrCodeGenerator;
import com.clover.spring.domain.QrDTO;
import com.clover.spring.domain.WriteDTO;
import com.clover.spring.service.QrService;

@Controller
@RequestMapping("/qr")
public class QrController {
	private QrService qrService;

	@Autowired
	public void setQrservice(QrService qrService) {
		this.qrService = qrService;
	}

	public QrController() {
		System.out.println("QrController() 생성");
	}

//	@RequestMapping("/list")
//	public String list(Model model) {
//
//		model.addAttribute("list", qrService.list());
//
//		return "board/list";
//	}

	@GetMapping("/write")
	public String write(Model model) {
		
UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
		
		WriteDTO dto = new WriteDTO();
		
//		String name = this.findNameByUserId(userDetails.getUsername());
		String userid = userDetails.getUsername();
		redirectAttributes.addAttribute("userid", userid);
		
		dto.setUserid(userid);
//		dto.setName(name);
		model.addAttribute("m", dto);   // auto-generated key 받아와
		return "qr/write";
	}

	@PostMapping("/writeOk")
	public String writeOk(@ModelAttribute("m") @Valid QrDTO dto, BindingResult result, Model model) {

		if (result.hasErrors()) {

			if (result.getFieldError("name") != null)
				model.addAttribute("ERR", result.getFieldError("name").getCode());
			else if (result.getFieldError("age") != null)
				model.addAttribute("ERR", result.getFieldError("age").getCode());
			

			return "qr/write";
		}

		model.addAttribute("result", qrService.write(dto));
		model.addAttribute("dto", dto); // auto-generated key

		return "qr/writeOk";
	}

	@GetMapping("/view")
	public String view(int uid, Model model) {

		model.addAttribute("list", qrService.viewByUid(uid));

		return "qr/view";
	}
	

	@RequestMapping("/update")
	public String update(int uid, Model model) {

		model.addAttribute("list", qrService.selectByUid(uid));

		return "qr/update";
	}

	@PostMapping("/updateOk")
	public String updateOk(@ModelAttribute("m") @Valid QrDTO dto, BindingResult result,
			RedirectAttributes redirectAttributes // 이또한 BindingResult 이후에 명시
			, Model model) {

		if (result.hasErrors()) {
			// 에러가능 추가적인 model attribute 지정 가능
			if (result.getFieldError("name") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("name", "이름입력");
				redirectAttributes.addFlashAttribute("ERROR", map);
				return "redirect:/qr/update?uid=" + dto.getUid();
			}
			if (result.getFieldError("age") != null) {
				Map<String, Object> map = new HashMap<>();
				map.put("age", "나이입력");
				redirectAttributes.addFlashAttribute("ERROR", map);
				return "redirect:/qr/update.mn?uid=" + dto.getUid();
			}
		}

		model.addAttribute("result", qrService.update(dto));

		return "qr/updateOk"; // forwarding
	}


//	@GetMapping(value = "/generateQRCode/{width}/{height}/{codeText}")
//	public ResponseEntity<byte[]> generateQRCode(@PathVariable("codeText") String codeText,
//			@PathVariable("width") int width, @PathVariable("height") int height) throws Exception {
//		return ResponseEntity.status(HttpStatus.OK).body(QrCodeGenerator.getQRCodeImage(codeText, width, height));
//	}
	
	@RequestMapping(value = "qrcode/{uid}", method = RequestMethod.GET)
	public void qrcode(@PathVariable("uid") String uid, HttpServletResponse response) throws Exception {
		response.setContentType("image/png");
		  uid = new String(uid.getBytes("UTF-8") , "ISO-8859-1");
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(QrCodeGenerator.getQRCodeImage(uid, 200, 200));
		outputStream.flush();
		outputStream.close();
	}
}
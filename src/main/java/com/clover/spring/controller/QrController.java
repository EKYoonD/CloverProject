package com.clover.spring.controller;

import java.io.File;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.clover.spring.QrValidator;
import com.clover.spring.QrGenerator.QrCodeGenerator;
import com.clover.spring.domain.QrDTO;
import com.clover.spring.service.QrService;
import com.clover.spring.util.LoginUtils;

@Controller
@RequestMapping("clover/member/qr")

public class QrController {
	private QrService qrService;

	@Autowired
	public void setQrservice(QrService qrService) {
		this.qrService = qrService;
	}

	public QrController() {
		System.out.println("QrController() 생성");
	}


	@GetMapping("/write")
	public String write(Model model, Authentication authentication, RedirectAttributes redirectAttributes) {
		QrDTO dto = new QrDTO();

		String userid = LoginUtils.getUserId(authentication.getPrincipal());

		redirectAttributes.addAttribute("userid", userid);

		dto.setUserid(userid);
		model.addAttribute("m", dto);

		return "qr/write";
	}

	@GetMapping("/write2")
	public String write2(Model model, Authentication authentication, RedirectAttributes redirectAttributes) {
		QrDTO dto = new QrDTO();

		String userid = LoginUtils.getUserId(authentication.getPrincipal());

		redirectAttributes.addAttribute("userid", userid);

		dto.setUserid(userid);
		model.addAttribute("m", dto);

		return "qr/write2";
	}

	@GetMapping("/write3")
	public String write3(Model model, Authentication authentication, RedirectAttributes redirectAttributes) {
		QrDTO dto = new QrDTO();

		String userid = LoginUtils.getUserId(authentication.getPrincipal());

		redirectAttributes.addAttribute("userid", userid);

		dto.setUserid(userid);
		model.addAttribute("m", dto);

		return "qr/write3";
	}
	
	@GetMapping("/writeOrder")
	public String writeOrder(Model model, Authentication authentication, RedirectAttributes redirectAttributes) {
		QrDTO dto = new QrDTO();

		String userid = LoginUtils.getUserId(authentication.getPrincipal());

		redirectAttributes.addAttribute("userid", userid);

		dto.setUserid(userid);
		model.addAttribute("m", dto);

		return "qr/writeOrder";
	}

	@PostMapping("/writeOk")
	public String writeOk(@ModelAttribute("m") @Valid QrDTO dto, BindingResult result, Model model) {

		if (result.hasErrors()) {

			if (result.getFieldError("name") != null)
				model.addAttribute("ERR", result.getFieldError("name").getCode());
//			else if (result.getFieldError("age") != null)
//				model.addAttribute("ERR", result.getFieldError("age").getCode());

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
	
	@RequestMapping("/qrlist")
	public String list( Model model, Authentication authentication, RedirectAttributes redirectAttributes) {

		String userid = LoginUtils.getUserId(authentication.getPrincipal());
		model.addAttribute("list", qrService.listByUserid(userid));

		return "qr/qrlist";
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

		System.out.println(dto.getUid());
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
				return "redirect:/qr/update?uid=" + dto.getUid();
			}
		}

		model.addAttribute("result", qrService.update(dto));

		return "qr/updateOk"; // forwarding
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new QrValidator());
	}

//	@GetMapping(value = "/generateQRCode/{width}/{height}/{codeText}")
//	public ResponseEntity<byte[]> generateQRCode(@PathVariable("codeText") String codeText,
//			@PathVariable("width") int width, @PathVariable("height") int height) throws Exception {
//		return ResponseEntity.status(HttpStatus.OK).body(QrCodeGenerator.getQRCodeImage(codeText, width, height));
//	}

	private static final String QR_CODE_IMAGE_PATH = "C:\\qr\\QRCode.png";

	@RequestMapping(value = "qrcode/{qr_uid}", method = RequestMethod.GET)
	public void qrcode(@PathVariable("qr_uid") String uid, HttpServletResponse response) throws Exception {
		response.setContentType("image/png");
		uid = new String(uid.getBytes("UTF-8"), "ISO-8859-1");
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(QrCodeGenerator.getQRCodeImage(uid, 400, 400));
		
		// 여기
		
		QrCodeGenerator.generateQRCodeImage(uid, 400, 400, QR_CODE_IMAGE_PATH);
		outputStream.flush();
		outputStream.close();
	}


	@GetMapping("/download")
	public ResponseEntity<Object> download() {
		String path = "C:\\qr\\QRCode.png";
		
		try {
			Path filePath = Paths.get(path);
			Resource resource = new InputStreamResource(Files.newInputStream(filePath)); // 파일 resource 얻기
			
			File file = new File(path);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentDisposition(ContentDisposition.builder("attachment").filename(file.getName()).build());  // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
			
			return new ResponseEntity<Object>(resource, headers, HttpStatus.OK);
		} catch(Exception e) {
			return new ResponseEntity<Object>(null, HttpStatus.CONFLICT);
		}
	
//	@RequestMapping(value = "qrcode/{uid}", method = RequestMethod.GET)
//	public void download(
//			@PathVariable("uid") String uid,
//			@PathVariable("width") Integer width,
//			@PathVariable("height") Integer height)
//		    throws Exception {
//		        QrCodeGenerator.generateQRCodeImage(uid, width, height, QR_CODE_IMAGE_PATH);
//		    }

//@RequestMapping(value = "qrcode/{uid}", method = RequestMethod.GET)
//	public ResponseEntity<byte[]> generateQRCode(
//			@PathVariable("uid") String uid,
//			@PathVariable("width") Integer width,
//			@PathVariable("height") Integer height)
//		    throws Exception {
//		        return ResponseEntity.status(HttpStatus.OK).body(QrCodeGenerator.getQRCodeImage(uid, width, height));
//		    }
	}
}

package com.clover.spring.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.clover.spring.domain.KakaoPayDTO;
import com.clover.spring.service.KakaoPayService;
import com.clover.spring.util.LoginUtils;

import lombok.Setter;
import lombok.extern.java.Log;


@Log
@Controller
@RequestMapping("clover/member")
public class kakaopayController {
    
	@Resource(name="kakaoPayService")
	private KakaoPayService kakaoPayService;
	
	public kakaopayController() {
		System.out.println("kakaopayController() 생성");
	}
	
	@Autowired
	public void setKakaoPayService(KakaoPayService kakaoPayService) {
		this.kakaoPayService = kakaoPayService;
	}
	
    @Setter(onMethod_ = @Autowired)
    private KakaoPayService kakaopay;
    
    @GetMapping("/order")
    public String order(Model model, Authentication authentication, RedirectAttributes redirectAttributes, int uid) {
    	KakaoPayDTO dto = new KakaoPayDTO();
    	String user_id = LoginUtils.getUserId(authentication.getPrincipal());
    	redirectAttributes.addAttribute("user_id", user_id);
    	redirectAttributes.addAttribute("qr_uid", uid);
    	dto.setUser_id(user_id);
    	dto.setQr_uid(uid);
    	model.addAttribute("k", dto);
    	
    	return "/order/order";
    }
    
    
    
    @PostMapping("/orderOk")
    public String orderOk(@ModelAttribute("k") KakaoPayDTO dto, BindingResult result, Model model, HttpSession session) {
    	System.out.println(dto.getUser_id());
    	model.addAttribute("result", kakaoPayService.insert(dto));
    	model.addAttribute("dto", dto);
    	session.setAttribute("partner_order_id", dto.getPartner_order_id());
    	return "order/orderOk";
        
    }
    
    
    @GetMapping("/kakaoPay")
    public String kakaoPayGet(@RequestParam("partner_order_id") int partner_order_id, Model model) {
        model.addAttribute("partner_order_id", partner_order_id);
        return "order/kakaoPay";
    }
    
    
    @PostMapping("/kakaoPay")
    public String kakaoPay(int partner_order_id) {  	
        String kakaoPayReady = kakaopay.kakaoPayReady(partner_order_id);
		return "redirect:" + kakaoPayReady;
 
    }
    
    

    
}
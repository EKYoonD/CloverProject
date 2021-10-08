package com.clover.spring.controller;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
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
    public String order(Model model, Authentication authentication, RedirectAttributes redirectAttributes) {
    	KakaoPayDTO dto = new KakaoPayDTO();
    	model.addAttribute("k", dto);
    	return "/order/order";
    }
    
    @PostMapping("/orderOk")
    public String orderOk(@ModelAttribute("k") KakaoPayDTO dto, BindingResult result, Model model) {
    	System.out.println(dto.getPartner_order_id());
    	model.addAttribute("result", kakaoPayService.insert(dto));
    	model.addAttribute("dto", dto);
    	return "orderOk";
        
    }
    
    
    @GetMapping("/kakaoPay")
    public String kakaoPayGet(@RequestParam("partner_order_id") int partner_order_id, Model model) {
        model.addAttribute("partner_order_id", partner_order_id);
        return "/kakaoPay";
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay(int partner_order_id) {
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady(partner_order_id);
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token" ) String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
    }
    
}
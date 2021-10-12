package com.clover.spring;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clover.spring.domain.KakaoPayDTO;

public class kakaoValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return KakaoPayDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("kakaoValidator::validator() 호출");
		KakaoPayDTO dto = (KakaoPayDTO) target;

		
		String address = dto.getAddress();
		if(address == null || address.trim().isEmpty()) {
			errors.rejectValue("address", ": 주소 입력은 필수입니다.");
		}
		
		
		String order_Phone = dto.getOrder_Phone();
		if(order_Phone == null || order_Phone.trim().isEmpty()) {
			errors.rejectValue("order_Phone", ": 전화번호 입력은 필수입니다.");
		}
		
		int quantity = dto.getQuantity();
		if(quantity == 0 ) {
			errors.rejectValue("quantity", ": 수량 입력은 필수입니다.");
		}
	}

}

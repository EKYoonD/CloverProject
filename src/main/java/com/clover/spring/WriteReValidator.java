package com.clover.spring;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clover.spring.domain.WriteReDTO;

public class WriteReValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return WriteReDTO.class.isAssignableFrom(clazz);
	}

	
	@SuppressWarnings("unused")
	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("WriteReValidator::validate() 호출]");
		WriteReDTO redto = (WriteReDTO) target;
		
		String subject = redto.getSubject();
		if(subject == null || subject.trim().isEmpty()) {
			errors.rejectValue("subject", ": 제목 입력은 필수입니다");
		}
		
		Float latitude = redto.getLatitude();
		if(latitude == null){
			errors.rejectValue("latitude", ": 좌표를 제대로 설정해주세요");
		}
	}

}

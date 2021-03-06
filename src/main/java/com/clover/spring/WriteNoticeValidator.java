package com.clover.spring;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clover.spring.domain.WriteDTO;
import com.clover.spring.domain.WriteReDTO;

public class WriteNoticeValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return WriteDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("WriteNoticeValidator::validate() 호출]");
		WriteDTO dto = (WriteDTO) target;
		
		String subject = dto.getSubject();
		if(subject == null || subject.trim().isEmpty()) {
			errors.rejectValue("subject", ": 제목 입력은 필수입니다");
		}

	}

}

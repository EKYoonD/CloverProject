package com.clover.spring;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clover.spring.domain.QrDTO;


public class QrValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return QrDTO.class.isAssignableFrom(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("QrValidator::validate() 호출]");
		QrDTO dto = (QrDTO) target;
		
		String name = dto.getName();
		if(name == null || name.trim().isEmpty()) {
			errors.rejectValue("name", ": 이름 입력은 필수입니다");
		}
		
		int age = dto.getAge();
		if(age == 0){
			errors.rejectValue("age", ": 나이 입력은 필수입니다");
		}
	}

}
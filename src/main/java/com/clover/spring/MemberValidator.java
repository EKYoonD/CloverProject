package com.clover.spring;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


import com.clover.spring.domain.UserDTO;

public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return UserDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("QrValidator::validate() 호출]");
		UserDTO dto = (UserDTO) target;
		
		String id = dto.getId();
		if(id == null || id.trim().isEmpty()) {
			errors.rejectValue("id", ": id 입력은 필수입니다");
		}
		
		String name = dto.getName();
		if(name == null || name.trim().isEmpty()) {
			errors.rejectValue("name", ": 이름 입력은 필수입니다");
		}
	}

}

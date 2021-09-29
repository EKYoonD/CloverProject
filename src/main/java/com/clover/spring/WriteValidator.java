package com.clover.spring;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.clover.spring.domain.WriteDTO;

public class WriteValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return WriteDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		System.out.println("WriteValidator::validate() 호출]");
		WriteDTO dto = (WriteDTO) target;
		
		String subject = dto.getSubject();
		if(subject == null || subject.trim().isEmpty()) {
			errors.rejectValue("subject", "empty subject");
		}
		
		Float latitude = dto.getLatitude();
		if(latitude == null){
			errors.rejectValue("latitude", "empty point");
		}
	}

}

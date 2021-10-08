package com.clover.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class KakaoPayDTO {
	private int partner_order_id;// 주문번호
	private String order_Rec; // 수령인
	private int quantity; // 수량
	private int total_amount; // 금액
	private String address; // 주소
	private String order_Phone; // 수령인 연락처
	private int qr_uid;
	private String user_id;
	private String qr_option; // qr 옵션
	
	
	
	public KakaoPayDTO(int partner_order_id, String order_Rec, int quantity, int total_amount, String address,
			String order_Phone, int qr_uid, String user_id, String qr_option) {
		super();
		this.partner_order_id = partner_order_id;
		this.order_Rec = order_Rec;
		this.quantity = quantity;
		this.total_amount = total_amount;
		this.address = address;
		this.order_Phone = order_Phone;
		this.qr_uid = qr_uid;
		this.user_id = user_id;
		this.qr_option = qr_option;
	}



	public KakaoPayDTO() {
		super();
	}
	
	
	
}
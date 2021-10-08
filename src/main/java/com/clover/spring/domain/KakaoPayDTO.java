package com.clover.spring.domain;


public class KakaoPayDTO {
	private int partner_order_id;// 주문번호
	private String partner_user_id; // 유저ID
	private String order_Rec; // 수령인
	private int quantity; // 수량
	private int total_amount; // 금액
	private String address; // 주소

	
	
	public KakaoPayDTO() {
		super();
	}

	public int getPartner_order_id() {
		return partner_order_id;
	}

	public void setPartner_order_id(int partner_order_id) {
		this.partner_order_id = partner_order_id;
	}

	public String getPartner_user_id() {
		return partner_user_id;
	}




	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}




	public String getOrder_Rec() {
		return order_Rec;
	}




	public void setOrder_Rec(String order_Rec) {
		this.order_Rec = order_Rec;
	}




	public int getQuantity() {
		return quantity;
	}




	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}




	public int getTotal_amount() {
		return total_amount;
	}




	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	@Override
	public String toString() {
		return "KakaoPayDTO [partner_order_id=" + partner_order_id + ", partner_user_id=" + partner_user_id
				+ ", order_Rec=" + order_Rec + ", quantity=" + quantity + ", total_amount=" + total_amount
				+ ", address=" + address + "]";
	}




	public KakaoPayDTO(int partner_order_id, String partner_user_id, String order_Rec, int quantity, int total_amount,
			String address) {
		super();
		this.partner_order_id = partner_order_id;
		this.partner_user_id = partner_user_id;
		this.order_Rec = order_Rec;
		this.quantity = quantity;
		this.total_amount = total_amount;
		this.address = address;
	}
	
	
}

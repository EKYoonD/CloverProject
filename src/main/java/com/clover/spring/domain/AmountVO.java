package com.clover.spring.domain;

import lombok.Data;

@Data
public class AmountVO {
 
    private Integer total, tax_free, vat, point, discount;
}

// kakaopay AmountVO
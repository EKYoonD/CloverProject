package com.clover.spring.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import com.clover.spring.domain.KakaoDAO;
import com.clover.spring.domain.KakaoPayApprovalVO;
import com.clover.spring.domain.KakaoPayDTO;
import com.clover.spring.domain.KakaoPayReadyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
 
import lombok.extern.java.Log;
 
@Service
@Log
public class KakaoPayService {
	 
	KakaoDAO dao;
	
	@Autowired
	public void setDao(KakaoDAO dao) {
		this.dao = dao;
	}
	
    private static final String HOST = "https://kapi.kakao.com";
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    
    public int insert(KakaoPayDTO dto) {
    	return dao.insert(dto);
    }
    
    public List<KakaoPayDTO> selectByUid(int uid) {
        return dao.selectByUid(uid);
     }
     
    
    public String kakaoPayReady(int partner_order_id) {
 
        RestTemplate restTemplate = new RestTemplate();
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "01751cb642452a6612af3c29de4105e7");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
       
         
        KakaoPayDTO dto = dao.selectByUid(partner_order_id).get(0);
  
        params.add("partner_order_id", dto.getPartner_order_id());
        params.add("partner_order_id",dto.getPartner_order_id());
        params.add("partner_user_id", dto.getPartner_user_id());
        params.add("quantity", dto.getQuantity());
        params.add("total_amount", dto.getTotal_amount());
        
        
//        // 필수로 들어가는 내용
        params.add("cid", "TC0ONETIME");
        params.add("approval_url", "http://localhost:8092/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8092/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8092/kakaoPaySuccessFail");
        params.add("item_name", "QR뱃지");
        params.add("tax_free_amount", "0");    
        
////        // 변동 가능한 내용
//        params.add("partner_order_id", "1001");
//        params.add("partner_user_id", "최민석");
//        params.add("quantity", "1");
//        params.add("total_amount", "2100");
        
        
 
         HttpEntity<MultiValueMap<String, Object>> body = new HttpEntity<MultiValueMap<String, Object>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            log.info("" + kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token, int partner_order_id) {
 
        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "01751cb642452a6612af3c29de4105e7");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
        
        KakaoPayDTO dto = dao.selectByUid(partner_order_id).get(0);
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id",dto.getPartner_order_id());
        params.add("partner_user_id", dto.getPartner_user_id());
        params.add("pg_token", pg_token);
        params.add("total_amount", dto.getTotal_amount());
        
        HttpEntity<MultiValueMap<String, Object>> body = new HttpEntity<MultiValueMap<String, Object>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
}
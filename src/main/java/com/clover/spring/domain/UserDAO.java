package com.clover.spring.domain;

import java.util.List;

public interface UserDAO {

	// 사용자 추가
	int addUser(UserDTO user);
	
	// 사용자 삭제
	int deleteUser(UserDTO user);
	
	// 특정 사용자 권한 삭제
	int deleteAuth(String id, String auth);
	
	// 특정 사용자 권한(들) 전부 삭제
	int deleteAuths(String id);
	
	// 특정 id (username) 의 사용자 찾기
	UserDTO findById(String id);
	
	public String findNameByUserId(String id);
	
	// 특정 id (username) 의 권한(들) 뽑기
	List<String> selectAuthoritiesById(String id);
	
	List<UserDTO> selectByUid(int uid);

	public abstract List<UserDTO> selectAll();
	
	//아이디 중복확인
	int idCheck(String id);

	public abstract int update(UserDTO dto);
	

	
} // end DAO









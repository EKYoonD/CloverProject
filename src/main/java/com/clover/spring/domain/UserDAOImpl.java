package com.clover.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	private UserDAO mapper;
	
	@Autowired
	public UserDAOImpl(SqlSession sqlSession) {
		System.out.println("UserDAOImpl() 생성");
		mapper = sqlSession.getMapper(UserDAO.class);
	}
	
	@Override
	public int addUser(UserDTO user) {
		return mapper.addUser(user);
	}

	@Override
	public int deleteUser(UserDTO user) {
		return mapper.deleteUser(user);
	}

	@Override
	public int deleteAuth(String id, String auth) {
		return mapper.deleteAuth(id, auth);
	}

	@Override
	public int deleteAuths(String id) {
		return mapper.deleteAuths(id);
	}
	
	@Override
	public UserDTO findById(String id) {
		return mapper.findById(id);
	}
	
	@Override
	public String findNameByUserId(String id) {
		return mapper.findNameByUserId(id);
	}

	@Override
	public List<String> selectAuthoritiesById(String id) {
		return mapper.selectAuthoritiesById(id);
	}

	

}

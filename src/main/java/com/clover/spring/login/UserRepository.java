package com.clover.spring.login;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.clover.spring.domain.UserDTO;

@Repository
public interface UserRepository extends JpaRepository<UserDTO, Long> {
	Optional<UserDTO> findByEmail(String email);
}
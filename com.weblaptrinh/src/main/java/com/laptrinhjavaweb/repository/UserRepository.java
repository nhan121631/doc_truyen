package com.laptrinhjavaweb.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.UserEntity;


public interface UserRepository extends JpaRepository<UserEntity, Long>{

	UserEntity findOneByUserNameAndStatus(String name, int status);
    Optional<UserEntity> findByUserName(String username);


}

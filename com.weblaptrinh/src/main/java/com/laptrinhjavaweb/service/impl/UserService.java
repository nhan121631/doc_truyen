package com.laptrinhjavaweb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;

import java.util.Collections;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    
    public boolean isUsernameExists(String username) {
        return userRepository.findByUserName(username).isPresent();
    }


    public void save(UserEntity user) {
        System.out.println("Username: " + user.getUserName());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setStatus(1);  
        RoleEntity userRole = roleRepository.findByCode("USER");
        user.setRoles(Collections.singletonList(userRole));

        userRepository.save(user);  // Lưu người dùng vào cơ sở dữ liệu
    }
}

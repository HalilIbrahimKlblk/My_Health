package com.my_health.services.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.my_health.exception.UserNotFoundException;
import com.my_health.exception.InvalidPasswordException;

import com.my_health.dto.DtoUser;
import com.my_health.dto.DtoUserHome;
import com.my_health.dto.DtoUserLogin;
import com.my_health.dto.DtoUserResponse;
import com.my_health.entities.User;
import com.my_health.model.Role;
import com.my_health.repository.UserRepository;
import com.my_health.services.IUserServices;

@Service
public class UserServicesImpl implements IUserServices{

	@Autowired 
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public DtoUserResponse saveUser(DtoUser dtoUser) {
		User user = new User();
		
		user.setName(dtoUser.getName());
		user.setSurname(dtoUser.getSurname());
		user.setEmail(dtoUser.getEmail());
		
		String rawPassword = dtoUser.getPassword();
		String hashedPassword = passwordEncoder.encode(rawPassword);
		user.setPassword(hashedPassword);
		
		user.setRole(Role.USER);
		
		user.setPatientCode(generateUniquePatientCode());
		
		User savedUser = userRepository.save(user);
		
		DtoUserResponse response = new DtoUserResponse();
	    response.setId(savedUser.getId());
	    response.setName(savedUser.getName());
	    response.setSurname(savedUser.getSurname());
	    response.setEmail(savedUser.getEmail());
	    response.setRole(savedUser.getRole());
	    response.setPatientCode(savedUser.getPatientCode());
	    response.setCreatedAt(savedUser.getCreatedAt());
	    
	    return response;
	}
	
	@Override
	public DtoUserHome login(DtoUserLogin dtoUserLogin) {
		User user = userRepository.findByEmail(dtoUserLogin.getEmail())
				.orElseThrow(() -> new UserNotFoundException("Kullanıcı bulunamadı"));
		
		if (!passwordEncoder.matches(dtoUserLogin.getPassword(), user.getPassword())) {
			throw new InvalidPasswordException("Şifre yanlış");
        }
		
		if (!user.getRole().name().equals("USER")) {
            throw new RuntimeException("Bu kullanıcı giriş yapamaz");
        }
		
		DtoUserHome response = new DtoUserHome();
		response.setId(user.getId());
        response.setName(user.getName());
        response.setRole(user.getRole()); 

        response.setBirthDate(user.getBirthDate());
        response.setHeight(user.getHeight());   
        response.setWeight(user.getWeight()); 
        response.setGender(user.getGender());
        response.setProfile_img(user.getProfile_img());

        return response;
	}
	
	@Override
	public void deleteUser(Integer id) {
		Optional<User> optional = userRepository.findById(id);
		if(optional.isPresent()) {
			userRepository.delete(optional.get());
		}
	}
	
	private String generateUniquePatientCode() {
	    String code;
	    do {
	        int randomNumber = (int)(Math.random() * 1000000); 
	        code = String.format("%06d", randomNumber);  
	    } while(userRepository.existsByPatientCode(code)); 
	    return code;
	}
}



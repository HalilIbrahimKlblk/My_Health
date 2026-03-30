package com.my_health.controller.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my_health.controller.IUserController;
import com.my_health.dto.DtoUser;
import com.my_health.dto.DtoUserHome;
import com.my_health.dto.DtoUserLogin;
import com.my_health.dto.DtoUserResponse;
import com.my_health.services.IUserServices;

import jakarta.validation.Valid;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/my-health/v1/user")
public class UserControllerImpl implements IUserController{

	@Autowired
	private IUserServices userServices;
	
	@PostMapping(path = "/save")
	public DtoUserResponse saveUser(@RequestBody @Valid DtoUser dtoUser) {
		return userServices.saveUser(dtoUser);
	}
	
	@PostMapping(path = "/login")
	public DtoUserHome login(@RequestBody DtoUserLogin dtoUserLogin) {
		return userServices.login(dtoUserLogin);
	}
	
	@DeleteMapping(path = "/delete/{id}")
	@Override
	public void deleteUser(@PathVariable Integer id) {
		userServices.deleteUser(id);
	}
}

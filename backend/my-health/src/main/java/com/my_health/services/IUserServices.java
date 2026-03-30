package com.my_health.services;

import com.my_health.dto.DtoUser;
import com.my_health.dto.DtoUserHome;
import com.my_health.dto.DtoUserLogin;
import com.my_health.dto.DtoUserResponse;

public interface IUserServices {
	public DtoUserResponse saveUser(DtoUser dtoUser);
	
	public DtoUserHome login(DtoUserLogin dtoUserLogin);
	
	public void deleteUser(Integer id);
}

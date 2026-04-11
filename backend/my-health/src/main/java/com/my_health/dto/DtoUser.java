package com.my_health.dto;

import com.my_health.model.Role;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DtoUser {
	private Integer id;
	private String name;
	private String surname;
	private Role role;
	private String email;
	private String password;
}

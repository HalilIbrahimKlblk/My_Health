package com.my_health.dto;

import java.time.LocalDate;

import com.my_health.model.Gender;
import com.my_health.model.Role;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DtoUserHome {
	private Integer id;
	private String name;
	private LocalDate birthDate;
	private Double height;
	private Double weight;
	private Gender gender;
	private String profile_img;
	private Role role;
}

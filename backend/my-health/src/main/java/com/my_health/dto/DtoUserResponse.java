package com.my_health.dto;

import java.time.LocalDateTime;

import com.my_health.model.Role;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DtoUserResponse {
	private Integer id;
	private String name;
	private String surname;
	private String email;
	private Role role;
    private String patientCode;
    private LocalDateTime createdAt;
}

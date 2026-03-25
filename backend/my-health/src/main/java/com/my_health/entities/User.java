package com.my_health.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import com.my_health.model.Gender;
import com.my_health.model.Role;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "User")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "patientCode", unique = true, nullable = false)
	private String patientCode;
	
	@Column(name = "name", nullable = false, length = 20)
	private String name;
	
	@Column(name = "surname", nullable = false, length = 20)
	private String surname;
	
	@Column(name = "birth_date", length = 10)
    private LocalDate birthDate;
	
	@Column(name = "height", length = 3)
	private Double height;
	
	@Column(name = "weight", length = 3)
	private Double weight;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "gender")
    private Gender gender;
	
	@Column(name = "profile_img", length = 50)
	private String profile_img;
	
	@Column(name = "email", nullable = false, unique = true)
    private String email;
	
	@Column(name = "password", nullable = false)
	private String password;
	
	@Column(name = "phone_number", unique = true)
    private String phoneNumber;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "role", nullable = false)
    private Role role;
	
	@CreationTimestamp
    @Column(name = "createdAt", updatable = false)
    private LocalDateTime createdAt;
}

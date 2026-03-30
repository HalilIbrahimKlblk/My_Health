package com.my_health.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.my_health.entities.User;


@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	boolean existsByPatientCode(String patientCode);
	Optional<User> findByEmail(String email);
}

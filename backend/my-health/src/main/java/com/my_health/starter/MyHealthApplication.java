package com.my_health.starter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.persistence.autoconfigure.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = {"com.my_health"})
@ComponentScan(basePackages = {"com.my_health"})
@EnableJpaRepositories(basePackages = {"com.my_health"})
public class MyHealthApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyHealthApplication.class, args);
	}

}

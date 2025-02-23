package com.jtspringproject.JtSpringProject;

import javax.persistence.Entity;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;

@SpringBootApplication(exclude = HibernateJpaAutoConfiguration.class)
@EntityScan(basePackages = "com.jtspringproject.JtSpringProject.models")
public class JtSpringProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(JtSpringProjectApplication.class, args);
	}

}

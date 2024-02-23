package com.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.project", "com.controller"})
public class PortFolioProject2Application {

	public static void main(String[] args) {
		SpringApplication.run(PortFolioProject2Application.class, args);
	}

}
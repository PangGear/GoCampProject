package com.project.login;

import lombok.Data;

@Data
public class LoginVO {
  private String idx;
  private String username;
  private String password;
  private String role; 
  private String postcode;
  private String roadAddress;
  private String detailAddress;
  private String tel;
  private String name;
  private String registration;  
}

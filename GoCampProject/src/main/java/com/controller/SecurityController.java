package com.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.login.LoginService;
import com.project.login.LoginVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class SecurityController {
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("login.do")
	 String login() {		
		System.out.println("===> index.do");
	   return "/login/login.jsp";
	}
	
	@GetMapping("logout.do")
	 String logout() {
		System.out.println("===> logout.do");
	   return "/login/logout.jsp";	
	}
	
	@GetMapping("loginSuccess.do")
	 String loginSuccess(Principal user) {
		
		System.out.println("===> loginSuccess.do: "+user.getName());
		
		LoginVO vo = new LoginVO();
		vo.setUsername(user.getName());
				
		session.setAttribute("session",service.loginOK(vo));
		
	   return "/login/loginSuccess.jsp";
	}
	
	@GetMapping("accessDenied.do")
	 String accessDenied() {		
		System.out.println("===> accessDenied.do");
	   return "/login/accessDenied.jsp";		
	}
	
	@GetMapping("getLoginList.do")
	 String getLoginList(Model model, LoginVO vo) {
		System.out.println("===> getLoginList.do");
		model.addAttribute("li", service.getLoginList(vo));
		
	   return "/admin/getLoginList.jsp";
	}
	
	@GetMapping("/memberInsert.do")
	String memberInsert() {
		
		return "/guest/memberInsert.jsp";
	}
	
	@PostMapping("/memberInsert.do")
	String memberInsert(LoginVO vo) {
		
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		service.memberInsert(vo);
		
		return "redirect:login.do";
	}
	

	//http에 데이터를 JSON으로 직접 반환하기 위해 사용.
	@ResponseBody
	@PostMapping("/checkID.do")
	 int checkID(@RequestBody LoginVO vo) {
		
		// ID 입력 안되었을 시 -1 반환
		if(vo.getUsername().equals("")) return -1;
		
		int res = service.checkID(vo);
	   return res;
	}
	
	@GetMapping("getLogin.do")
	public String getLogin(Model model, LoginVO vo){
		
		model.addAttribute("m", service.getLogin(vo));
		
		return "/admin/getLogin.jsp";
	}
	
	@PostMapping("memberUpdate.do")
	public String memberUpdate(LoginVO vo){
		
		service.memberUpdate(vo);
		
		return "redirect:getLoginList.do";
		}
	
	@PostMapping("memberDelete.do")
	public String memberDelete(){
		
		service.memberDelete();
		
		return "redirect:getLoginList.do";
		}
}

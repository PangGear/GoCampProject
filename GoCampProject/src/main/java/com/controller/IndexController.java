package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.board.BoardService;
import com.project.board.BoardVO;

@Controller
public class IndexController {
	IndexController(){
		System.out.println("===>TestController ");
	}
	
	@Autowired
	private BoardService service;
	
	@GetMapping("index.do")
	 String index(Model model, BoardVO vo) {		
		System.out.println("===> index.do");
		model.addAttribute("li", service.getBoardList(vo));
	   return "index.jsp";		
	}
}
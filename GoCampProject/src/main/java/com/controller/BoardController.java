package com.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.project.board.BoardService;
import com.project.board.BoardVO;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping("getBoard.do")
	String getBoard(BoardVO vo, Model model
			) {
		
		System.out.println(service.getBoard(vo));
		service.cnt(vo);
		model.addAttribute("m", service.getBoard(vo));
		
		return "/board/getBoard.jsp";
	}

	@GetMapping("boardInsert.do")
	 String memberInsert(@RequestParam String facility,
						 @RequestParam String telephone,
						 @RequestParam String roadAddress, Model model) {
		
		model.addAttribute("facility", facility);
		model.addAttribute("telephone", telephone);
		model.addAttribute("roadAddress", roadAddress);
		
	   return "/manager/boardInsert.jsp";		
	}
	
	@PostMapping("boardInsert.do")
	 String memberInsert(BoardVO vo) throws Exception, IOException {			

		String path = request.getSession().getServletContext().getRealPath("/board/introduceImg/");
		System.out.println("path:" + path);		
		
		// 중복을 위한 시간부여
		long time = System.currentTimeMillis();
		SimpleDateFormat format = new SimpleDateFormat("HHmmss");
		String timeStr = format.format(time);
		
		MultipartFile file = vo.getFile(); // 파일
		String fileName = file.getOriginalFilename();
		File f = new File(path + fileName); // 경로 안에 있는 파일
		if(!file.isEmpty()) {
			if(f.exists()) {
				String onlyFileName = fileName.substring(0,fileName.lastIndexOf("."));
				String ext = fileName.substring(fileName.lastIndexOf("."));
				fileName = onlyFileName +"_" +timeStr +ext;
			}
			// 실제 파일 저장
			file.transferTo(new File(path + fileName));	
		}else {
			fileName = "space.png";
		}
				
		vo.setImg(fileName);  // Table 에 파일 이름 저장		
		service.boardInsert(vo);	
		
	   return "redirect:/index.do";
	}
	

}

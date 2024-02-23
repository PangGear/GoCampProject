package com.project.board;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {

	private int boardidx;
	private String title;
	private String content;
	private String facility;
	private String roadAddress;
	private String telephone;
	private int cnt;
	private String img;
	private String inst_date;
	private MultipartFile file;
}
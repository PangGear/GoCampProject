package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.project.booking.BookingService;
import com.project.booking.BookingVO;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BookingController {

	@Autowired
	private BookingService service;
	
	@GetMapping("getBookingList.do")
	String getBookingList(Model model, BookingVO vo) {
		
		model.addAttribute("li",service.getBookingList(vo));
		return "/manager/getBookingList.jsp";
	}
	
	@GetMapping("getBooking.do")
	String getBooking(Model model, BookingVO vo) {
		
		model.addAttribute("li",service.memberBookingList(vo));
		
		return "/member/getBooking.jsp";
	}
	
	@GetMapping("bookingInsert.do")
	String bookingInsert(@RequestParam String facility,
						@RequestParam String longitude,
						@RequestParam String latitude,
						@RequestParam String telephone,
						@RequestParam String homepage,
						Model model) {
		
		model.addAttribute("facility", facility);
		model.addAttribute("longitude", longitude);
		model.addAttribute("latitude", latitude);
		model.addAttribute("telephone", telephone);
		model.addAttribute("homepage", homepage);
		
		return "/member/bookingInsert.jsp";
	}
	
	@PostMapping("bookingInsert.do")
	String bookingInsert(BookingVO vo) {
		
		service.bookingInsert(vo);
		
		return "redirect:getCampList.do";
	}
	
	@GetMapping("memberBooking.do")
	String bookingUpdate(Model model, BookingVO vo,
			@RequestParam("username") String username) {
		
		model.addAttribute("m",service.memberBooking(vo));
		
		return "/member/memberBooking.jsp";
	}
	
	@GetMapping("bookingUpdate.do")
	String bookingUpdate(@RequestParam("bookidx") int bookidx, BookingVO vo) {
		
	    service.bookingUpdate(vo);
		
	    return "redirect:getBooking.do";
	}
	
	@GetMapping("getBookingListDelete.do")
	String getBookingListDelete(@RequestParam("bookidx") int bookidx) {
		
		service.getBookingListDelete(bookidx);
		return "redirect:getBookingList.do";
	}
	
	@GetMapping("getBookingDelete.do")
	String getBookingDelete(@RequestParam("bookidx") int bookidx) {
		
		service.getBookingDelete(bookidx);
		return "redirect:getCampList.do";
	}
}

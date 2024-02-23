package com.project.booking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingServiceImpl implements BookingService{
	
	@Autowired
	private BookingDao dao;

	@Override
	public List<BookingVO> getBookingList(BookingVO vo) {
		
		return dao.getBookingList(vo);
	}

	@Override
	public List<BookingVO> memberBookingList(BookingVO vo) {
		
		return dao.memberBookingList(vo);
	}

	@Override
	public void bookingInsert(BookingVO vo) {
		
		dao.bookingInsert(vo);
	}

	@Override
	public void bookingUpdate(BookingVO vo) {
		
		dao.bookingUpdate(vo);
	}

	@Override
	public void getBookingDelete(int bookidx) {
		
		dao.getBookingDelete(bookidx);
	}

	@Override
	public void getBookingListDelete(int bookidx) {
		
		dao.getBookingListDelete(bookidx);
	}

	@Override
	public BookingVO memberBooking(BookingVO vo) {
		
		return dao.memberBooking(vo);
	}

}

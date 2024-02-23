package com.project.booking;

import java.util.List;

public interface BookingService {

	List<BookingVO> getBookingList(BookingVO vo);
	List<BookingVO> memberBookingList(BookingVO vo);
	BookingVO memberBooking(BookingVO vo);
	
	void bookingInsert(BookingVO vo);
	void bookingUpdate(BookingVO vo);
	void getBookingDelete(int bookidx);
	void getBookingListDelete(int bookidx);
	
}

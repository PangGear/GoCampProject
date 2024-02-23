package com.project.booking;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingDao {
	
	List<BookingVO> getBookingList(BookingVO vo);
	List<BookingVO> memberBookingList(BookingVO vo);
	BookingVO memberBooking(BookingVO vo);
	
	void bookingInsert(BookingVO vo);
	void bookingUpdate(BookingVO vo);
	void getBookingDelete(int bookidx);
	void getBookingListDelete(int bookidx);

}

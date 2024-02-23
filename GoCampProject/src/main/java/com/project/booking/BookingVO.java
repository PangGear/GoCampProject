package com.project.booking;

import lombok.Data;

@Data
public class BookingVO {

    private String facility;
    private String latitude;
    private String longitude;
    private String telephone;
    private String homepage;
	
    private int bookidx;
    private String username;
    private String name;
    private String tel;
    private String postcode;
    private String roadAddress;
    private String detailAddress;
    private String startDate;
    private String endDate;
    private int person;
    private int fire;
    private int meat;
    
    private String ch1;
    private String ch2;
    
	private int pageSize;
	private int start;
	private int totalCount;
}

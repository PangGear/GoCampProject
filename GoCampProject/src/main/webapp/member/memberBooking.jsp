<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/include/top.jsp" />
<link href="/include/table.css" rel="stylesheet" type="text/css" />
<section>
    <br>
    <div align="center">
        <h1>예약 상세보기/수정</h1>
    </div>
    <br>
    <div align="center">
    	<form action="bookingUpdate.do">
    	<input type="hidden" name=bookidx value="${m.bookidx}">
		        <table border="1">
		                <tr><td class="tr1">예약번호</td><td class="td" width="100">${m.bookidx}</td></tr>
		                <tr><td class="tr1">시설명</td><td class="td" width="300">${m.facility}</td></tr>
		                <tr><td class="tr1">성함</td><td class="td" width="200"><input type="text" width="400" name="name" value="${m.name}"></td></tr>
		                <tr><td class="tr1">전화번호</td><td class="td" width="150"><input type="text" width="400" name="tel" value="${m.tel}"></td></tr>
		                <tr><td class="tr1">입실날짜</td><td class="td" width="170">${m.startDate}</td></tr>
		                <tr><td class="tr1">퇴실날짜</td><td class="td" width="170">${m.endDate}</td></tr>
		                <tr><td class="tr1">장작</td>
						<td>
						    <label>
						        <input type="radio" id="radio_fire_select" name="fire" value="1" ${m.fire == 1 ? 'checked' : ''}> 선택
						    </label>
						    <label>
						        <input type="radio" id="radio_fire_no" name="fire" value="0" ${m.fire == 0 ? 'checked' : ''}> 선택 안함
						    </label>
						</td></tr>
		                <tr><td class="tr1">고기</td>
						<td>
						    <label>
						        <input type="radio" id="radio_meat_select" name="meat" value="1" ${m.meat == 1 ? 'checked' : ''}> 선택
						    </label>
						    <label>
						        <input type="radio" id="radio_meat_no" name="meat" value="0" ${m.meat == 0 ? 'checked' : ''}> 선택 안함
						    </label>
						</td></tr>
						<tr>
						<td class="tr1"> 인원수 </td>
						<td colspan="3">
						    &nbsp;
						    <select name="person">
						        <option value="1" ${m.person == 1 ? 'selected' : ''}>1명</option>
						        <option value="2" ${m.person == 2 ? 'selected' : ''}>2명</option>
						        <option value="3" ${m.person == 3 ? 'selected' : ''}>3명</option>
						        <option value="4" ${m.person == 4 ? 'selected' : ''}>4명</option>
						        <option value="5" ${m.person == 5 ? 'selected' : ''}>5명</option>
						        <option value="6" ${m.person == 6 ? 'selected' : ''}>6명</option>
						    </select>
						</td></tr>
		                <tr><td class="tr1" colspan="2">
		                <input type="submit" value="예약수정">
		                </td></tr>
		        </table>
		    </form>
        <br>
    </div>
</section>
<c:import url="/include/bottom.jsp" />
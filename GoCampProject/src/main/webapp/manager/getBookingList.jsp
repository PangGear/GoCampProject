<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/include/top.jsp" />
<link href="/include/table.css" rel="stylesheet" type="text/css" />
<section>
    <br>
    <div align="center">
        <h1>전체회원 예약목록 관리</h1>
    </div>
    <br>
    <div align="center">
        <table border="1">
            <tr>
                <td class="tr1">예약번호</td>
                <td class="tr1">시설명</td>
                <td class="tr1">성함</td>
                <td class="tr1">전화번호</td>
                <td class="tr1">입실날짜</td>
                <td class="tr1">퇴실날짜</td>
                <td class="tr1">장작</td>
                <td class="tr1">고기</td>
                <td class="tr1">예약취소</td>
            </tr>
            <c:forEach items="${li}" var="m">
                <tr>
                    <td class="td" width="100">${m.bookidx}</td>
                    <td class="td" width="200">
                        <input type="text" width="400" value="${m.facility}">
                    </td>
                    <td class="tr1" width="80">${m.name}</td>
                    <td class="tr1" width="100">${m.tel}</td>
                    <td class="tr1" width="100">${m.startDate}</td>
                    <td class="tr1" width="100">${m.endDate}</td>
                    <td class="tr1" width="80">${m.fire==1 ? '선택':'미선택'}</td>
                    <td class="tr1" width="80">${m.meat==1 ? '선택':'미선택'}</td>
                    <td class="tr1" width="100" align="center">
                        <input type="button" value="취소하기" class="cancelBooking" data-bookidx="${m.bookidx}">
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br>
    </div>
</section>
<c:import url="/include/bottom.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 예약취소기능
        var buttons = document.querySelectorAll('.cancelBooking');
        buttons.forEach(function(button) {
            button.addEventListener('click', function() {
                var bookidx = this.getAttribute('data-bookidx');
                var confirmation = confirm("취소하시겠습니까?");
                
                if (confirmation) {
                    window.location.href = 'getBookingListDelete.do?bookidx=' + bookidx;
                } else {
                    alert("취소되었습니다.");
                }
            });
        });
    });
</script>
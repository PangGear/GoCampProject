<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/include/top.jsp" />
<link href="/include/table.css" rel="stylesheet" type="text/css" />
<section>
    <br>
    <div align="center">
        <h1>예약목록</h1>
    </div>
    <br>
    <div align="center">
        <table border="1">
            <tr>
                <td class="tr1">예약번호</td>
                <td class="tr1">시설명</td>
                <td class="tr1">성함</td>
                <td class="tr1">입실날짜</td>
                <td class="tr1">퇴실날짜</td>
                <td class="tr1">예약수정</td>
                <td class="tr1">예약취소</td>
            </tr>
            <c:forEach items="${li}" var="m">
                <tr>
                    <td class="tr1" width="80">${m.bookidx}</td>
                    <td class="tr1" width="200">
                        <input type="text" width="400" value="${m.facility}">
                    </td>
                    <td class="tr1" width="80">${m.name}</td>
                    <td class="tr1" width="100">${m.startDate}</td>
                    <td class="tr1" width="100">${m.endDate}</td>
                    <td class="tr1" width="80" align="center">
                    <input type="button" value="수정하기" class="updateBooking" data-username="${m.username}" data-bookidx="${m.bookidx}" data-start-date="${m.startDate}">
                    </td>
                    <td class="tr1" width="80" align="center">
                    <input type="button" value="취소하기" class="cancelBooking" data-bookidx="${m.bookidx}" data-start-date="${m.startDate}">
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
                var startDate = new Date(this.getAttribute('data-start-date'));
                var today = new Date();

                if (startDate < today) {
                    alert('이 예약은 이미 만료되었습니다.');
                } else {
                    var confirmation = confirm("취소하시겠습니까?");
                    
                    if (confirmation) {
                        window.location.href = 'getBookingDelete.do?bookidx=' + bookidx;
                    } else {
                        alert("취소되었습니다.");
                    }
                }
            });
        });
        
        // 예약수정기능
        var updateButtons = document.querySelectorAll('.updateBooking');
        updateButtons.forEach(function(button) {
            button.addEventListener('click', function() {
                var username = this.getAttribute('data-username');
                var bookidx = this.getAttribute('data-bookidx');
                // 여기에서 username과 bookidx를 사용하여 getBookingUpdate.do로 이동
                window.location.href = 'memberBooking.do?username=' + username + '&bookidx=' + bookidx;
            });
        });
    });
</script>
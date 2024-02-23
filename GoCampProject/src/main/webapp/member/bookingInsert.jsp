<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:import url="/include/top.jsp" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="/include/table.css" rel="stylesheet" type="text/css" />
<section>
    <br>
    <div align="center">
        <h2> 예약하기 </h2>
			<form method="post">
			    <table border="1">
			        <tr class=tr1>
			            <td colspan="4" align="center">
			                <div style="width: 100%; height: 500px;" id="map"></div>
			            </td>
			        </tr>
			        <tr class=tr1>
			            <td colspan="4" class=tr1>시설 정보</td>
			        </tr>
			        <tr class=tr1>
			            <td> 시설명 </td>
			            <td colspan="3" class=td1>&nbsp;<input type="text" value="${facility}"/></td>
			        </tr>
			        <tr class=tr1>
			            <td> 홈페이지 </td>
			            <td colspan="3">&nbsp;
					    <c:choose>
					        <c:when test="${not empty homepage and not homepage eq '정보없음'}">
					            <a href="${homepage}" target="_blank">${homepage}</a>
					        </c:when>
					        <c:otherwise>
					            정보없음
					        </c:otherwise>
					    </c:choose>
					</td>
			        </tr>
			        <tr class=tr1>
			            <td> 전화번호 </td>
			            <td colspan="3">&nbsp;<input type="text" value="${telephone}" size="20"/></td>
			        </tr>
			        <tr class=tr1>
			            <td> 위도 </td>
			            <td>&nbsp;${latitude}</td>
			            <td> 경도 </td>
			            <td>&nbsp;${longitude}</td>
			        </tr>
			        <tr class=tr1>
			            <td colspan="4" class=tr1>예약자 정보</td>
			        </tr>
			        <tr class=tr1>
			            <td> ID </td>
			            <td colspan="3">&nbsp;<input type="text" id="username" name="username" value="${session.username}" /></td>
			        </tr>
			        <tr class=tr1>
			            <td> 성함 </td>
			            <td colspan="3">&nbsp;<input type="text" id="name" name="name" value="${session.name}"/></td>
			        </tr>
			        <tr class=tr1>
			            <td> 전화번호</td>
			            <td colspan="3">&nbsp;<input type="text" name="tel" size="30" value="${session.tel}"/></td>
			        </tr>
			        <tr class=tr1>
			            <td> 주소</td>
			            <td colspan="3">
			                &nbsp;<input type="text" name="postcode" id="postcode" placeholder="우편번호" value="${session.postcode}">
			                <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			                &nbsp;<input type="text" name="roadAddress" id="roadAddress" placeholder="주소" size="50" value="${session.roadAddress}"><br>
			                &nbsp;<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="${session.detailAddress}">
			                <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
			            </td>
			        </tr>
					<tr class=tr1>
					    <td> 예약일 </td>
					    <td colspan="3">&nbsp;<input type="text" id="startDate" name="startDate" size="10"> ~ 
					    					<input type="text" id="endDate" name="endDate" size="10">
					    </td>
					</tr>
			        <tr class=tr1>
			            <td> 인원수 </td>
			            <td colspan="3">
			            &nbsp;
			            <select name="person">
				            <option value="1">1명</option>
				            <option value="2" selected>2명</option>
				            <option value="3">3명</option>
				            <option value="4">4명</option>
				            <option value="5">5명</option>
				            <option value="6">6명</option>
			            </select>
			            </td>
			        </tr>
			        <tr class=tr1><td colspan="4" class=tr1>필요시 선택해 주세요 *추가요금 발생</td></tr>
					<tr class=tr1>
					    <td>장작</td>
					    <td>
					        <label>
					            <input type="radio" id="radio_fire_select" name="fire" value="1"> 선택
					        </label>
					        <label>
					            <input type="radio" id="radio_fire_no" name="fire" value="0" checked> 선택 안함
					        </label>
					    </td>
					    <td>고기</td>
					    <td>
					        <label>
					            <input type="radio" id="radio_meat_select" name="meat" value="1"> 선택
					        </label>
					        <label>
					            <input type="radio" id="radio_meat_no" name="meat" value="0" checked> 선택 안함
					        </label>
					    </td>
					</tr>
			        <tr class=tr1>
			            <td colspan="4" class="tr1">
			                <input type="submit" value="예약하기">
			            </td>
			        </tr>
			    </table>
			</form>
    </div>
    <br>
</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=524a2522168af43f6aa3f54379d9762f"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${latitude}, ${longitude}), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${latitude}, ${longitude}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;"> ${facility} <br><a href="https://map.kakao.com/link/map/${facility} ,${latitude}, ${longitude}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${facility},${latitude}, ${longitude}" style="color:blue" target="_blank">길찾기</a></div>', 
    iwPosition = new kakao.maps.LatLng(${latitude}, ${longitude}); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
<script>
	$(function () {
	    // Datepicker 초기화
	    $('#startDate, #endDate').daterangepicker({
	        autoUpdateInput: false,
	        linkedCalendars: true, // 시작일과 끝일을 연결하는 옵션
	        locale: {
	            cancelLabel: 'Clear'
	        }
	    });
	
	    // 날짜 범위가 선택되었을 때
	    $('#startDate, #endDate').on('apply.daterangepicker', function (ev, picker) {
	        var startDate = picker.startDate.format('YYYY-MM-DD');
	        var endDate = picker.endDate.format('YYYY-MM-DD');
	
	        // 시작일(Datepicker)
	        if ($(this).attr('id') === 'startDate') {
	            $(this).val(startDate);
	            
	            // 끝일(Datepicker)
	            $('#endDate').data('daterangepicker').setStartDate(picker.endDate);
	            $('#endDate').data('daterangepicker').setEndDate(picker.endDate);
	            $('#endDate').val(endDate);
	        }
	    });
	
	    // 날짜가 클리어되었을 때
	    $('#startDate, #endDate').on('cancel.daterangepicker', function (ev, picker) {
	        $(this).val('');
	    });
	});
</script>
<c:import url="/include/bottom.jsp" />
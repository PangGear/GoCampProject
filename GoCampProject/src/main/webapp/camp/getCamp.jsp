<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:import url="/include/top.jsp" />
<section>
<br>
<div align="center">
<h1>캠핑장목록</h1>
</div>
<br>
<div align="center">
	<form action="/bookingInsert.do" method="get">
	<input type="hidden" name="facility" value="${m.facility}">
	<input type="hidden" name="latitude" value="${m.latitude}">
	<input type="hidden" name="longitude" value="${m.longitude}">
	<input type="hidden" name="facilityInfo" value="${m.facilityInfo}">
	<input type="hidden" name="telephone" value="${m.telephone}">
	<input type="hidden" name="homepage" value="${m.homepage}">
	<input type="hidden" name="roadAddress" value="${m.roadAddress}">
		<table border="1" id="table1">
			<tr>
				<td colspan="4" align="center">
				<div style="width:100%; height:500px;" id="map"></div>
				</td>
			</tr>
			<tr>
			<td colspan="2">시설명</td>
			<td colspan="2">${m.facility}</td>
			</tr>
			<tr>
			<td colspan="2">주소</td>
			<td colspan="2">${m.roadAddress}</td>
			</tr>
			<tr>
			<td colspan="2">전화번호</td>
			<td colspan="2">${m.telephone}</td>
			</tr>
			<tr>
			<td colspan="2">홈페이지</td>
			<td colspan="2"><a href="${m.homepage}" target="_blank">${m.homepage}</a></td>
			</tr>
			<tr>
			    <td colspan="2">시설소개</td>
			    <td colspan="2">
			        <textarea id="facilityInfo" rows="10" cols="50">${m.facilityInfo}</textarea>
			    </td>
			</tr>
			<tr>
			<td colspan="2" >시설특징</td>
			<td colspan="2" >${m.facilityFeature}</td>
			</tr>
			<tr>
			<td>위도</td><td>${m.latitude}</td>
			<td>경도</td><td>${m.longitude}</td>
			<tr>
			<td colspan="4" align="center"><input type="submit" value="예약하기">
	            <c:if test="${session.role == 'ROLE_ADMIN' or session.role == 'ROLE_MANAGER'}">
	                <input type="button" value="소개글 작성" onclick="submitWithCampgroundInfo()">
	            </c:if>
			</td>
			</tr>
		</table>
	</form>
<br>
</div>
</section>
<c:import url="/include/bottom.jsp" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=524a2522168af43f6aa3f54379d9762f"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${m.latitude}, ${m.longitude}), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${m.latitude}, ${m.longitude}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;"> ${m.facility} <br><a href="https://map.kakao.com/link/map/${m.facility} ,${m.latitude}, ${m.longitude}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${m.facility},${m.latitude}, ${m.longitude}" style="color:blue" target="_blank">길찾기</a></div>', 
    iwPosition = new kakao.maps.LatLng(${m.latitude}, ${m.longitude}); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>

<script>
    // 소개글 작성 버튼을 누를 때 호출되는 함수
    function submitWithCampgroundInfo() {
        // 선택된 캠핑장 정보를 가져와서 폼에 추가
        var form = document.forms[0]; // 첫 번째 폼 선택
        var campgroundInfoFields = ['facility', 'telephone', 'roadAddress'];

        for (var i = 0; i < campgroundInfoFields.length; i++) {
            var field = campgroundInfoFields[i];
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = field;
            input.value = "${m[field]}";
            form.appendChild(input);
        }

        // boardInsert.do로 이동
        form.action = "/boardInsert.do";
        form.submit();
    }
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jstl/core_rt"  prefix="c" %>     
<c:import url="/include/top.jsp"/>
<style>
.td1 {
 text-align : center; 
}
</style>

<section>
<br>
<div align="center">

<h2> 회원 편집 </h2>

<form action="memberUpdate.do" method="post">
  <table border="1" width="500">
      <tr align="center"><td>회원번호</td>
      <td><input type="text" name="idx" id="idx" value="${m.idx}" readonly></td></tr>
      <tr align="center"><td>ID</td>
      <td><input type="text" name="username" id="username" value="${m.username}" readonly></td></tr>
      <tr align="center"><td>이름</td>
      <td><input type="text" name="name" id="name" value="${m.name}"></td></tr>
      <tr align="center"><td>전화번호</td>
      <td><input type="text" name="tel" id="tel" value="${m.tel}"></td></tr>
      <tr align="center"><td>등급</td><td>
      <input type="radio" name="role" value="ROLE_ADMIN" ${m.role eq 'ROLE_ADMIN' ? 'checked' : ''}> Admin
      <input type="radio" name="role" value="ROLE_MANAGER" ${m.role eq 'ROLE_MANAGER' ? 'checked' : ''}> Manager
      <input type="radio" name="role" value="ROLE_MEMBER" ${m.role eq 'ROLE_MEMBER' ? 'checked' : ''}> Member
      </td></tr>
      <tr><td align="center"> 주소</td><td align="left">
	    &nbsp;<input type="text" name ="postcode" value="${m.postcode}" id="postcode" placeholder="우편번호">
	          <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		&nbsp;<input type="text" name="roadAddress" value="${m.roadAddress}" id="roadAddress" placeholder="주소" size=50><br>
		&nbsp;<input type="text" name="detailAddress" value="${m.detailAddress}" id="detailAddress" placeholder="상세주소">
		<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
		</td></tr>
	  <tr align="center"><td>가입일자</td>
      <td>${m.registration}</td></tr>
      <tr><td colspan="2" align="center">
      <input type="submit" value="편집">
      <input type="button" value="삭제" onclick="deleteMember()">
      </td></tr>
  </table>
</form>

</div>
<br/>
</section>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    
    
    function deleteMember() {
    	  // 확인 팝업 등을 사용하여 사용자에게 삭제 여부를 묻는 등의 작업을 수행할 수 있습니다.
    	  if (confirm("회원을 삭제하시겠습니까?")) {
    	    // 삭제 확인 시, 폼을 동적으로 생성하여 데이터를 memberDelete.do로 전송합니다.
    	    var form = document.createElement("form");
    	    form.action = "memberDelete.do";
    	    form.method = "post";

    	    var usernameInput = document.createElement("input");
    	    usernameInput.type = "hidden";
    	    usernameInput.name = "username";
    	    usernameInput.value = "${m.username}";

    	    form.appendChild(usernameInput);
    	    document.body.appendChild(form);

    	    form.submit();
    	  }
    	}
</script>
<c:import url="/include/bottom.jsp" />
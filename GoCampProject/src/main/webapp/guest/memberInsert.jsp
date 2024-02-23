<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jstl/core_rt"  prefix="c" %>     
<c:import url="/include/top.jsp" />
<style>
table {
  width:480px ; 
  height:250px;
}
</style>
<section>
<br>
<div align="center">

<h2> 회원가입 </h2> 
<form action="/memberInsert.do"  method=post onsubmit="return validateForm()">
<table border=1  >
<tr><td> 회원이름 </td><td>&nbsp;<input type="text" id="name" name="name"/></td></tr>
<tr><td> ID </td><td>&nbsp;<input type="text" id="username" name="username"/><input type="button" onclick="checkID()" value="중복체크"></td></tr>
<tr><td> 암호</td><td>&nbsp;<input type="text" id="password" name="password"/></td></tr>
<tr><td> 암호확인</td><td>&nbsp;<input type="text" id="confirmPassword" name="confirmPassword"/></td></tr>
<tr><td> 전화번호</td><td>&nbsp;<input type="text" name="tel" size=15/></td></tr>
<tr><td> 주소</td><td>
	&nbsp;<input type="text" name ="postcode"  id="postcode" placeholder="우편번호">
	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
	&nbsp;<input type="text" name="roadAddress" id="roadAddress" placeholder="주소" size=50><br>
	&nbsp;<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
	<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
</td></tr>
<tr><td>등급</td><td>
        <label for="admin">Admin</label>
        <input type="radio" id="admin" name="role" value="ROLE_ADMIN">
        <label for="manager">Manager</label>
        <input type="radio" id="manager" name="role" value="ROLE_MANAGER">
        <label for="member">Member</label>
        <input type="radio" id="member" name="role" value="ROLE_MEMBER" checked>
</td></tr>
<tr> 
<td colspan=2 align="center"> 
  <input  type=submit  value="회원가입">
</td> </tr>
</table>
</form>
</div>
<br>
</section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function checkID() {
		
		// 변수 설정
		var username = $('#username').val();
		var param = { "username" : username };
		+
		// ajax 호출
		$.ajax({
			type	 :"post",			// GET, POST
			url		 :"/checkID.do",	// URL
			data     : JSON.stringify(param),
			dataType :"json",
			contentType : "application/json",
			success	 : function(data) { eventResult(data); },	// 성공
			error    : function(request, status, error) { alert(error); }	// 실패
		});
		
		// 성공 시 후처리
		function eventResult(data) {
			if(data > 0) alert("사용 불가능한 ID입니다.");
			else if(data == -1) alert("ID가 입력되지 않았습니다.");
			else alert("사용 가능한 ID입니다.");
		};
	}

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
    
    function validateForm() {
        // 필수 입력 항목을 체크하는 부분
        var name = document.getElementById("name").value;
        var username = document.getElementById("username").value;
        var address = document.getElementById("roadAddress").value;
        var tel = document.getElementsByName("tel")[0].value;
        var password = document.getElementsByName("password")[0].value;
        var confirmPassword = document.getElementsByName("confirmPassword")[0].value;

        // 필수 입력 항목이 비어있으면 경고 메시지를 표시하고 폼 제출을 막음
        if (name === "") {
            alert("회원이름을 입력하세요.");
            document.getElementById("name").focus();
            return false;
        }

        if (address === "") {
            alert("주소를 입력하세요.");
            document.getElementById("postcode").focus();
            return false;
        }

        if (tel === "") {
            alert("전화번호를 입력하세요.");
            document.getElementsByName("tel")[0].focus();
            return false;
        }
        
        if (password === "") {
            alert("암호를 입력하세요.");
            document.getElementsByName("password")[0].focus();
            return false;
        }
        
        if (password !== confirmPassword) {
            alert("암호를 다시 확인해주세요");
            document.getElementsByName("confirmPassword")[0].focus();
            return false;
        }
        
        if (!/^[a-zA-Z0-9]+$/.test(username)) {
            alert("ID는 영어와 숫자만 입력 가능합니다.");
            document.getElementById("username").focus();
            return false;
        }

        // 모든 필수 입력 항목이 채워져 있으면 폼을 제출
        return true;
    }
</script>
<c:import url="/include/bottom.jsp" />
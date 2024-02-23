<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jstl/core_rt"  prefix="c" %>     
<c:import url="/include/top.jsp" />
<style>
table {
  width:430px ; 
  height:250px;
}
</style>
<section>
<br>
<div align="center">

<h2> 소개글 등록 </h2> 
  <form  action=boardInsert.do method=post enctype="multipart/form-data" >
    <table border="1">
        <tr>
            <td align="center">제목</td>
            <td><input type="text" id="title" size="40" name="title"></td>
        </tr>
        <tr>
            <td align="center">소개글</td>
            <td><textarea id="content" name="content" rows="10" style="width: 300px;"></textarea></td>
        </tr>
        <tr>
            <td align="center">시설명</td>
            <td><input type="text" id="facility" name="facility" value="${facility}"></td>
        </tr>
        <tr>
            <td align="center">캠핑장 주소</td>
            <td><input type="text" id="roadAddress" size="40" name="roadAddress" value="${roadAddress}"></td>
        </tr>
        <tr>
            <td align="center">전화번호</td>
            <td><input type="tel" id="telephone" name="telephone" value="${telephone}"></td>
        </tr>
        <tr>
            <td align="center">사진</td>
            <td><input type="file" id="file" name="file"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="등록"></td>
        </tr>
    </table> 
  </form>
</div>
<br>
</section>
<script>
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